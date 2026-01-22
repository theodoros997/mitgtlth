FROM spgc/duckiebot-base-image:latest

SHELL ["/bin/bash", "-c"]

WORKDIR /workspace

COPY requirements-apt.txt .
COPY requirements-python.txt .

RUN set -e; \
    apt update && \
    apt install -y software-properties-common curl && \
    echo "deb http://archive.ubuntu.com/ubuntu jammy universe" > /etc/apt/sources.list.d/universe.list && \
    apt update && \
    xargs -a requirements-apt.txt apt install -y

RUN set -e; \
    if [ -s requirements-python.txt ]; then \
        pip install -r requirements-python.txt; \
    fi
