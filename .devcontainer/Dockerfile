# Use the specified R version from rocker-org
FROM ghcr.io/rocker-org/devcontainer/r-ver:4.4

# Install dependencies for R, system utilities, and LaTeX
RUN apt-get update && apt-get install -y \
    libxt6 \
    libzmq3-dev \
    xclip \
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
    librsvg2-dev \
    # set up nvim
    git \
    nodejs \
    ripgrep \
    luarocks \
    build-essential \
    tmux \
    rsync
    
ENV CTAN_REPO="https://mirror.ctan.org/systems/texlive/tlnet"YY
ENV PATH="$PATH:/usr/local/texlive/bin/linux"

COPY install_neovim.sh /app/
RUN chmod +x /app/install_neovim.sh
RUN /app/install_neovim.sh

# Install Neovim and nvchad
RUN apt-get update && \
    apt-get install -y git nodejs ripgrep build-essential && \
    git clone https://github.com/NvChad/starter /root/.config/nvim

# Install TPM
RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Initialise NvChad and install plugins
# RUN nvim --headless +"autocmd User PackerComplete quitall" +PackerSync && \
    # nvim --headless -c "qall"  
# Copy the script into the Docker image
# COPY install_tex.sh /app/
# RUN chmod +x /app/install_tex.sh
# RUN /app/install_tex.sh

# RUN --mount=type=ssh \
#     git clone --separate-git-dir=$HOME/.dotfiles git@github.com:conig/.dotfiles.git tmpdotfiles && \
#     rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/ && \
#     rm -r tmpdotfiles
