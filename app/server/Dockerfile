FROM node:18-alpine

WORKDIR /app

# Install build dependencies for native modules (sqlite3)
RUN apk add --no-cache python3 make g++ ca-certificates

COPY server/package*.json ./
RUN npm install --production

# Remove build dependencies after npm install
RUN apk del python3 make g++

COPY server/ ./

ENV PORT=3001
EXPOSE 3001

CMD ["node", "index.mjs"]
