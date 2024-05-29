# Use the specified R version from rocker-org
FROM ghcr.io/rocker-org/devcontainer/r-ver:4.4

# Install dependencies for R, system utilities, and LaTeX
RUN apt-get update && apt-get install -y \
    libxt6 \
    libzmq3-dev \
    xclip \
    fftw3 \
    perl \
    wget \
    ca-certificates \
    libglpk-dev \
    texinfo \
    librsvg2-2 \
    libsodium-dev \
    libsecret-1-dev \
    cmake \
    libpoppler-cpp-dev \
    libgsl-dev \
    librsvg2-dev

ENV CTAN_REPO="https://mirror.ctan.org/systems/texlive/tlnet"
ENV PATH="$PATH:/usr/local/texlive/bin/linux"

# Copy the script into the Docker image
COPY install_tex.sh /app/
RUN chmod +x /app/install_tex.sh
RUN /app/install_tex.sh
