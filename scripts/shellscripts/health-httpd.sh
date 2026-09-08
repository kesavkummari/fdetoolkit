#!/bin/bash

ENDPOINT="http://localhost/health"
TIMEOUT=5

# Fetch HTTP status code quietly
STATUS=$(curl -s -o /dev/null -w "%{http_code}" --max-time $TIMEOUT "$ENDPOINT")

if [ "$STATUS" -eq 200 ]; then
    echo "OK: HTTPD is healthy (HTTP $STATUS)"
    exit 0
else
    echo "CRITICAL: HTTPD returned status $STATUS"
    exit 1
fi