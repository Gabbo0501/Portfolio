BEGIN TRANSACTION;

-- Copy this file to server/database/seed.local.sql and edit it with your real
-- public portfolio data. seed.local.sql is ignored by git and is applied after
-- seed.sql, so these rows override the demo placeholders.

UPDATE personal_info
SET
  name = 'Your Real Name',
  bio = 'Your Italian public bio.',
  email = 'you@example.com',
  phone = '+390000000000',
  location = 'Your City, Italy',
  linkedin = 'https://www.linkedin.com/in/your-profile',
  github = 'https://github.com/your-username'
WHERE language = 'it';

UPDATE personal_info
SET
  name = 'Your Real Name',
  bio = 'Your English public bio.',
  email = 'you@example.com',
  phone = '+390000000000',
  location = 'Your City, Italy',
  linkedin = 'https://www.linkedin.com/in/your-profile',
  github = 'https://github.com/your-username'
WHERE language = 'en';

COMMIT;
