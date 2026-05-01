# Personal Portfolio - Full-stack React + Express

Single Page Application (SPA) portfolio built as a personal university project.

- Frontend: React + Vite
- Backend: Node.js + Express
- Data: SQLite local file DB
- Content: server-driven and bilingual (`it` / `en`)

## Repository Structure

- `client/`: React (Vite) app
- `server/`: Express API, SQLite access, static images
- `server/database/schema.sql`: database schema
- `server/database/seed.sql`: demo seed data
- `.github/workflows/ci.yml`: GitHub Actions CI for format, lint and build

## Features

- Bilingual content (`it` / `en`) served by the API
- One endpoint to fetch the whole portfolio dataset
- Static project images served by the backend under `/images`
- Runtime SQLite database generated from schema + seed files
- Basic production hardening with Helmet, API rate limiting and configurable CORS

## Tech Stack

- Frontend: React, Vite, React-Bootstrap
- Backend: Node.js, Express, sqlite3
- Styling: CSS, Bootstrap Icons
- Tooling: ESLint, Prettier, GitHub Actions
- Deployment: Docker, Nginx client image, Caddy reverse proxy

## Requirements

- Node.js 22+ recommended, Node.js 18+ minimum for local development
- npm

## Environment Variables

Copy `.env.example` when you need local overrides:

```powershell
Copy-Item .env.example .env
```

Available variables:

- `PORT`: server port. Default: `3001`.
- `NODE_ENV`: use `production` to enable production CORS allowlist behavior.
- `CORS_ORIGINS`: comma-separated list of allowed browser origins in production, for example `https://example.com,https://www.example.com`.
- `DB_RESET`: set to `1` to delete and recreate the SQLite DB on startup.
- `DB_RESET_ON_SCHEMA_CHANGE`: set to `1` to recreate the DB when schema/seed files are newer than the DB file.
- `DB_RESET_ON_INCOMPATIBLE_SCHEMA`: defaults to enabled. Set to `0` to disable automatic reset for incompatible local schemas.

## Local Development

Install dependencies from the repository root:

```powershell
npm install
npm --prefix server install
npm --prefix client install
```

Run server and client together:

```powershell
npm run dev
```

Or run them in two separate terminals:

```powershell
# terminal 1 - API server (default: http://localhost:3001)
npm --prefix server run dev

# terminal 2 - Vite dev server (http://localhost:5173)
npm --prefix client run dev
```

Open the app:

- UI: http://localhost:5173
- API example: http://localhost:3001/api/portfolio/it

Vite is configured to proxy `/api` and `/images` to the backend during development.

## Quality Commands

```powershell
npm run format
npm run format:check
npm run lint
npm run build
```

VS Code users can keep format-on-save enabled with the workspace settings in `.vscode/settings.json`.

## API

### Get Full Portfolio Data

`GET /api/portfolio/:lang`

- `:lang` must be `it` or `en`
- Response includes personal info, education, courses, exams, projects with technologies and images, skills, certifications

Example:

```text
GET http://localhost:3001/api/portfolio/en
```

### Static Images

Images are served from the backend at:

`GET /images/...`

The files live under `server/public/images`.

## Database (SQLite)

- Schema: `server/database/schema.sql`
- Demo seed data: `server/database/seed.sql`
- Optional private/local seed overrides: `server/database/seed.local.sql`
- Runtime database file: `server/database/portfolio.db`

The SQLite database is derived content. It is created locally from `schema.sql` and `seed.sql`, and should not be committed. The `.gitignore` excludes `server/database/portfolio.db` and other SQLite runtime files.

The public seed is intentionally demo content. To initialize the DB with your real personal data without committing it:

```powershell
Copy-Item server/database/seed.local.example.sql server/database/seed.local.sql
```

Then edit `server/database/seed.local.sql`. It is ignored by git and is applied after `seed.sql`, so it can override demo placeholders with your real public contact/profile data.

On startup:

- If the database does not exist or has no tables, the server applies `schema.sql`, then `seed.sql`, then optional `seed.local.sql`.
- If an older or incompatible schema is detected, the server can reset the DB to match the current schema.
- In local development, use the reset flags above when you want a fresh DB after changing schema or seed data.

Manual seeding from the repository root:

```powershell
npm run seed
npm run seed:reset
```

## Security Notes

- CORS is open in development for convenience.
- In production, set `NODE_ENV=production` and configure `CORS_ORIGINS` with your real frontend domain.
- Helmet is enabled globally for standard security headers.
- A light rate limit is applied only under `/api`.

## Docker

This repo includes Dockerfiles for both client and server.

### Compose Files

- `docker-compose.yml`: starts `server` and `client`; only the API is published on the host (`3001:3001`).
- `docker-compose.prod.yml`: starts `server`, `client` and `caddy`; Caddy publishes ports 80/443 and routes traffic to the correct container.

### Production-like Stack

Use `docker-compose.prod.yml`:

```powershell
docker compose -f docker-compose.prod.yml up -d --build
```

Configure your domain in `Caddyfile`. The default file is set up to:

- forward `/api/*` to the server container
- forward `/images/*` to the server container
- forward all other paths to the client container

### Notes

- The server database folder is persisted via a Docker volume (`db_data`).
- Health check uses `GET /api/portfolio/it` on port 3001.

## Contributing / Dev Notes

- Prefer root scripts (`npm run dev`, `npm run lint`, `npm run build`) so local workflow matches CI.
- Keep generated artifacts out of git: `node_modules`, `client/dist`, logs and SQLite DB files are ignored.
- If API data looks stale after editing `seed.sql` or `seed.local.sql`, run `npm run seed:reset` or start the server with `DB_RESET=1`.
- If production requests fail due to CORS, check that `NODE_ENV=production` and `CORS_ORIGINS` exactly match the deployed frontend origin.
- Project content is normalized across schema tables; update both base records and translation rows when adding bilingual entries.

## Contact

- Author: replace the demo seed placeholders with your public contact details before deploying.
