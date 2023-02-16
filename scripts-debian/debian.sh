#DOCKER

echo "              ╭──────────────────────────────────────────────────────────────╮ "
echo "              │                       INSTALLING DOCKER                      │ "
echo "              ╰──────────────────────────────────────────────────────────────╯ "

sudo apt-get update -y

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

sudo apt-get update -y

sudo apt-get install -y docker-ce docker-ce-cli containerd.io -y

sudo docker run hello-world

#fix docker deamon

echo "              ╭──────────────────────────────────────────────────────────────╮ "
echo "              │                        FIXING DOCKER                         │ "
echo "              ╰──────────────────────────────────────────────────────────────╯ "


cd /home
mkdir $USER/.docker
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R
sudo chmod 666 /var/run/docker.sock
test the fix
docker run hello-world


#DOCKER_COMPOSE

echo "              ╭──────────────────────────────────────────────────────────────╮ "
echo "              │                    INSTALLING DOCKER COMPOSE                 │ "
echo "              ╰──────────────────────────────────────────────────────────────╯ "


sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#Apply executable permissions to the binary
sudo chmod +x /usr/local/bin/docker-compose
echo "DOCKER version ..."
docker version
echo "DOCKER COMPOSE version ..."
#docker-compose version