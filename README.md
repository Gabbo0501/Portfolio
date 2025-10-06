# Portfolio Studente Universitario

Un portfolio web single-page per studenti universitari di Informatica, sviluppato con React (frontend) e Express (backend).

## 🚀 Tecnologie Utilizzate

### Frontend
# Portfolio personale — Gabriele Mondino

Un portfolio web (Single Page Application) sviluppato come progetto personale universitario. Frontend in React + Vite, backend in Node.js/Express e dati memorizzati in SQLite.

Questo repository contiene il codice del sito, il server API che fornisce i contenuti in modalità multilingua (it/en) e lo schema SQL per popolare il database locale.

## Cosa c'è qui
- `client/` – codice frontend React (Vite)
- `server/` – server Node.js (Express) + accesso a SQLite
- `server/database/schema.sql` – schema e seed data per il DB
- `server/database/portfolio.db` – file DB generato in locale

## Tecnologie
- Frontend: React, Vite, React-Bootstrap
- Backend: Node.js, Express, sqlite3
- Styling: CSS + Bootstrap icons

## Requisiti
- Node.js v16+ (consigliato)
- npm o yarn

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

Nota: lo script `npm run dev` potrebbe usare `nodemon` o `vite` a seconda dei pacchetti installati.

## Database (SQLite)
- Lo schema si trova in `server/database/schema.sql`.
- Se il server rileva che lo schema è più recente del DB, può ricreare il DB (se presente una logica di inizializzazione). ATTENZIONE: la ricreazione è distruttiva per i dati locali.
- Se vuoi aggiornare il DB senza cancellarlo, usa comandi SQLite per aggiungere colonne (es. `ALTER TABLE`) oppure popola manualmente usando `sqlite3`.

Consiglio rapido per ricreare (distruttivo)

```powershell
# Fermare il server
cd server
Remove-Item .\database\portfolio.db -Force -ErrorAction SilentlyContinue
# Avviare il server per far partire l'inizializzazione dal schema
npm run dev
```

## API principali
- `GET /api/portfolio/:lang` — ritorna tutti i dati per la lingua richiesta (`it` o `en`)

Esempio: `GET http://localhost:3001/api/portfolio/it`

## Internazionalizzazione
- I contenuti leggono `language` (`it` / `en`) e il server restituisce i testi corrispondenti (personal_info, education, courses, projects, skills, certifications).

## Modificare i contenuti
- Per aggiungere/modificare dati persistenti, aggiorna `server/database/schema.sql` (sezioni INSERT) e ricrea il DB o usa `sqlite3` per operazioni mirate.

## Sviluppo e debugging rapido
- Controlla i log del server (console) per errori SQL o mancati campi.
- Se vedi errori come `no such column` o `no such table`, significa che lo schema e il DB non sono in sync.

## Suggerimenti utili
- Mantieni il DB all'interno di `server/database` per semplicità.
- Non committare il file `portfolio.db` con dati sensibili; se vuoi, aggiungilo a `.gitignore`.

## Contribuire
- Forka il repository, crea una branch feature, apri una Pull Request.
- Se apporti modifiche allo schema SQL, documentalo nel README e fornisci istruzioni per migrazione.

## Troubleshooting (problemi comuni)
- Errore `SQLITE_ERROR: 8 values for 6 columns`: controlla gli INSERT in `server/database/schema.sql` — il numero di colonne dichiarate deve corrispondere ai valori.
- Errore `SQLITE_MISUSE: Database is closed`: potrebbe essere dovuto a logica che chiude il db e poi lo usa; riavviare il server dopo ricreazione DB aiuta.

## Contatti
- Autore: Gabriele Mondino
- Email: gabriele.mondino@studenti.polito.it

---

Se vuoi, posso aggiungere una sezione in inglese o includere istruzioni CI/CD per deploy su Vercel / Railway.