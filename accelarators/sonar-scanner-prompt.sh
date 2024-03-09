#!/bin/bash

set -e
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
RESET=$(tput sgr0)
BOLD=$(tput bold)

echo -e "\n ${BOLD}${RED}Important !${RESET} This script Assumes that you are currently inside the project directory !!!"

echo -e "${BLUE}Looking for Sonar-Scanner..${RESET}"

if sonar-scanner -v; then

 echo "${GREEN}SonarScanner is installed ✅, proceeding with the next command.${RESET}"
 # Set the path to your SonarQube server
DEFAULT_SONAR_SERVER_URL="http://localhost:9000"

read -p "${BLUE}What is your Sonar Server URL ? The default adress we assume is $DEFAULT_SONAR_SERVER_URL.To keep default value press enter: ${RESET}" user_input

SONAR_SERVER_URL="${user_input:-DEFAULT_SONAR_SERVER_URL}"

echo -e "\n ${BLUE}The Sonar Server URL is currently set to  $SONAR_SERVER_URL"

# Set the project key and name

echo -e "\n ${BLUE}Please input your Project key:${RESET}"

read projectKey

PROJECT_KEY=${projectKey}

echo -e "\n ${BLUE}Please input your Project Name:${RESET}"

read projectName

PROJECT_NAME=${projectName}

# Set the path to your project source code

echo -e "\n ${BLUE}Please input the Directory you want to scan:${RESET}"

read projectDir

PROJECT_SOURCE_DIR="${projectDir}"

# Set other optional parameters as needed
# For example, you can specify the language, exclude files, etc.
# See SonarScanner documentation for more options: https://docs.sonarqube.org/latest/analysis/scan/sonarscanner/

# Run SonarScanner
sonar-scanner \
  -Dsonar.host.url=$SONAR_SERVER_URL \
  -Dsonar.projectKey=$PROJECT_KEY \
  -Dsonar.projectName="$PROJECT_NAME" \
  -Dsonar.sources=$PROJECT_SOURCE_DIR

else

  echo -e "${BOLD}${RED}SonarScanner Installation is not Detected ${RESET} \n${GREEN} No worries, Please visit https://docs.sonarsource.com/sonarqube/9.9/analyzing-source-code/scanners/sonarscanner/ for installation guide${RESET}"

fi

