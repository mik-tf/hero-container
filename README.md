<h1> ThreeFold Hero Container</h1>

<h2> Table of Contents</h2>

- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Build the Image](#build-the-image)
- [Pull the Image from Docker Hub](#pull-the-image-from-docker-hub)
- [Run the Container](#run-the-container)
- [Launch the Hero Website](#launch-the-hero-website)
- [Publish a Website](#publish-a-website)

## Introduction

A Docker-based development environment for Hero development with essential tools and configurations. This container comes pre-installed with Bun, Redis, and the Hero CLI.

## Prerequisites

- Docker installed on your system
- SSH keys for deploying Hero websites (if publishing)

## Build the Image

Build the Docker image:
```bash
docker build -t heroc .
```

## Pull the Image from Docker Hub

If you don't want to build the image, you can pull it from Docker Hub. Simply use `logismosis/heroc` instead of `heroc` below.

## Run the Container

Run the container with an interactive shell, mounting your current directory as the workspace and your SSH keys:

```bash
docker run --network=host \
  -v $(pwd):/workspace \
  -v ~/.ssh:/root/ssh \
  -it heroc
```

By default, the container will:
- Start Redis server in the background
- Copy your SSH keys to the proper location
- Initialize the SSH agent
- Add your default SSH key (id_ed25519)

To use a different SSH key, specify it with the KEY environment variable (e.g. `KEY=id_ed25519`):

```bash
docker run --network=host \
  -v $(pwd):/workspace \
  -v ~/.ssh:/root/ssh \
  -e KEY=your_custom_key_name \
  -it heroc
```

## Launch the Hero Website

To start a Hero Docusaurus website in development mode:

```bash
hero docusaurus -d
bash /root/hero/var/docusaurus/develop.sh
```

You can then view the website in your browser.

## Publish a Website

- To build and publish a Hero website:
  - Development
    ```bash
    hero docusaurus -bpd
    ```
  - Production
    ```bash
    hero docusaurus -bp
    ```

If you want to specify a different SSH key, use `-dk`:

```bash
hero docusaurus -bpd -dk ~/.ssh/id_ed25519
```

> Note: The container handles the SSH agent and key management automatically on startup, so in most cases, you won't need to manually specify keys.