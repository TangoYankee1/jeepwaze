# Development Environment Docker Configuration

FROM ubuntu:20.04

# Install essential packages
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /workspace

# Copy the project files
COPY . .

# Add additional configurations as necessary
