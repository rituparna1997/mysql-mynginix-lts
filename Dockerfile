# Use an official Nginx image as the base image
FROM nginx
# Copy the Nginx configuration file to the container
COPY nginx.conf /etc/nginx/nginx.conf
# Install the MySQL client
RUN apt-get update 
RUN apt-get install -y default-mysql-client
# Copy the script to start Nginx and connect to MySQL
COPY /start.sh /start.sh
# Make the start script executable
RUN chmod +x /start.sh
# Run the start script when the container starts
CMD ["/start.sh"]
