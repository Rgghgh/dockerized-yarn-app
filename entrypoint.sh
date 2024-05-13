#!/bin/bash

# Setup SSH for private repository access
mkdir -p /root/.ssh
echo "$SSH_PRIVATE_KEY" > /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa
ssh-keyscan github.com >> /root/.ssh/known_hosts

# Clone the repository
git clone $REPO .

# Install dependencies
yarn install

# Generate Prisma client
yarn prisma generate

# Execute the main command (e.g., "yarn start")
exec "$@"
