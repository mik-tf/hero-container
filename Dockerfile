# Use Ubuntu latest as base image
FROM ubuntu:latest

# Install required packages
RUN apt-get update && \
    apt-get install -y \
    curl \
    libatomic1 \
    screen \
    sudo && \
    rm -rf /var/lib/apt/lists/*

# Install Hero binary
RUN curl -o /usr/local/bin/hero -L https://github.com/freeflowuniverse/herolib/releases/download/v1.0.14/hero-aarch64-unknown-linux-musl
RUN chmod +x /usr/local/bin/hero

# Set working directory
WORKDIR /workspace

# Set bash as the entry point
ENTRYPOINT ["/bin/bash"]