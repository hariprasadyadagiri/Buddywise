# Use an official Node.js image as base
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /frontend

# Copy only package.json and package-lock.json first
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the React app (optional, if needed)
# RUN npm run build

# Expose the port your app runs on (e.g., 3000 for React)
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
