#!/bin/bash

# Define the URL of the Git repository you want to clone
repository_url="https://github.com/RushX/ml.git"

# Define the target directory (Desktop)
target_directory="$HOME/Desktop"

# Check if the target directory exists, and if not, create it
if [ ! -d "$target_directory" ]; then
  mkdir -p "$target_directory"
fi

# Change to the target directory
cd "$target_directory"

# Clone the Git repository
git clone "$repository_url"

# Check if the clone was successful
if [ $? -eq 0 ]; then
  echo "Repository cloned successfully to $target_directory"
else
  echo "Failed to clone the repository"
fi
