# Portfolio personale — Gabriele Mondino

Un portfolio web (Single Page Application) sviluppato come progetto personale universitario. Frontend in React + Vite, backend in Node.js/Express e dati memorizzati in SQLite.

Questo repository contiene il codice del sito, il server API che fornisce i contenuti in modalità multilingua (it/en) e lo schema SQL per popolare il database locale.

## Cosa c'è qui
- `client/` – codice frontend React (Vite)
- `server/` – server Node.js (Express) + accesso a SQLite

## Tecnologie
- Frontend: React, Vite, React-Bootstrap
- Backend: Node.js, Express, sqlite3
- Styling: CSS + Bootstrap icons

## Requisiti
- Node.js v16+ (consigliato)

## Setup e avvio (sviluppo)

1) Installa dipendenze

```powershell
# Dal root del repository
cd server
npm install

cd ..\client
npm install
```

2) Avvia server e client (in terminali separati)

```powershell
# Terminale 1 — server (porta 3001)
cd server
npm run dev

# Terminale 2 — client (porta 5173)
cd client
npm run dev
```

2) Deploy rapido sulla VM (workflow minimo — copia/incolla)

Dal tuo PC (PowerShell) — costruisci, salva e trasferisci le immagini + file di deploy sulla VM:

```powershell
cd "c:\Users\gabri\OneDrive\Documenti\Portfolio\scripts"; powershell -NoProfile -ExecutionPolicy Bypass -File .\deploy_local.ps1
ssh -i "c:\Users\gabri\OneDrive\Documenti\Portfolio\ssh-key-2025-10-10.key" ubuntu@129.152.14.247 "bash ~/deploy_vm.sh portfolio-images.tar"

# 3) Se hai modificato solo la Caddyfile: ricrea solo caddy (plugin -> legacy -> run)
sudo docker compose up -d --no-deps --force-recreate caddy || \
  sudo docker-compose up -d --no-deps --force-recreate caddy || \
  (sudo docker rm -f caddy || true; sudo docker run -d --name caddy --restart unless-stopped --network portfolio_net -p 80:80 -p 443:443 -v ~/Portfolio/app/Caddyfile:/etc/caddy/Caddyfile:ro -v caddy_data:/data -v caddy_config:/config caddy:2)

# 4) Controlli e pulizia
sudo docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
sudo docker logs --tail 200 caddy
rm ~/portfolio-images.tar || true
```

## Database (SQLite)
- Lo schema si trova in `server/database/schema.sql`.
- Il db locale si trova in `server/database/portfolio.sql`.
- Se il server rileva che lo schema è più recente del DB, ricrea il DB. ATTENZIONE: la ricreazione è distruttiva per i dati locali.

## API principali
- `GET /api/portfolio/:lang` — ritorna tutti i dati per la lingua richiesta (`it` o `en`)

Esempio: `GET http://localhost:3001/api/portfolio/it`

## Internazionalizzazione
- I contenuti leggono `language` (`it` / `en`) e il server restituisce i testi corrispondenti (personal_info, education, courses, projects, skills, certifications).

## Contatti
- Autore: Gabriele Mondino
- Email: gabrielemondino05@gmail.com
