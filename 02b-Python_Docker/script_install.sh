echo "Doing : export DOCKER_COMPOSE_VERSION=1.27.4"
export DOCKER_COMPOSE_VERSION=1.27.4
echo "#################### DONE ###################"
echo ""
echo ""

echo "* Doing : sudo apt-get update"
sudo apt-get update
echo "#################### DONE ###################"
echo ""
echo ""



echo "Doing : sudo apt-get install libhdf5-dev"
sudo apt-get install libhdf5-dev
echo "#################### DONE ###################"
echo ""
echo ""


echo "* Doing : sudo apt-get install libssl-dev"
sudo apt-get install libssl-dev
echo "#################### DONE ###################"
echo ""
echo ""

echo "* Doing : sudo apt-get install python3"
sudo apt-get install python3
echo "#################### DONE ###################"
echo ""
echo ""

echo "* Doing : sudo apt-get install python3-pip"
sudo apt-get install python3-pip
echo "#################### DONE ###################"
echo ""
echo ""


echo "* Doing : sudo apt-get install docker-compose-plugin"
sudo apt-get install docker-compose-plugin
echo "#################### DONE ###################"
echo ""
echo ""

echo "* Doing : sudo pip3 install docker-compose=="${DOCKER_COMPOSE_VERSION}
sudo pip3 install docker-compose=="${DOCKER_COMPOSE_VERSION}"
echo "#################### DONE ###################"
echo ""
echo ""

echo "* Doing : pip install docker-compose"
pip install docker-compose
echo "#################### DONE ###################"
echo ""
echo ""

echo "* Doing : sudo groupadd docker"
sudo groupadd docker
echo "#################### DONE ###################"
echo ""
echo ""

echo "* Doing : sudo usermod -aG docker $USER"
sudo usermod -aG docker $USER
echo "#################### DONE ###################"
echo ""
echo ""
