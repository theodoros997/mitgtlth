FROM spgc/duckiebot-base-image:latest

SHELL ["/bin/bash", "-c"]

WORKDIR /workspace

COPY requirements-apt.txt .
COPY requirements-python.txt .

RUN set -e; \
    apt update && \
    apt install -y ffmpeg libsm6 libxext6

RUN set -e; \
    if [ -s requirements-python.txt ]; then \
        pip install -r requirements-python.txt; \
    fi
