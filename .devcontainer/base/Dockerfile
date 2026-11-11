FROM debian:trixie-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    curl \
    git \
    pkg-config \
    zstd \
    sudo \
    && rm -rf /var/lib/apt/lists/* \

USER developer

WORKDIR /workspace
