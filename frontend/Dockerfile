# Use Node.js base image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json first for caching
COPY frontend/todo/package*.json ./

# Install dependencies
RUN npm install

# Copy remaining source files
COPY frontend/todo/ .

# Expose port if needed
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
