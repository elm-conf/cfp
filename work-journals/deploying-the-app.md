# Deploying the App

Goals for today:

- deploy the CFP app code to the nix host
- get the CFP app code running as a service

## Building locally

So I've never set up a `default.nix`. I think I'll need to do that first. Gonna consult with the internet about how to make a service so I do it correctly.

I'm back. The internet wasn't super helpful; it's telling me to run nixops. But that doesn't appear to work on macOS (at least not without having a build worker.) It also looks like it's designed to deploy a fleet, not a single application. Let's try this myself; I want to understand what's going on anyway.

## Making a `default.nix`

So if I understand correctly, I'll need to make something that outputs the right info to `$out/bin/cfp`. Let's try.

...

and, two days later, I understand a lot more about nix packaging. But, I think I've done it! (But I might have broken it just a little for development.)

now I think I can ask the nixos machine to require a git repository and install the derivation! Exciting!

adding this to `configuration.nix`

```nix
  app = fetchFromGitHub {
    owner = "elm-conf";
    repo = "cfp";
    rev = "360a349cbff86e44c91d3b1c641d0bbf96ea9d86";
    sha256 = "0p354x0a033z2nfbmxg0p5vrgpnhdmfklsf69n50km6asyfymva2";
  };
```

that didn't work. Well, the [manual says](https://nixos.org/nixos/manual/index.html#sec-custom-packages) I can have a nix file on disk and just import it, so let's try just cloning it (`nix-env -i git` in the process)...

That seems to have worked!

```nix
let
  app = import /root/cfp { };
in
  {
    environment.systemPackages = [ app ];
    # the rest of the file
  }
```

`nixos-rebuild test` and it all got built! Yippee!
