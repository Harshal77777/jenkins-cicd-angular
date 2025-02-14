# Use official Node.js image
FROM node:18 AS builder

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies and cache them
RUN npm ci --only=production

# Copy source files
COPY . .

# Build Angular app
RUN npm run build --prod

# Use Nginx for serving static files
FROM nginx:alpine
COPY --from=builder /app/dist/angular-app /usr/share/nginx/html
