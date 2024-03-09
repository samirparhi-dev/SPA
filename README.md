# ⌖ SPA (Security and Privacy Analysis Toolkit) - Little push to your Productivity. 📈

##### (Leave a ⭐️ on Repo if it helps !)

Will be available at https://< ns >.github.io/spa/ , Help Us Improve the UI to a Clean,Responsive and Stunning View 🌁.

## :grin: You will glad to know: 

- We are Open Now and Will be _Forever_ .
- The motivation for this Repository to develop script that are intended to use in github action / any kind of server-less application setup to keep away your PC from Bloating with lots of tools / software .
- Action are created to leverage the machine resource on GitHub without installing the tools on your own PC.
- It is just a step to keep away your PC from Bloating with lots of tools / software. The Scripts here are again intended to serve as a function app right from the GitHub to help you get more productive. Kindly help improve wherever possible.
- Everyone is encouraged to Contribute even a small script as we aim this space to be the goto place for all system engineers/beginners/Cyber security practitioner/student/any one who is interested to learn.
  
## 🤔 What are these folders ?

- `accelarators` directory contains all the script that can be reused and consumed for various purpose. Usage of this script are very simple and acts as accelerators to improve some ones productivity.

- `dsl/vars` folder contains jenkins pipeline groovy script for reference to get an idea how to write Shared library based pipeline in jenkins.

- `docker` Directory contains Dockerfile/Docker compose file/anything related to docker.

- `test` contains all the sample files which can be used along with the script to validate the intended output.

  
# ⏩ Accelerator Scripts & Actions 

## :memo: Scripts:

### A. 🗂️ blob-sign-cosign.sh: 

This is a accelerator script to encapsulate various cosign option in a input format. This is used to sign a file any blob using the Sigstore's Cosign utility. 
Currently the scope is to use cosign tool, but in future we want to unify this script with various signing tools in the market.

Features and options:
The signing options:

1.	Using certificate
2.	Using GitHub ODIC

Certification generation options:

1.	Export to a file 
2.	Export to a remote location

Certificate Authority:

1.	Cosign Flucio
2.	Let’s encrypt
3.	Kubernetes CA
4.	Using a self-signed certificate with openSSL

What can be signed?
1.	File Blob
2.	Container image

What is supported Now?
1.	Blob sign with Flucio

What is being explored?
1.	Automatic signing of certificate without a pw
2.	various CA and using K8s CA

To do:
1.	Sign of secrets and binaries
   
URL: < Will be up Shortly>
UI is available (Being Developed) : https://capita-7/spa.github.io/SPA/

### 🖥️ It Looks the way you wanted :

```
saswati@Saswatis-Mac accelarators % ./blob-sign-cosign.sh

Important !!! This script only sign the file/Blobs 📂 Using Sigstore's Cosign Utility· 

Enter ctrl+c or control+c to exit from this script any time ·

Provide the Name for the Private and Public Key(Something like my-secretkey):
secret

Generating the Private and Public Key in Cosign·

Please Press Enter if you do not want to provide the password for the Key generation (Not Recomended)·

Enter password for private key: 
Enter password for private key again: 


Are you sure you would like to continue? [y/N] y

Private key written to secret.key
Public key written to secret.pub

Enter the File Name or path/to/fileName which has to be signed ·
anything.py

 Enter the Output signature file Name or Path/to/fileName  ·
/Users/saswati/Documents/code/test

Signing the Given File Using Private Key e.g. (secret.key) please Wait 5 sec·

Using payload from: cweCveAssociation.py

Enter password for private key: 

The sigstore service, hosted by sigstore a Series of LF Projects, LLC, is provided pursuant to the Hosted Project Tools Terms of Use, available at https://lfprojects.org/policies/hosted-project-tools-terms-of-use/.

Note that if your submission includes personal data associated with this signed artifact, it will be part of an immutable record.
This may include the email address associated with the account with which you authenticate your contractual Agreement.

This information will be used for signing this artifact and will be stored in public transparency logs and cannot be removed later, and is subject to the Immutable Record notice at https://lfprojects.org/policies/hosted-project-tools-immutable-records/.

By typing 'y', you attest that (1) you are not submitting the personal data of any other person; and (2) you understand and agree to the statement and the Agreement terms at the URLs listed above.

tlog entry created with index: 62403461

Wrote signature to file /Users/saswati/Documents/code/test

Your Signature is: dfTWySiyPGAonSt4Me6MAiAqtKbW2qKHL2AfYJsVHzIFd6EAbghW7CoR39O66KywNQ==

Would you like to Verify the Signature Now ? y = Yes, n = No ·
y

Verifying the Sign of cweCveAssociation.py Using Public Key e.g. (secret.pub)·

Verified OK

Process Ends ✅·

saswati@Saswatis-Mac accelarators %

```
----------------------------------------------

### 🧐 Static_code_analysis_consolidation_report.py : 
Script consolidate snyk, code QL and sonar report to give a unified view of risks. There are lot more expectation from this script. This is designed to eliminate false positive by using a algorithm with these 3 reports and find out the candidate which need to be remediated first. Algorithm to be chosen. 

Current scope: The Json schema for this consolidation report is defined. It can now consolidate the data, which is of max 25MB Max, We have fine-tuned to increase the file limit by using json stream but it need to be fined tuned further more.

What to be done? 
Right algorithm to be identified to remove the false positive and the ranking of the sevierity to be done.

URL : <will be here soon>

---------------------------------------------
### 🐞 cweCveAssociation.py: 
This is a aggregator script which associate various CVE to CWE, Now the data source is Mitre, but we are planning to add more data source so that the SPArch result is more meaningful. You may not find this standalone script more useful but with combination of this script with other script in the repo does the magic.

< Link will be here soon>

---------------------------------------------
### 🦟 cveOWASPTop10Validation.py:

This is designed to map Any CVE to OWASP top ten category.

Scope: This will help to distribute the issues accordance with the OWASP top 10 so that you set a priority which to be picked up fist and help you analysize the security hotspot. Other scope to be defined.

Status: The initial version is being coded and the initial phase of testing in in progress

URL: <will be here soon>

## ⏯️ Actions:

A. sbomSignVerify.yml: This is a simple interactive GitHub action which take a couple of input from user and process the signing. This is the replication of blob-sign-cosign.sh and the functionality also remains as of the mentioned script. it is just a UI to the command line. It is helpful for the situation where you cannot install the cosign tool on your system but want to leverage the tool sign your artefact.

< URL will be here soon >

-----------------------------------------------

## 🧭 More to Explore.
