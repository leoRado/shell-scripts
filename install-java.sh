#Check for root
if [ $(whoami) != "root" ]
then
  echo "Please run as root."
  exit
fi
#If user is root, continue
#Check for apt, with a fallback to apt-get
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
#Install
$APT install openjdk-8-jdk
APT search jdk
#Configure paths
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export PATH=$PATH:/usr/lib/jvm/java-8-openjdk/bin
