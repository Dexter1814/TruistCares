#!/bin/bash

# List of folders to create
folders=(
    "lynette"
    "docs"
    "Infrastructure/arm_templates"
    "Infrastructure/terraform"
    "Infrastructure/bicep"
    "Infrastructure/scripts"
    "backend/src"
    "backend/tests"
    "config"
    "tests/frontend"
    "tests/backend"
    "tests/integration"
    "assets/images"
    "assets/fonts"
    "assets/icons"
    "ci_cd"
    "sql/schema"
    "sql/migrations"
    "sql/seed"
    "logs"
)

# Create folders if they don't exist
for folder in "${folders[@]}"; do
    if [ ! -d "$folder" ]; then
        mkdir -p "$folder"
        echo "Created folder: $folder"
    else
        echo "Folder already exists: $folder"
    fi
done

# Create placeholder files if they don't exist
for folder in "${folders[@]}"; do
    placeholder="$folder/.gitkeep"
    if [ ! -f "$placeholder" ]; then
        touch "$placeholder"
        echo "Created placeholder file: $placeholder"
    else
        echo "Placeholder file already exists: $placeholder"
    fi
done

echo "Folders and placeholder files are set up successfully!"

