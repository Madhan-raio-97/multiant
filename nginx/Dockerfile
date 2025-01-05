# Dockerfile for Nginx

# Step 1: Use the official Nginx image from the Docker Hub
FROM nginx:alpine

# Step 2: Remove the default Nginx configuration
RUN rm /etc/nginx/conf.d/default.conf

# Step 3: Copy the custom Nginx configuration file to the container
COPY default.conf /etc/nginx/conf.d/

# Step 4: Expose port 80 (the default port for HTTP)
EXPOSE 80

# Step 5: Start Nginx in the foreground (this is the default behavior for Nginx)
CMD ["nginx", "-g", "daemon off;"]
