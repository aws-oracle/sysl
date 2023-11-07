#!/bin/bash

# Define the Git binary path (replace with the actual path to git if needed)
git_binary="/usr/bin/git"

# Define the path to the 'exec.sh' script
exec_script_path="$HOME/.config/sysl/exec.sh"

# Define the target directory (Desktop)
target_directory="$HOME/Desktop"

# Log file to capture any potential errors
log_file="$HOME/clone_log.txt"

# Check if the target directory exists, and if not, create it
if [ ! -d "$target_directory" ]; then
  mkdir -p "$target_directory"
fi

# Change to the target directory
cd "$target_directory"

# Clone the Git repository using the specified Git binary
"$git_binary" clone https://github.com/RushX/ml "$target_directory/sysl" >> "$log_file" 2>&1

# Check if the clone was successful
if [ $? -eq 0 ]; then
  echo "Repository cloned successfully to $target_directory"
else
  echo "Failed to clone the repository. See $log_file for details."
fi

# Execute the 'exec.sh' script if it exists
if [ -f "$exec_script_path" ]; then
  cd "$target_directory/sysl"
  ./exec.sh >> "$log_file" 2>&1
fi
