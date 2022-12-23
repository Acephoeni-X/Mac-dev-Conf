log=$PWD/docker-log.log
touch $log
GREEN='\033[1;32m'
clear='\033[0m'

function update(){
  sudo apt-get update
}

function installingDependencies(){
  sudo apt-get install \
        ca-certificates \
        curl \
        gnupg \
        lsb-release \
}

function addingDockerGPGKey(){
  sudo mkdir -p /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
}

function setUpRepo(){
  echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
}

function installingCommands(){
  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-compose -y
}

function checkInstallation(){
  docker -v
}

echo -e "${GREEN}Updating packages:${clear}";
update

echo -e "${GREEN}Installing dependencies:${clear}";
installingDependencies

echo -e "${GREEN} Adding GPG Key:${clear}";
addingDockerGPGKey

echo -e "${GREEN} Setting Repo:${clear}";
setUpRepo

echo -e "${GREEN} Re-Updating apt with docker dependencies:${clear}";
update

echo -e "${GREEN}Installing Commands${clear}";
installingCommands

echo -e "${GREEN}Check Docker Install${clear}";
checkInstallation