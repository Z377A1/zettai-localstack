#!/bin/bash

# Install dependencies script for LocalStack development container

set -e

# Update package lists
sudo apt-get update

# Create python environment
python3 -m venv .venv
source .venv/bin/activate

# Install python deps
pip install pandas

echo "Dependencies installed successfully!"
