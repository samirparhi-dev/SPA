#!/bin/bash

set -e
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
RESET=$(tput sgr0)
BOLD=$(tput bold)


echo -e "\n ${BOLD}${BLUE} >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ${RESET}\n 💡 You are using Fork Utility.\n\n 📈 Developed to Accelarate your productivity.\n \n ⏩ We love your feedback to get better.${BOLD}${BLUE} \n  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ${RESET}"

echo -e "\n ${BOLD}${RED}Important !!!${RESET} \n${BLUE}This script Uses your GitHub Persional Access token (PAT). \nWe advice you to set the token with${RESET} ${BOLD}${GREEN}GITHUB_ACCESS_TOKEN${RESET} ${BLUE}environment Variable in your current shell.\nYou can do it by running${RESET} ${BOLD}${GREEN}export GITHUB_ACCESS_TOKEN=you Token${RESET}${BLUE}.\nYou will be prompted for it if we do not Find.\nFor your safety, We or the tool does not remember or store that info.😁\n${BLUE} \n  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ${RESET}"

#Varriable Names & Delcaration
GITHUB_TOKEN_VARIABLE_NAME="GITHUB_ACCESS_TOKEN"
GITHUB_ACCESS_TOKEN=""
ORG_TO_FORK=""

# Check if the variable is set
if [ -z "${!GITHUB_TOKEN_VARIABLE_NAME}" ]; then
    echo -e "\n ${BLUE}The variable $GITHUB_TOKEN_VARIABLE_NAME is not set in your current Shell.\n Please provide your Github Personal Access Token. \n If you have not created yet, Please refer below Documentation. \n https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens ${RESET}"

    # Your GitHub personal access token
    read -s GITHUB_ACCESS_TOKEN
else
    echo -e "\n ${BLUE}The variable $GITHUB_TOKEN_VARIABLE_NAME is set.${RESET}"
fi

echo -e "\n ${BLUE}Provide the Name of the Source Repository (Something like https://github.com/abc/xyz.git):${RESET}"

read source_repo

# Extract the owner from the repository URL
owner=$(echo "$source_repo" | awk -F/ '{print $4}')
echo -e "$owner"

# Get the repository name from the source repository URL
source_repo_name=$(basename -s .git $source_repo)
echo -e "$source_repo_name"

#Declared default value of Org
echo -e "\n ${BLUE}We are checking if you are part of any Organization. 🏛️ ${RESET}"

# Make a request to the GitHub API to get the list of organizations
org_response=$(curl -s -w "%{http_code}" -H "Authorization: token $GITHUB_ACCESS_TOKEN" -H "X-GitHub-Api-Version: 2022-11-28" https://api.github.com/user/orgs)

HTTP_STATUS="${org_response:(-3)}"
RESPONSE_BODY="${org_response%???}"

# Check if the request was successful
if [ $HTTP_STATUS == "200" ]; then
  
  Org_value=$(echo "$RESPONSE_BODY" | jq -r '.[].login')

  Nuber_list_of_Org_value=$(echo "$RESPONSE_BODY" | jq -r '.[].login' | awk '{print NR".", $0}')

  echo -e "\n${BLUE}As per the info provided,\nYou have Access to Below Orgs: \n$Nuber_list_of_Org_value\nWould you like to Fork the Repository to one of these? \nIf yes Press the Number to chose org Or press ${BOLD}${RED}n ${RESET} ${BLUE}to fork to your personal GitHub Account.${RESET} ):${RESET}"

  read ORG_TO_FORK_OPTION

  if [[ $ORG_TO_FORK_OPTION =~ ^[0-9]+$ ]]; then
    ORG_TO_FORK=$(echo "$Org_value" | awk -v num="$ORG_TO_FORK_OPTION" 'NR==num')
  fi  
fi

echo -e "\n ${BLUE} You have choosen $ORG_TO_FORK Org as your Option. ${RESET}"
# Fork the repository to a given Org
fork_response=$(curl -s -w "%{http_code}" \
  -X POST \
  -H "Authorization: Bearer $GITHUB_ACCESS_TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/$owner/$source_repo_name/forks \
  -d "{"organization":"$ORG_TO_FORK","default_branch_only":true}")

  FORK_HTTP_STATUS="${fork_response:(-3)}"
  FORK_RESPONSE_BODY="${fork_response%???}"

# Check if the fork was successful
if [ $HTTP_STATUS == "200" ]; then
  echo "$source_repo_name Repository forked successfully!"
else
  echo "Failed to fork $source_repo_name repository. Error message: $(echo "$FORK_RESPONSE_BODY" | jq -r '.message')"
fi