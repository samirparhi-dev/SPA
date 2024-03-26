#!/bin/bash
# Author: <Name Here>
# License: Same as Repository Licence
# Usage : Beta-Release
# Date : Today's Date>

set -e
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
RESET=$(tput sgr0)
BOLD=$(tput bold)

echo -e "\n${BLUE}###################################################${RESET}"

echo -e "\n${BOLD}${GREEN}Info!${RESET} ${BLUE}You are using CodeQL playbook (API way)! \nSend your thoughts we would love the enhancement Ideas.\n${RESET}"

echo -e "\n${BLUE}###################################################${RESET}"


# Lifecycle functions
function __besman_init {

    echo -e "\n${BLUE}🛫 Preparing your machine for Code QL Run .${RESET}"
    github_token=$1
    github_api_version=$2
    github_project_owner=$3
    github_repo_name=$4
}

function __besman_execute {

    # creating a CodeQL database for Java code
    curl -sS \
        -H "Accept: application/vnd.github+json" \
        -H "Authorization: Bearer $github_token" \
        -H "X-GitHub-Api-Version: $github_api_version=$2" \
        "https://api.github.com/repos/$github_project_owner/$github_repo_name/code-scanning/alerts?page=$page"

}
function __besman_prepare {

   echo -e "\n${BLUE}✅ preaparing CodeQL report!${RESET}"
 }

function __besman_publish {

   echo -e "\n${BLUE}✅ Placeholder for CodeQl Report to BES Data Store!${RESET}"
 }

function __besman_cleanup {

    rm -rf $result_dir/*
 }

function __besman_launch {

    if __besman_init; then
        echo "CodeQL is installed."
        mkdir -p $result_dir 
        __besman_execute
        __besman_prepare
        __besman_publish
        __besman_cleanup
        echo "CodeQL scan completed and results saved to $result_dir."
    else
        echo "Error: CodeQL is not installed. Please install CodeQL and try again."
        exit 1
    fi

}
