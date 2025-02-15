# Use official Node.js image for building
FROM node:18 AS build

WORKDIR /app

# Copy only package files first (to leverage Docker cache)
COPY package.json package-lock.json ./

# Install dependencies (cached if package.json is unchanged)
RUN npm ci --legacy-peer-deps

# Copy the rest of the app and build
COPY . .
RUN npm run build --prod

# Use Nginx to serve the Angular app
FROM nginx:latest
COPY --from=build /app/dist/your-angular-app /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
