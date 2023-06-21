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

# Start the Python HTTP server with retries
max_attempts=3
attempt=1

while [ $attempt -le $max_attempts ]; do
    echo "Starting the Python HTTP server (Attempt $attempt)..."
    python3 -m http.server 3000 > /dev/null 2>&1 &  # Start the server in the background
    server_pid=$!

    sleep 2  # Wait for a few seconds to allow the server to start

    if ps -p $server_pid > /dev/null; then
        echo "Python HTTP server started successfully!"
        exit 0  # Server started, so exit with success
    else
        echo "Attempt $attempt failed. Retrying..."
        kill $server_pid > /dev/null 2>&1  # Terminate the previous server process
        attempt=$((attempt+1))
    fi
done

echo "Failed to start the Python HTTP server after $max_attempts attempts. Exiting."
exit 1  # Exit with failure
