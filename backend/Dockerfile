# ===========================================
# STUDENT TODO: Create a Multi-Stage Dockerfile
# ===========================================
#
# Requirements:
# 1. Stage 1 (builder):
#    - Use node:18-alpine as base
#    - Set working directory
#    - Copy package files and install ALL dependencies
#    - Copy source code
#
# 2. Stage 2 (production):
#    - Use node:18-alpine as base
#    - Set working directory
#    - Copy only package files from builder
#    - Install ONLY production dependencies (hint: --only=production)
#    - Copy application code from builder
#    - Expose the correct port
#    - Set the start command
#
# Hints:
# - Research: "Docker multi-stage build Node.js"
# - Use COPY --from=builder to copy between stages
# - Final image should be as small as possible
# ===========================================

# YOUR CODE HERE:

# --- Stage 1: The "builder" stage ---
# Use a full Node.js image to build our app
FROM node:18-alpine AS builder
# Set the working directory inside the container
WORKDIR /app
# Install pnpm
RUN npm install -g pnpm
# Copy package.json and pnpm-lock.yaml (if exists)
COPY package.json pnpm-lock.yaml* ./
# Install all dependencies
RUN --mount=type=cache,id=pnpm,target=/pnpm/store \
    pnpm install --frozen-lockfile || pnpm install
# Copy the rest of the application source code
COPY . .
# (If your project has a build step, e.g., TypeScript, add it here)
# RUN npm run build
# --- Stage 2: The "production" stage ---
# Start from a fresh, lightweight base image
FROM node:18-alpine
WORKDIR /app
# Copy the package.json and install *only* production dependencies
COPY package.json pnpm-lock.yaml* ./
RUN npm install -g pnpm && \
    --mount=type=cache,id=pnpm,target=/pnpm/store \
    pnpm install --prod --frozen-lockfile || pnpm install --prod
# Copy the built app code from the "builder" stage
COPY --from=builder /app/server.js ./server.js
# (If you had a build step, you would copy the 'dist' folder instead)
# COPY --from=builder /app/dist ./dist
# Expose the port the app listens on (check your app's code, e.g.,server.js)
EXPOSE 8080 
# port 8080 follow file server
# The command to run the application (check your package.json'start' script)
CMD [ "npm", "start" ]
