# Dockerized Web Application with Traefik

## Introduction

This project demonstrates the deployment of a web application using Docker Compose.

## Prerequisites

- Docker and Docker Compose needs to be installed on your machine.

## Architecture Overview

### Web Server (Apache2)

- The base image is debian:bullseye-slim, chosen for its minimal size.
- Built using a multi-stage Dockerfile to ensure a lightweight and secure image.
- Hosts a customized web page displaying data retrieved from the PostgreSQL database.

### Database (PostgreSQL)

- Uses the official PostgreSQL image for reliability and ease of setup.
- Docker Secrets is configured to handle sensitive data.
- Persistent storage is configured to ensure data durability across container restarts.

### Reverse Proxy (Traefik v3)

- Acts as the entry point and routes incoming requests to the appropriate services.
- Provides load balancing capabilities.
- Hosts a dashboard for real-time monitoring of services.
- Uses Docker labels for dynamic service discovery.

## Getting Started

### Set up a custom domain (Optionnal)

Modify your hosts file to associate traefik.local with 127.0.0.1:

- **On Linux**:

  ```bash
  sudo nano /etc/hosts
  ```

  Add the following line:

  ```bash
  127.0.0.1 traefik.local
  ```

- **On Windows**:

  Open C:\Windows\System32\drivers\etc\hosts with an editor in administrator mode.
  Add the following line:

  ```bash
  127.0.0.1 traefik.local
  ```

### Manage the Services

- **Start the containers**:

  ```bash
  docker compose up -d
  ```

- **Stop the Containers**:

  ```bash
  docker compose down
  ```

- **Rebuild Services (if needed)**:

  ```bash
  docker compose up --build -d
  ```

### Access the Application

- **Web Application**:

  Visit http://traefik.local (or http://localhost if not using a custom domain).

- **Traefik Dashboard**

  Visit http://traefik.local/dashboard/ (or http://localhost/dashboard/ if not using a custom domain).
