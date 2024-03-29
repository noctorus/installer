# We need sudo to do some stuff
if [[ $EUID -ne 0 ]]; then
   echo "Please run as root."
   exit 1
fi

# atualizar sistema
sudo apt-get update -y

sudo mkdir ~/installs

if [ ! -f ~/installs/.wget ]; then
	sudo apt-get install wget -y
	sudo apt-get install curl -y
	touch ~/installs/.wget
fi
echo "wget ok"

# isntalar visual code
if [ ! -f ~/installs/.code ]; then
	sudo apt-get install code -y
	touch ~/installs/.code
fi
echo "vscode ok"

# Install Java
if [ ! -f ~/installs/.java ]; then
	sudo apt-get install openjdk-8-jre --no-install-recommends -y
	touch ~/installs/.java
fi
java -version

version="2019.2.5"

if [ ! -f ~/installs/.datagrip ]; then

	# 
	# Download datagrip
	if [ ! -f /tmp/datagrip.tar.gz ]; then
	    wget -O /tmp/datagrip.tar.gz "https://download.jetbrains.com/datagrip/datagrip-$version.tar.gz"
	fi

	# Decompress datagrip
	tar -xf /tmp/datagrip.tar.gz --directory /opt

	# Get rid of existing symlink that points to now-obsolete version
	if [ -f /usr/bin/datagrip ]; then
		rm /usr/bin/datagrip
	fi

	# Create a symlink. Now you can run datagrip on the command line and
	# on the first run, it will create a start menu shortcut and such
	ln -s "/opt/DataGrip-$version/bin/datagrip.sh" /usr/bin/datagrip
	touch ~/installs/.datagrip

fi
echo "DataGrip $version"

version="2019.2.3"

if [ ! -f ~/installs/.pycharm ]; then

	# 
	# Download Pycharm
	if [ ! -f /tmp/pycharm.tar.gz ]; then
	    wget -O /tmp/pycharm.tar.gz "https://download.jetbrains.com/python/pycharm-community-$version.tar.gz"
	fi

	# Decompress Pycharm
	tar -xf /tmp/pycharm.tar.gz --directory /opt

	# Get rid of existing symlink that points to now-obsolete version
	if [ -f /usr/bin/pycharm ]; then
		rm /usr/bin/pycharm
	fi

	# Create a symlink. Now you can run pycharm on the command line and
	# on the first run, it will create a start menu shortcut and such
	ln -s "/opt/pycharm-community-$version/bin/pycharm.sh" /usr/bin/pycharm
	touch ~/installs/.pycharm

fi
echo "pycharm $version"

# install docker
if [ ! -f ~/installs/.docker ]; then
	sudo apt-get install apt-transport-https ca-certificates curl python-software-properties software-properties-common
	curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian wheezy stable"
	sudo apt-get update
	sudo apt-get install docker-ce -y
       	sudo apt-get install docker-compose -y
	touch ~/installs/.docker
fi 
docker --version

# git
if [ ! -f ~/installs/.git ]; then
	echo "installing git"
	sudo apt-get install git -y
	touch ~/installs/.git
fi
git --version

if [ ! -f ~/installs/.python ]; then
	# python and pip
	echo "installing python"
	sudo apt-get install python -y
	sudo apt-get install python3 -y
	sudo apt-get install python-pip -y 
	sudo apt-get install python3-pip -y
	touch ~/installs/.python
fi
python --version
python3 --version
echo "node and npm"
# node and npm
if [ ! -f ~/installs/.node ]; then
	sudo apt-get install node -y
	sudo apt-get install npm -y
	touch ~/installs/.node
fi
node --version
npm --version

# kubernets

# aws cli
if [ ! -f ~/installs/.aws ]; then
	sudo apt-get install awscli -y
	pip3 install awscli --upgrade --user
	touch ~/installs/.aws
fi
aws --version
# spark

version=2.4.4
hversion=3.2.1

if [ ! -f ~/installs/.spark ]; then
	
	if [ ! -f /tmp/spark.tar.gz ]; then
		wget -O /tmp/spark.tar.gz "https://www-eu.apache.org/dist/spark/spark-$version/spark-$version-bin-hadoop2.7.tgz"

	fi

	# descompress spark
	tar -xf /tmp/spark.tar.gz --directory /opt
	mv "spark-$version-bin-hadoop2.7" "spark"

	# hadoop

	if [ ! -f /tmp/hadoop.tar.gz ]; then
		wget -O /tmp/hadoop.tar.gz "https://www-eu.apache.org/dist/hadoop/common/hadoop-$hversion/hadoop-$hversion.tar.gz"
	fi

	# descompress hadoop
	tar -xf /tmp/hadoop.tar.gz --directory /opt
	mv "hadoop-$hversion" "hadoop"

	cat .bashrc > ~/.bashrc
	cat .bashrc > /home/noctorus/.bashrc
	source ~/.bashrc
	touch ~/installs/.spark

fi


