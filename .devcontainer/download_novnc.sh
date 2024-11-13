#!/bin/bash
set -e

# Make a request to GitHub API for the latest release data
response=$(curl -s https://api.github.com/repos/novnc/noVNC/releases/latest)

# Parse the JSON to extract the tarball_url
tarball_url=$(echo "$response" | jq -r '.tarball_url')

# Check if the URL was extracted successfully
if [[ -z "$tarball_url" ]]; then
    echo "Error: Failed to fetch tarball URL."
    exit 1
fi

# Download the tarball using wget
wget "$tarball_url" -O /tmp/novnc/noVNC.tar.gz

# Confirm download
if [[ $? -eq 0 ]]; then
    echo "Downloaded latest noVNC release to /tmp/novnc/noVNC.tar.gz"
else
    echo "Error: Download failed."
    exit 1
fi

# Create a directory to extract the tarball contents
mkdir -p /tmp/novnc/noVNC

# Extract the tarball to the created directory
tar -xzf /tmp/novnc/noVNC.tar.gz -C /tmp/novnc/noVNC --strip-components=1

# Confirm extraction
if [[ $? -eq 0 ]]; then
    echo "Extracted latest noVNC release to the '/tmp/novnc/noVNC' directory."
else
    echo "Error: Extraction failed."
    exit 1
fi

# Cleanup the downloaded tarball
rm /tmp/novnc/noVNC.tar.gz