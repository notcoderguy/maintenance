# Use the official Node.js image as the base image for the build stage
FROM node:18.16.0-alpine AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the entire project to the container
COPY . .

# Install the dependencies
RUN npm ci --silent

# Build the project
RUN npm run build

# Use the official Nginx image as the base image for the proxy server
FROM nginx:latest

# Set the environment variable for the server name
ENV SERVER_NAME localhost

# Copy the built files from the Node.js build stage to the Nginx web directory
COPY --from=build /app/dist /usr/share/nginx/html

# Copy the modified nginx.conf file
COPY nginx.conf.template /etc/nginx/conf.d/default.conf.template

# Entrypoint script to generate the final nginx.conf file with environment variables
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose port 80 for Nginx
EXPOSE 80

# Start Nginx
CMD ["/entrypoint.sh"]
