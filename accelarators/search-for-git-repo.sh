#!/bin/bash

# Function to search for Git repositories recursively
search_git_repos() {
    local dir="$1"
    # Loop through all directories and files in the current directory
    for item in "$dir"/*; do
        if [ -d "$item" ]; then
            # If the item is a directory, check if it's a Git repository
            if [ -d "$item/.git" ]; then
                # If a .git directory is found, it's a Git repository
                echo "Git repository found: $item"
            else
                # If it's not a Git repository, recursively search its subdirectories
                search_git_repos "$item"
            fi
        fi
    done
}

# Start searching from the home directory
search_git_repos "$HOME"
