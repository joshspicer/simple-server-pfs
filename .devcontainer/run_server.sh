#!/bin/bash

# Install dependencies
npm install

# Start the server
npm start &

# Wait for the server to start
while ! curl -s http://localhost:3000 > /dev/null; do
  sleep 1
done

# Print completion message
echo "Server started successfully!"

ROOT_FOLDER="/workspaces/simple-server-pfs"
TOKEN_FILE="$ROOT_FOLDER/token.txt"

# Delete the token_file if it exists
if [ -f "$TOKEN_FILE" ]; then
  rm "$TOKEN_FILE"
fi

# Create a new token_file and write the GITHUB_TOKEN to it
touch "$TOKEN_FILE"
echo "$GITHUB_TOKEN" >> "$TOKEN_FILE"

# Exit the script
exit 0
