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
    git \
    nodejs \
    ripgrep \
    luarocks \
    build-essential \
    tmux \
    rsync

ENV CTAN_REPO="https://mirror.ctan.org/systems/texlive/tlnet"
ENV PATH="$PATH:/usr/local/texlive/bin/linux"

# Copy and execute Neovim installation script
COPY install_neovim.sh /app/
RUN chmod +x /app/install_neovim.sh
RUN /app/install_neovim.sh

# Copy and execute LaTeX installation script
COPY install_tex.sh /app/
RUN chmod +x /app/install_tex.sh
RUN /app/install_tex.sh

USER rstudio

# Create .config directory and clone NvChad
RUN git clone https://github.com/NvChad/starter /home/rstudio/.config/nvim --depth 1

# Install Neovim plugins non-interactively
RUN nvim --headless +Lazy! sync +q
RUN nvim --headless -c "MasonInstallAll" -c "qall"
# Clone TPM for tmux
RUN git clone https://github.com/tmux-plugins/tpm /home/rstudio/.tmux/plugins/tpm

RUN sudo git clone --separate-git-dir=$HOME/.dotfiles https://github.com/conig/.dotfiles.git tmpdotfiles
RUN rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
RUN sudo rm -rf tmpdotfiles
