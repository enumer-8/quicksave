#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <url>"
    exit 1
fi

url=$1

# Extract filename from the URL
filename=$(basename "$url")

# Check if the filename is empty or equals to the URL (no ending slash)
if [ -z "$filename" ] || [ "$filename" == "$url" ]; then
    # Append a default filename if the URL ends with a slash or has no filename
    filename="index.html"
fi

# Download the webpage using curl
curl -L "$url" -o "$filename"

echo "Page has been saved as: $filename"
