

if [ $(whoami) != "root" ]
then
	echo "Please run as root. You can type \"sudo !!\""
	exit
fi

if [ $(which apt) ]
then
  APT="apt"
elif [ $(which apt-get) ]
then
  APT="apt-get"
else
  echo "Warning, apt and apt-get were not found on your system."
  exit
fi

# Update repository
$APT update

# Java - JDK8
echo "Should JDK-8 be installed? (Type Y or N)"
read userSAnswer
if [ $userSAnswer == "y" ] || [ $userSAnswer == "Y" ]
then
	add-apt-repository ppa:webupd8team/java
	$APT update
	echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
	update-java-alternatives -s java-8-oracle

	# $APT install oracle-java8-installer
	# $APT install openjdk-8-jdk
	# APT search jdk

	#Configure paths
	export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
	export PATH=$PATH:/usr/lib/jvm/java-8-openjdk/bin
fi

# MySql
echo "Should MySql be installed? (Type Y or N)"
read userSAnswer
if [ $userSAnswer == "y" ] || [ $userSAnswer == "Y" ]
then
	$APT install mysql-server
fi

# Apache
echo "Should Apache2 be installed? (Type Y or N)"
read userSAnswer
if [ $userSAnswer == "y"] || [ $userSAnswer == "Y" ]
then
	if [ $(which apache2) ]
	then
		echo "Apache is installed"
	else
		$APT install apache2
	fi
fi

# Git
echo "Should Git be installed? (Type Y or N)"
read userSAnswer
if [ $userSAnswer == "y" ] || [ $userSAnswer == "Y" ]
then
	$APT install git

	echo "Git username:"
	read gitUserName
	git config --global user.name $gitUserName

	echo "Git email:"
	read gitEmail
	git config --global user.name $gitEmail
fi

# VCode
echo "Should Visual Code be installed? (Type Y or N)"
read userSAnswer
if [ $userSAnswer == "y" ] || [ $userSAnswer == "Y" ]
then
	sudo add-apt-repository -y "deb https://packages.microsoft.com/repos/vscode stable main"
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EB3E94ADBE1229CF
	sudo $APT update
	sudo $APT -y install code
fi

# Sublime
echo "Should Sublime 3 be installed? (Type Y or N)"
read userSAnswer
if [ $userSAnswer == "y" ] || [ $userSAnswer == "Y" ]
then
	sudo add-apt-repository ppa:webupd8team/sublime-text-3
	sudo $APT update
	sudo $APT install sublime-text-installer
fi

# NodeJS and NPM
echo "Should NodeJS and NPM be installed? (Type Y or N)"
read userSAnswer
if [ $userSAnswer == "y" ] || [ $userSAnswer == "Y" ]
then
	$APT install nodejs
	$APT install npm
fi
