# Update package lists
echo "Updating package lists..."
sudo apt-get update

# Install packages
echo "Installing packages..."
sudo apt-get install -y \
  libglpk-dev \
  libxt6 \
  libzmq3-dev \
  xclip