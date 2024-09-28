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


# ai-callback
clone_if_not_exists "ai-callback" "ai-callback"
osascript -e 'tell application "Terminal"
    do script "cd '"$CURRENT_DIR"'/ai-callback && export $(grep -v '^#' '"$CURRENT_DIR"'/ai-callback/.env | xargs) && make build && ./consumer.out"
    activate
end tell'

# ai-requester
clone_if_not_exists "ai-requester" "ai-requester"
osascript -e 'tell application "Terminal"
    do script "cd '"$CURRENT_DIR"'/ai-requester && export $(grep -v '^#' '"$CURRENT_DIR"'/ai-requester/.env | xargs) && make build && ./consumer.out"
    activate
end tell'

# ai-prompt-builder
clone_if_not_exists "ai-prompt-builder" "ai-prompt-builder"
osascript -e 'tell application "Terminal"
    do script "cd '"$CURRENT_DIR"'/ai-prompt-builder && export $(grep -v '^#' '"$CURRENT_DIR"'/ai-prompt-builder/.env | xargs) &&  make build && ./consumer.out"
    activate
end tell'

# validation-api
clone_if_not_exists "validation-api" "validation-api"
osascript -e 'tell application "Terminal"
    do script "cd '"$CURRENT_DIR"'/validation-api && export $(grep -v '^#' '"$CURRENT_DIR"'/validation-api/.env | xargs) && npm run build_start"
    activate
end tell'

# prompt-road-map-config-api
clone_if_not_exists "prompt-road-map-config-api" "prompt-road-map-config-api"
osascript -e 'tell application "Terminal"
    do script "cd '"$CURRENT_DIR"'/prompt-road-map-config-api && export $(grep -v '^#' '"$CURRENT_DIR"'/prompt-road-map-config-api/.env | xargs) &&  npm run build_start"
    activate
end tell'