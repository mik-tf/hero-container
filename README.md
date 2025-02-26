<h1>ThreeFold Hero Development Environment Container</h1>
<h2>Table of Contents</h2>

- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Build the Image](#build-the-image)
- [Run the Container](#run-the-container)
- [Launch the Hero Website](#launch-the-hero-website)
- [Publish a Website](#publish-a-website)

## Introduction

A Docker-based development environment for Hero development with essential tools and configurations.
## Prerequisites

- Docker installed on your system

## Build the Image

- Build the image
  ```bash
  docker build -t hero-dev .
  ```

## Run the Container

- Run the container with an interactive shell and local directory from the Hero Docusaurus repository.
  ```
  docker run --network=host \
    -v $(pwd):/workspace \
    -v ~/.ssh:/root/ssh \
    -it hero-dev
  ```
- Copy the SSH keys
  ```
  cp -r /root/ssh /root/.ssh
  ```

## Launch the Hero Website

```
hero docusaurus -d
bash /root/hero/var/docusaurus/develop.sh
```

## Publish a Website

```
hero docusaurus -bpd -dk ~/.ssh/id_ed25519
```