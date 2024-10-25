#!/bin/bash

# Check if a topic name was provided
if [ -z "$1" ]; then
    echo "Usage: $0 <topic_name>"
    exit 1
fi

TOPIC_NAME="$1"

# Wait for the topic to become available
echo "Waiting for topic $TOPIC_NAME to be available..."
until rostopic info "$TOPIC_NAME" > /dev/null 2>&1; do
    sleep 1
done

echo "Topic $TOPIC_NAME is now available."
