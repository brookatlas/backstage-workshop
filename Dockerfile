# Use the Docker in Docker image as the base
FROM docker:20.10-dind

# Install dependencies and Node.js 18 LTS
RUN apk update && apk add --no-cache \
    curl \
    bash \
    && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apk add --no-cache nodejs=18.* npm \
    && rm -rf /var/cache/apk/*

# Set default shell to bash
SHELL ["/bin/bash", "-c"]

# Verify installation
RUN node --version && npm --version
