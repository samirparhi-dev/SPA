#!/bin/bash
#
set -e
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
RESET=$(tput sgr0)
BOLD=$(tput bold)

echo -e "\n ${BOLD}${BLUE} >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ${RESET}\n 💡 You are using Fork Utility.\n\n 📈 Developed to Accelarate your productivity.\n \n ⏩ We love your feedback to get better.\n${BOLD}${BLUE} \n  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ${RESET}"

echo -e "\n ${BOLD}${RED}Important !!!${RESET} \n This script Will ask you for GitHub Persional Access token. \n We dont remember or store that info, So you are safe to use it. !!!.\n${BOLD}${BLUE} \n  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ${RESET}"


echo -e "\n ${BLUE}Please provide your Github Personal Access Token. \n If you have not created yet, Please refer below Documentation. \n https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens ${RESET}"

# Your GitHub personal access token
read -s git_access_token

ACCESS_TOKEN="git_access_token"

echo -e "\n ${BLUE}Provide the Name of the Source Repository (Something like https://github.com/abc/xyz.git):${RESET}"

read source_repo

# Repository to fork
echo -e "\n ${BLUE}Please provide the repo details you would like to Fork ${RESET}"

REPO_TO_FORK="owner/repo"

# Fork the repository
response=$(curl -s -H "Authorization: token $ACCESS_TOKEN" -X POST "https://api.github.com/repos/$REPO_TO_FORK/forks")

# Check if the fork was successful
if [ "$(echo "$response" | jq -r '.id')" ]; then
  echo "Repository forked successfully!"
else
  echo "Failed to fork repository. Error message: $(echo "$response" | jq -r '.message')"
fi
