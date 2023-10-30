#!/bin/bash

# Usage: Drag and drop the zip file into the terminal and run this script.
# This script extracts .component files from a zip archive and moves them to /Library/Audio/Plug-ins/Components for music production.

# Prompt user for the zip file path
read -p "Enter the path to the zip file: " zip_file_path

# Check if the provided path is valid
if [ ! -f "$zip_file_path" ]; then
  echo "Error: Zip file not found at '$zip_file_path'. Please provide a valid path."
  exit 1
fi

# Prompt for confirmation
read -p "Are you sure you want to move the .component files to /Library/Audio/Plug-ins/Components? (y/n): " confirm
if [ "$confirm" != "y" ]; then
  echo "Operation canceled."
  exit 0
fi

# Create a temporary directory to extract files
temp_dir=$(mktemp -d)

# Extract zip file contents
unzip "$zip_file_path" -d "$temp_dir"

# Check if extraction was successful
if [ $? -ne 0 ]; then
  echo "Error: Failed to extract files."
  exit 1
fi

# Move .component files to /Library/Audio/Plug-ins/Components
find "$temp_dir" -name "*.component" -exec mv {} /Library/Audio/Plug-ins/Components \;

# Check the result of the move operation
if [ $? -ne 0 ]; then
  echo "Error: Failed to move .component files to /Library/Audio/Plug-ins/Components."
  exit 1
fi

# Clean up the temporary directory
rm -rf "$temp_dir"

echo "Files extracted and moved successfully."
