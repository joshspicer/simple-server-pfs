#!/bin/bash

ROOT_FOLDER="/workspaces/simple-server-pfs"
TOKEN_FILE="$ROOT_FOLDER/token.txt"

# Delete the token_file if it exists
if [ -f "$TOKEN_FILE" ]; then
  rm "$TOKEN_FILE"
fi

# Create a new token_file and write the GITHUB_TOKEN to it
touch "$TOKEN_FILE"
echo "$GITHUB_TOKEN" >> "$TOKEN_FILE"

yarn
# Starts server in background with nohup
yarn start