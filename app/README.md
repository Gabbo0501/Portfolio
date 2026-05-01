# Personal Portfolio — Gabriele Mondino

Single Page Application (SPA) portfolio built as a personal university project.

- Frontend: React + Vite
- Backend: Node.js + Express
- Data: SQLite (local file DB)
- Content: server-driven and bilingual (`it` / `en`)

## Repository structure

- `client/`: React (Vite) app
- `server/`: Express API + SQLite access + static images

## Features

- Bilingual content (`it` / `en`) served by the API
- One endpoint to fetch the whole portfolio dataset
- Static project images served by the backend under `/images`

## Tech stack

- Frontend: React, Vite, React-Bootstrap
- Backend: Node.js, Express, sqlite3
- Styling: CSS, Bootstrap Icons
- Deployment: Docker, Nginx (client image), Caddy (reverse proxy)

## Requirements

- Node.js 18+ (recommended)
- npm

## Local development

1) Install dependencies

```powershell
# from the repository root
cd server
npm install

cd ..\client
npm install
```

2) Run server and client (two terminals)

```powershell
# terminal 1 — API server (default: http://localhost:3001)
cd server
npm run dev

# terminal 2 — Vite dev server (http://localhost:5173)
cd client
npm run dev
```

3) Open the app

- UI: http://localhost:5173
- API example: http://localhost:3001/api/portfolio/it

Vite is configured to proxy `/api` and `/images` to the backend during development.

## API

### Get full portfolio data

`GET /api/portfolio/:lang`

- `:lang` must be `it` or `en`
- Response includes personal info, education, courses, exams, projects (with technologies + images), skills, certifications

Example:

```text
GET http://localhost:3001/api/portfolio/en
```

### Static images

Images are served from the backend at:

`GET /images/...`

The files live under `server/public/images`.

## Database (SQLite)

- Schema (DDL only): `server/database/schema.sql`
- Seed data: `server/database/seed.sql`
- Database file (created at runtime): `server/database/portfolio.db`

On startup:

- If the database does not exist (or has no tables), it is initialized by applying `schema.sql` and then `seed.sql`.
- If an older/incompatible schema is detected, the server resets the DB to match the current schema (this project treats the DB as derived content).

Optional env flags:

- `DB_RESET=1`: always delete the DB on startup
- `DB_RESET_ON_SCHEMA_CHANGE=1`: delete the DB if schema/seed files are newer than the DB file
- `DB_RESET_ON_INCOMPATIBLE_SCHEMA=0`: disable the automatic reset when an incompatible schema is detected

Manual seeding (from `server/`):

```powershell
npm run seed
npm run seed:reset
```

## Docker

This repo includes Dockerfiles for both client and server.

### Compose files

- `docker-compose.yml`: starts `server` and `client`, but only the API is published on the host (`3001:3001`). The client is exposed only inside the Docker network.
- `docker-compose.prod.yml`: starts `server` + `client` + `caddy`, and Caddy publishes ports 80/443 and routes traffic to the correct container.

### Production-like stack (with reverse proxy)

Use `docker-compose.prod.yml` (server + client + Caddy):

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

## Contact

- Author: Gabriele Mondino
- Email: gabrielemondino05@gmail.com
