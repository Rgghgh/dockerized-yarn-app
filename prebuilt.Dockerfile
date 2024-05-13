FROM node:21

# Create and change to the app directory
WORKDIR /usr/src/app

# Arguments defined for cloning and building
ARG SSH_PRIVATE_KEY
ARG REPO

# handling private SSH keys and cloning the repo
RUN mkdir -p /root/.ssh && \
    echo "${SSH_PRIVATE_KEY}" > /root/.ssh/id_rsa && \
    chmod 600 /root/.ssh/id_rsa && \
    ssh-keyscan github.com >> /root/.ssh/known_hosts && \
    git clone $REPO . && \
    rm -rf /root/.ssh

# Install dependencies and build the project
RUN yarn install && \
    yarn build

# Command to run the application
CMD [ "yarn", "start" ]
