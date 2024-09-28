#!/bin/bash

# Get the current working directory
CURRENT_DIR=$(pwd)
EXPORT_ENV="export $(grep -v '^#' .env | xargs)"

# Function to check if a directory exists and clone if not
clone_if_not_exists() {
    REPO_PATH=$1
    REPO_NAME=$2
    
    if [ ! -d "$CURRENT_DIR/$REPO_PATH" ]; then
        echo "Directory $CURRENT_DIR/$REPO_PATH does not exist. Cloning..."
        git clone "git@github.com:trend-me/$REPO_NAME.git" "$CURRENT_DIR/$REPO_PATH"
    else
        echo "Directory $CURRENT_DIR/$REPO_PATH exists. No need to clone."
    fi
}


# resources
clone_if_not_exists "resources" "resources"
osascript -e 'tell application "Terminal"
    do script "cd '"$CURRENT_DIR"'/resources && ./scripts/reload_docker.sh"
    activate
end tell'

