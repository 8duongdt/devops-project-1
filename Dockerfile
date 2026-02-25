# --- Stage 1: The "builder" stage ---
# Use a full Node.js image to build our app
FROM node:18-alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock)
COPY package*.json ./

# Install all dependencies (including devDependencies)
RUN npm install

# Copy the rest of the application source code
COPY . .

# (If your project has a build step, e.g., TypeScript, add it here)
# RUN npm run build