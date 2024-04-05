#!/bin/bash

PYTHON_INSTALL_VERSION="3.11.8"
PYTHON_INSTALL_TARBALL="Python-${PYTHON_INSTALL_VERSION}.tgz"
PYTHON_SOURCE_DIRECTORY="Python-${PYTHON_INSTALL_VERSION}"
PYTHON_DOWNLOAD_URL="https://www.python.org/ftp/python/${PYTHON_INSTALL_VERSION}/Python-${PYTHON_INSTALL_VERSION}.tgz"


PYTHON_INSTALLATION_PATH="/usr/local/bin/${PYTHON_INSTALL_VERSION}"

print_message()
{
    echo ""
    echo $1
    echo ""
}

# Download and install Node.js and NPM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
source ~/.bashrc
nvm install 20.11.0
nvm use 10.2.4

# Verify Node.js and NPM installation
node -v
npm -v

# Install Angular CLI globally
print_message "Installing Angular CLI"
npm install -g @angular/cli

# Install Azure Functions Core Tools V4 globally
print_message "Installing Azure Function Core Tools V4"
npm install -g azure-functions-core-tools@4

# Download and install Python 3.11
print_message "Downloading Python Source from URL ${PYTHON_DOWNLOAD_URL}"
wget "${PYTHON_DOWNLOAD_URL}"

print_message "Extracting Tarball ${PYTHON_INSTALL_TARBALL} locally into source folder ${PYTHON_SOURCE_DIRECTORY}"
tar -zxf ${PYTHON_INSTALL_TARBALL}

current_directory_1=`pwd`
print_message "Switching Local directory to ${current_directory}"
cd ${PYTHON_SOURCE_DIRECTORY}

current_directory_2=`pwd`
print_message "Current directory is now ${current_directory_2}"

print_message "Setting up and enabling optimizations"
./configure --enable-optimizations

print_message "Compiling Python version ${PYTHON_INSTALL_VERSION}"
sudo make altinstall

# print_message "Appending Python Path ${PYTHON_INSTALLATION_PATH} to PATH_VARIABLE ${PATH} "
# echo "export PATH=${PYTHON_INSTALLATION_PATH}:\$PATH" >> ~/.bashrc

#print_message "Reloading Path and environment variables"
#source ~/.bashrc

# Verify Python installation
print_message "Confirming that we have installed ${PYTHON_INSTALL_VERSION}"
python3.11 --version

# Install pip for Python 3.11
print_message "Installing Latest Version of PIP"
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3.11 get-pip.py

print_message "Verifying PIP Installation"
# Verify pip installation
pip3.11 --version

