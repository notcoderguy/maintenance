# Use the official Node.js image as the base image
FROM node:18.16.0-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the entire project to the container
COPY . .

# Install the dependencies
RUN npm ci --silent

# Build the project
RUN npm run build

# Install serve package globally
RUN npm install -g serve

# Start the server
CMD ["serve", "-s", "dist"]
