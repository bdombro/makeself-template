#!/bin/bash
set -ex

SCRIPT_DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)"

DOMAIN="localhost:8000"
URL="http://$DOMAIN"

# Start PHP server in the background, detached from terminal
nohup php -S $DOMAIN -t "$SCRIPT_DIR" >> /tmp/makeself-app.log 2>&1 &
PHP_PID=$!

# Wait a moment for the server to start
sleep 1

# Open the URL in the default browser
if command -v xdg-open > /dev/null; then
    xdg-open "$URL"
elif command -v gnome-open > /dev/null; then
    gnome-open "$URL"
elif command -v open > /dev/null; then
    open "$URL"
else
    echo "Please open $URL in your browser."
fi

# Optionally, exit the script now, leaving the server running in the background
exit 0
