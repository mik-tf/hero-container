<h1>ThreeFold Hero Development Environment Container</h1>
<h2>Table of Contents</h2>

- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Building the Image](#building-the-image)
- [Running the Container](#running-the-container)
- [Launch the Hero Website](#launch-the-hero-website)

## Introduction

A Docker-based development environment for Hero development with essential tools and configurations.
## Prerequisites

- Docker installed on your system

## Building the Image

Build the image:

```bash
docker build -t hero-dev .
```

## Running the Container

Run the container with an interactive shell and local directory from the Hero Docusaurus repository.

```bash
docker run --network=host -v $(pwd):/workspace -it hero-dev
```

## Launch the Hero Website

```
hero docusaurus -d && bash /root/hero/var/docusaurus/develop.sh
```