#!/bin/bash
#
#
set -e
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
RESET=$(tput sgr0)
BOLD=$(tput bold)

echo -e "\n ${BOLD}${BLUE} >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ${RESET}\n 💡 You are using Playbook Starter kit.\n\n 📈 Developed to Accelarate your productivity.\n \n ⏩ We love your feedback to get better.${BOLD}${BLUE} \n  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ${RESET}"

echo -e "\n ${BLUE}Wehave Below Playbook For you to Run: ${RESET}"

echo -e "\n ${BLUE}Select the No. For the script to Run \n 1.Run Fork Tool,\n 2.Run Sonar Tool ${RESET}"
read Choose_script_option

if [ $Choose_script_option == "1" ]; then

bash fork_repo_to_given_ns.sh

else
echo -e "\n ${BLUE}We are In process of Devloping Other Script.📝\n We will be soon a Chain of tools.🛠️${RESET}"

fi