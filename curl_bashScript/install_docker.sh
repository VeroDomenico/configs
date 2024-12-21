
#!/bin/bash

# Script to install Docker on Debian/Ubuntu-based systems

# Update system packages
echo "Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Install prerequisites
echo "Installing prerequisites..."
sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y

# Add Docker's GPG key
echo "Adding Docker's GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add the Docker repository
echo "Adding Docker repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
echo "Installing Docker Engine..."
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

# Verify the installation
echo "Verifying Docker installation..."
sudo docker run hello-world

# Add user to the docker group (optional but recommended)
echo "Adding user to the docker group..."
sudo usermod -aG docker "$USER"
newgrp docker # Apply the group change to the current session. Important!

# Enable Docker on boot
echo "Enabling Docker on boot..."
sudo systemctl enable docker

echo "Docker installation complete!"

# Provide instructions for logging out/in if the user was added to the docker group
echo ""
echo "IMPORTANT: If you were not already logged in as the desired user, you might need to log out and back in for the group changes to fully take effect."
echo ""

exit 0
