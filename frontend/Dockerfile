# Use an official Node.js runtime as a parent image
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the public directory and all the necessary files into the container
#COPY ./frontend/todo/public /app/public
#COPY ./frontend/todo/src /app/src
COPY /frontend/todo/package.json /app/package.json
COPY /frontend/todo/package-lock.json /app/package-lock.json


# Install dependencies
RUN npm install

# Start the app
CMD ["npm", "start"]
