#!/bin/bash

# Specify the name of the environment variable
GITHUB_TOKEN_VARRIABLE_NAME="GITHUB_ACCESS_TOKEN"

# Check if the variable is set
if [ -z "${!GITHUB_TOKEN_VARRIABLE_NAME}" ]; then
    echo "The variable $GITHUB_TOKEN_VARRIABLE_NAME is not set."
else
    echo "The variable $GITHUB_TOKEN_VARRIABLE_NAME is set with value: ${!variable_name}"
fi
