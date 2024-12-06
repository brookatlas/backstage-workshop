# Use a Debian base image
FROM debian:bullseye-slim

# Set non-interactive mode to avoid prompting during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    wget \
    gnupg \
    lsb-release \
    ca-certificates \
    build-essential \
    postgresql \
    postgresql-contrib \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js (adjust to desired version)
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Install yq
RUN wget https://github.com/mikefarah/yq/releases/download/v4.44.5/yq_linux_amd64 -O /usr/bin/yq && chmod +x /usr/bin/yq

# Install Yarn
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | tee /etc/apt/trusted.gpg.d/yarn.asc
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn && rm -rf /var/lib/apt/lists/*

WORKDIR /workspaces/backstage-workshop

# Set default command for the container to start PostgreSQL and Node.js
CMD ["bash"]
