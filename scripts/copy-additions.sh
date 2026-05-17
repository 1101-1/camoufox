#!/bin/bash

# Simple bash script that copies the additions from the repository into the source directory
# Must be ran from within the source directory

# Check if correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <version> <release>"
    exit 1
fi

# Assign command-line arguments to variables
version="$1"
release="$2"

# Function to run commands and exit on failure
run() {
    echo "$ $1"
    eval "$1"
    if [ $? -ne 0 ]; then
        echo "Command failed: $1"
        exit 1
    fi
}

# Create the destination directory if it doesn't exist
run 'mkdir -p services/settings/dumps/main'

# Copy the search-config.json file
run 'cp -v ../assets/search-config.json services/settings/dumps/main/search-config.json'

# vs_pack.py issue... should be temporary
run 'cp -v ../patches/librewolf/pack_vs.py build/vs/'

# ... rest of the script
