SELECT cfp.register('test user', 'test@example.com', 'password');

SELECT assert_eq((SELECT name FROM cfp.user WHERE name = 'test user'), 'test user');
SELECT assert_eq((SELECT is_reviewer FROM cfp.user WHERE name = 'test user'), FALSE);

SELECT assert_eq((cfp.authenticate('test@example.com', 'password')).role, 'user');
