#!/bin/bash

# Running MongoDB automatically on linux

# feel free to change, update, improve, and release this script

# suggestions of feedback? reach me at junior.holowka@gmail.com

# latest update 06/Fev/2012


service="mongoservice.sh"
command="mongod"
paramn="--rest"
install="apt-get install --yes --force-yes"

$install chkconfig

sudo touch /etc/init.d/$service
sudo sh -c 'echo "#!/bin/sh" >> /etc/init.d/'${service}''
sudo sh -c 'echo "" >> /etc/init.d/'${service}''
sudo sh -c 'echo "if [ -e /data/db/mongod.lock ]" >> /etc/init.d/'${service}''
sudo sh -c 'echo "then" >> /etc/init.d/'${service}''
sudo sh -c 'echo "rm /data/db/mongod.lock" >> /etc/init.d/'${service}''
sudo sh -c 'echo "'${command}' '${paramn}'" >> /etc/init.d/'${service}''
sudo sh -c 'echo "else" >> /etc/init.d/'${service}''
sudo sh -c 'echo "'${command}' '${paramn}'" >> /etc/init.d/'${service}''
sudo sh -c 'echo "fi" >> /etc/init.d/'${service}''
sudo sh -c 'echo "" >> /etc/init.d/'${service}''

sudo chmod 755 /etc/init.d/$service
sudo chkconfig --add $service
sudo chkconfig  --level 2345 $service on
sudo service $service start


# Removing service from all run levels
# sudo update-rc.d -f mongoservice.sh remove
# sudo rm /etc/init.d/mongoservice.sh




