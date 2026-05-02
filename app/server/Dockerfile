FROM node:22-alpine

WORKDIR /app

# Install build dependencies for native modules (sqlite3)
RUN apk add --no-cache python3 make g++ ca-certificates curl

COPY server/package*.json ./
RUN npm ci --omit=dev

# Remove build dependencies after npm install
RUN apk del python3 make g++

COPY server/ ./

ENV PORT=3001
ENV DB_PATH=/app/data/portfolio.db
EXPOSE 3001

# Uso npm start per includere l'esecuzione del seed definita nel package.json
CMD ["npm", "start"]
