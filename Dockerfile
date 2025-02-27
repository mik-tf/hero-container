FROM ubuntu:24.04

# Install system dependencies
RUN apt update && apt install -y curl libatomic1 sudo autoconf libtool iputils-ping net-tools git rsync curl mc tmux libsqlite3-dev xz-utils git git-lfs redis-server ufw screen fswatch unzip

# Install Bun
RUN curl -fsSL https://bun.sh/install | bash

# Add Bun to PATH for all users
ENV PATH="/root/.bun/bin:${PATH}"

# Install Hero
RUN curl -o /usr/local/bin/hero -L https://github.com/freeflowuniverse/herolib/releases/download/v1.0.21/hero-aarch64-unknown-linux-musl
RUN chmod +x /usr/local/bin/hero

WORKDIR /workspace

# Start Redis and provide a bash shell
ENTRYPOINT ["bash", "-c", "redis-server &> /var/log/redis.log & disown && exec bash"]