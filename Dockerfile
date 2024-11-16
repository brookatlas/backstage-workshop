# Use a Debian base image
FROM debian:bullseye-slim

# Set non-interactive mode to avoid prompting during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    gnupg \
    lsb-release \
    ca-certificates \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js (adjust to desired version)
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Install additional dependencies for WebStorm or other IDE tools
# (Optional: install any additional packages your project needs)

#
