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

RUN curl -fsSL \
    https://github.com/git-ecosystem/git-credential-manager/releases/download/v3.0.2/gcm-linux-x64-3.0.2.deb \
    -o /tmp/gcm.deb \
    && apt-get update \
    && apt-get install -y /tmp/gcm.deb \
    && rm -f /tmp/gcm.deb \
    && rm -rf /var/lib/apt/lists/*

USER developer

WORKDIR /workspace
