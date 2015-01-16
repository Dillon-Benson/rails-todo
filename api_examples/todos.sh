#!/bin/sh

# Get's an access_token using curl
# Make sure to set todos_email and todos_password environment variables

echo $todos_email
echo `curl -X POST -H "Content-Type: application/json" localhost:3000/api/sessions/sessions -d '{"email": "'$todos_email'", "password": "'$todos_password'"}'`
