# Portfolio Studente Universitario

Un portfolio web single-page per studenti universitari di Informatica, sviluppato con React (frontend) e Express (backend).

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
Segui questi passaggi nella tua shell (PowerShell su Windows consigliato).

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
