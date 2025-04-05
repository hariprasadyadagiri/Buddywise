# Use official Node.js image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json BEFORE npm install
COPY frontend/todo/package*.json ./

# Install dependencies
RUN npm install

# Copy all source code AFTER npm install
COPY frontend/todo/ .

# Expose port (optional)
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
