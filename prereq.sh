#!/bin/bash

# Download and install Node.js and NPM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
source ~/.bashrc
nvm install 20.11.0
nvm use 10.2.4

# Verify Node.js and NPM installation
node -v
npm -v

# Install Angular CLI globally
npm install -g @angular/cli

# Install Azure Functions Core Tools V4 globally
npm install -g azure-functions-core-tools@4

# Download and install Python 3.11
wget https://www.python.org/ftp/python/3.11.0/Python-3.11.0.tgz
tar xzf Python-3.11.0.tgz
cd Python-3.11.0
./configure --enable-optimizations
make altinstall

# Verify Python installation
python3.11 --version

# Install pip for Python 3.11
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3.11 get-pip.py

# Verify pip installation
pip3.11 --version