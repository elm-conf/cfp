A work log of Brian trying to deploy to DigitalOcean on 2019-03-29

# Deploying to DigitalOcean

Looks like I can maybe use [nixos-infect](https://github.com/elitak/nixos-infect) to get a nixos installation on DigitalOcean, and go from there.

Gonna try and provision something with Terraform, I guess?

Nah, I'll just use `doctl`. Having trouble finding the token in DO's site...

Ah, the README says where it is: https://github.com/digitalocean/doctl#authenticating-with-digitalocean

Created an SSH key with my account:

```
doctl compute ssh-key import flame-2019-03-29 --public-key-file ~/.ssh/id_rsa.pub
```

gonna try and make a compute instance with that and nixos-infect next.

Need image, region, size.
Need to create a volume first.

- image: `doctl compute image list --public` (nixos-infect says Ubuntu 16.04 or Fedora 24. Choosing `ubuntu-16-04-x64`)
- region: `doctl compute region list` (`nyc1`)
- size: `doctl compute size list` (`s-1vcpu-1gb`, but they have the old sizes/prices in there? Alright then.)

OK, gonna get the user data file set up now...

Vendoring the latest nixos-infect script into a userdata file so I have a snapshot of what runs/ran. Gonna add a notice at the top that it's licensed GPL for freedom 'n stuff.

(it's `iac/nixos-infect-userdata.yml`)

OK, now for the volume...

```
NOT FINAL

doctl compute volume create cfp-postgres \
    --desc 'postgres storage for CFP app' \
    --region nyc1 \
    --size 512GiB
```

but that doesn't work. What? Why? It's just a 403 forbidden. Maybe the region is wrong? Let's try `nyc3`.

```
NOT FINAL

doctl compute volume create cfp-postgres \
    --desc 'postgres storage for CFP app' \
    --region nyc3 \
    --size 512GiB
```

Now a 500. What if it's because the volume name has a hyphen in it?

... that's a 503. On retry, a 403. What even.

I guess I'll just make it with the web UI.

AH HA. The web UI says "You don't have any droplets in regions that support volumes." Then why doesn't the API take a volume ID? I guess you attach it manually or…?

Anyway let's create the droplet without the volume, I guess, and attach it later. Gonna stick with `nyc3` though… I remember maybe it was more modern or something a while ago. Can switch later if needed.

```
NOT FINAL

doctl compute droplet create cfp \
    --enable-backups \
    --enable-ipv6 \
    --enable-monitoring \
    --image ubuntu-16-04-x64 \
    --region nyc3 \
    --size s-1vcpu-1gb \
    --user-data-file iac/nixos-infect-userdata.yml \
```

Success! Now let's try creating that volume again… still an error. Gonna iterate here until I find something that works.

```
WORKING!

doctl compute volume create cfp-postgres \
    --desc 'postgres storage for CFP app' \
    --region nyc3 \
    --size 10GiB
```

AH HA! That finally worked. I guess it took a little bit for the APIs to get in sync. It's a big datacenter, after all. (later: oohhh, could have used the `--wait` flag to `doctl compute droplet create`.)

(p.s. their default volume size is 4TiB… according to their calculator that's $400/mo. Yikes! Why is it the default? That seems scary!)

I've chosen 10GiB for $1/mo. Right now the total cost for a month is $11. Not bad, since I'm trying to beat Heroku's private DB cost.

OK, let's attach the volume. But maybe first I should SSH into the droplet to see if the userscript worked. Ahhh boo, I've forgotten to add my SSH key. OK, delete and start over.


```
WORKING!

doctl compute droplet create cfp \
    --enable-backups \
    --enable-ipv6 \
    --enable-monitoring \
    --ssh-keys 24258235 \
    --image ubuntu-16-04-x64 \
    --region nyc3 \
    --size s-1vcpu-1gb \
    --user-data-file iac/nixos-infect-userdata.yml
```

OK, I was able to SSH into that one (found the IP by doing `doctl compute droplet list` and sshing it as `root@IP`.)

Watched the infection log scroll by by doing `tail -f /tmp/infect.log`. It downloaded a lot. Ah ha! After a restart, it works! 🎉

Last thing: let's attach the volume: `doctl compute volume-action attach <volume-id> <droplet-id>`.

# Nixing!

Gotta get vim: `nix-env -iA nixos.vim`

Let's get the volume mounted and formatted.

format it: `sudo mkfs.ext4 /dev/disk/by-id/scsi-0DO_Volume_cfp-postgres` (found the instructions in the "Configure" thing in the web UI)

mount it: adding stuff to `/etc/nix/configuration.nix`:

```nix
fileSystems."/mnt/postgres" = {
  device = "/dev/disk/by-id/scsi-0DO_Volume_cfp-postgres";
  fsType = "ext4";
};
```

after a `nixos-rebuild test`, `/mnt/postgres` exists! Hooray!

Now how to make it permanent? I think it's `nixos-rebuild switch`. And, that did it!

OK, let's configure postgres now!

# Postgres

```nix
services.postgresql.enable = true;
services.postgresql.enableTCPIP = false; # we're OK connecting on localhost
services.postgresql.dataDir = "/mnt/postgres/data";
```

that didn't work with `nixos-rebuild test`. The service failed to start. It says:

> initdb: directory "/mnt/postgres" exists but is not empty
> It contains a lost+found directory, perhaps due to it being a mount point.
> Using a mount point directly as the data directory is not recommended.
> Create a subdirectory under the mount point.

Okey doke. Added `/db` to `dataDir` above.

Aaaand it just works. Amazing!
