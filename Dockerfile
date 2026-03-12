FROM node:18-alpine

# Install git + build tools (required for some packages)
RUN apk add --no-cache git python3 make g++

WORKDIR /app

# Copy package files
COPY package*.json ./

# ✅ FIXED: Use npm install with legacy peer deps
RUN npm install --production --legacy-peer-deps --no-audit --no-fund

# Copy app code
COPY . .

EXPOSE 3000
CMD ["node", "server.js"]
