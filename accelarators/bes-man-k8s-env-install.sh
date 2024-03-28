#!/bin/bash

set -e
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
RESET=$(tput sgr0)
BOLD=$(tput bold)

echo -e "\n ${BOLD}${GREEN}######################################### ${RESET}\n BeSman is Installing the Environment for Kubernetes ☸️ ! \n  ${BOLD}${GREEN}######################################### ${RESET}"

echo -e "\n ${BLUE}In this process We will Check for :\n
1. Any Container Runtime \n
    - PODMAN (recomended) \n
    - Docker \n
    - RunC \n 
2. Install k8s Distro \n
    - Kind (recomended) \n
    - Minikube \n ${RESET}"

# Check if Podman is installed
if ! command -v podman &> /dev/null; then
    echo -e "\n ${BLUE} ❌ Podman is not installed. Please install Podman and try again."${RESET}
    exit 1
fi

# Check if Podman is activated

if podman info 2>&1 | grep -q "Error: unable to connect to Podman"; then
    echo -e "\n ${BLUE} ⚠️ PODMAN needs to be initialised. Initializing.."${RESET}
    # Run podman machine init
    podman machine init
    sleep 30

    # Wait for "Machine init complete" output
    while true; do
        if podman info 2>&1 | grep -q "Machine init complete"; then
            echo -e "\n ${BLUE} ✅ Podman is not Ready to serve 🍦 ! \n
            Checking for Kubernetes distribution."${RESET}
            break
        fi
        sleep 1
    done

fi

#### Checking for kind 

if command -v kind &> /dev/null; then
    echo -e "\n ${BLUE} Found Kind. 😊\n let's check if it is Active🏃🏻‍➡️..."${RESET}

    if kind get nodes 2>&1 | grep -q "No kind nodes found for cluster"; then
        echo -e "\n ${BLUE} No kind Cluster found 🤔, No Worries Creating one 🛠️"${RESET}

        kind create cluster
        sleep 30

        while true; do
            if kind get nodes 2>&1 | grep -q "kind-control-plane"; then
                echo -e "\n ${BLUE} ✅ Kind Cluster is not Ready to serve 🍦 ! \n
                Checking for Kubernetes distribution."${RESET}
                break
            fi
            sleep 1
        done
    fi
else
    echo -e "\n ${BLUE} Kind Not Found. ☹️ \n Kindly Install KIND. Here is the Documentation : https://kind.sigs.k8s.io/docs/user/quick-start/"${RESET}
fi

#### Checking for kubectl

if  command -v kubectl &> /dev/null; then
    echo -e "\n ${BLUE} Kubectl Installed 😊\n You are all set to Explore Containerrised app using Kind 🎬..."${RESET}

else
    echo -e "\n ${BLUE} Kubectl is not Installed. ☹️ \n Please install it. Here is the Documentation : https://kind.sigs.k8s.io/docs/user/quick-start/"${RESET}
fi

### Prerequisite Check Done
echo -e "\n ${BOLD}${BLUE} All Prerequisites are Satified ! all set to Run Bes Playbook."${RESET}

### Installing kubeBench
echo -e "\n ${BOLD}${BLUE} Initiating BeS Playbook for KubeBench.."${RESET}

echo -e "\n ${BLUE} Creating BeSecure Namespace"${RESET}
kubectl create ns besecure

if [ $? -eq 0 ]; then
    echo -e "\n ${BLUE} Creating Kube bench job in BeSecure Namespace"${RESET}
    kubectl apply -f https://raw.githubusercontent.com/samirparhi-dev/kube-bench/main/job.yaml -n besecure
    sleep 30
    
else
    echo -e "\n ${BLUE} Could not able to Create NameSpace , Try Again"${RESET}
fi
