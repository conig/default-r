
install_neovim() {
    local version=$1
    local url="https://github.com/neovim/neovim/releases/download/v${version}/nvim-linux64.tar.gz"
    local tmp_dir=$(mktemp -d)

    # Download and install Neovim
    echo "Downloading Neovim version ${version}..."
    curl -Lo "${tmp_dir}/nvim-linux64.tar.gz" "${url}"
    
    if [[ $? -ne 0 ]]; then
        echo "Failed to download Neovim. Please check the version number."
        return 1
    fi
    
    echo "Extracting Neovim..."
    tar -xzvf "${tmp_dir}/nvim-linux64.tar.gz" -C "${tmp_dir}"
    
    echo "Installing Neovim..."
    sudo cp -r "${tmp_dir}/nvim-linux64/"* /usr/local/

    # Clean up
    echo "Cleaning up..."
    rm -rf "${tmp_dir}"

    echo "Neovim version ${version} installed successfully."
}

install_neovim "0.10.2"
