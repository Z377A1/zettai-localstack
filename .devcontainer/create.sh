#!/bin/bash

set -e

# Run post create commands for the devcontainer
echo "Running post create commands..."

# Update package lists
echo "Updating package lists..."
sudo apt-get update

# Create python environment
echo "Creating Python virtual environment..."
python3 -m venv .venv

echo "Post create commands completed."
