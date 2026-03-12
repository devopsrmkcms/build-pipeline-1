FROM node:18-alpine

# Fix: Install git (needed for npm ci with package-lock.json)
RUN apk add --no-cache git

WORKDIR /app

# Copy package files first (for caching)
COPY package*.json ./

# Fix: Use npm install --production instead of npm ci --only=production
RUN npm ci --omit=dev --no-audit --no-fund

# Copy source code
COPY . .

EXPOSE 3000
CMD ["node", "server.js"]
