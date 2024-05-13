# Use the official Node.js 21 image as the base
FROM node:21

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the entrypoint script into the container
COPY entrypoint.sh /usr/src/app/entrypoint.sh

# Ensure the script is executable
RUN chmod +x /usr/src/app/entrypoint.sh

# Set the entrypoint script to run when the container starts
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]

# Default command
CMD [ "yarn", "start" ]
