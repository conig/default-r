# Use the specified R version from rocker-org
FROM ghcr.io/rocker-org/devcontainer/r-ver:4.4

# Install dependencies for R, system utilities, and LaTeX
RUN apt-get update && apt-get install -y \
    libxt6 \
    libzmq3-dev \
    xclip \
    perl \
    wget \
    curl \
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
    rsync \
    fzf

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
RUN nvim --headless -c "MasonInstallAll" -c "qall"
RUN nvim --headless +Lazy! sync +q
RUN nvim --headless +Lazy! sync +q
# Install Oh My Zsh and Powerlevel10k
RUN sudo rm -rf ~/.oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
RUN sudo chsh -s $(which zsh) rstudio
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# Clone TPM for tmux
RUN git clone https://github.com/tmux-plugins/tpm /home/rstudio/.tmux/plugins/tpm
ARG CACHE_BUST=1
RUN sudo git clone --separate-git-dir=$HOME/.dotfiles https://github.com/conig/.dotfiles.git tmpdotfiles \
&& rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/ \
&& sudo rm -rf tmpdotfiles

RUN /home/rstudio/.tmux/plugins/tpm/bin/install_plugins
RUN echo "alias r='radian'" >> /home/rstudio/.bashrc


