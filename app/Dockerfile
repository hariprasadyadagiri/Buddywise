# Use official Node.js image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json BEFORE npm install
COPY . .

# Install dependencies
RUN npm install

# Expose port (optional)
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
