# Use the official Node.js image as the base image
FROM node:18.16.0-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package.json package-lock.json ./

# Install the dependencies
RUN npm ci --silent

# Copy the source code to the container
COPY . .

# Build the project
RUN npm run build

# Install serve package globally
RUN npm install -g serve

# Expose port 80 for serving the built files
EXPOSE 80

# Start the server
CMD ["serve", "-s", "dist"]