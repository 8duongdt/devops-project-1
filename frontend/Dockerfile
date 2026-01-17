# ===========================================
# STUDENT TODO: Create Frontend Dockerfile
# ===========================================
#
# Requirements:
# 1. Must use multi-stage build
# 2. Stage 1 (builder):
#    - Use node:18-alpine
#    - Install dependencies with npm ci
#    - Build the React app with npm run build
#
# 3. Stage 2 (production):
#    - Use node:18-alpine
#    - Install 'serve' package globally to serve static files
#    - Copy only the build folder from builder stage
#    - Expose port 3000
#    - Use serve to run the app
#
# Hints:
# - npm run build creates a 'build' folder
# - serve -s build -l 3000 serves the static files
# - Research: "Docker multi-stage React production"
# ===========================================

# YOUR CODE HERE:

# --- Stage 1: The "builder" stage ---
FROM node:18-alpine AS builder
WORKDIR /app

# 1. Copy package files và cài dependencies
COPY package*.json ./
RUN npm install

# 2. Copy source code
COPY . .

# 3. Build ứng dụng React ra file tĩnh (tạo thư mục /app/build)
RUN npm run build

# --- Stage 2: The "production" stage ---
FROM node:18-alpine
WORKDIR /app

# 1. Cài đặt 'serve' global để chạy static files (Theo yêu cầu đề bài)
RUN npm install -g serve

# 2. Copy thư mục 'build' từ Stage 1 sang Stage 2
# Lưu ý: React Script thường build ra folder tên là 'build' (khác với Vite là 'dist')
COPY --from=builder /app/build ./build

# 3. Expose port 3000
EXPOSE 3000

# 4. Chạy lệnh serve trỏ vào thư mục build
CMD [ "serve", "-s", "build", "-l", "3000" ]