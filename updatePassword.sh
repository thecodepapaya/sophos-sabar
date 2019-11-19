#! /bin/bash

ip="172.16.16.1"
id="201851029"
password="your old password"

read -p "Enter new IP(old was 172.16.16.1): " ip
read -p "Enter new Institue ID: " id
read -sp "Enter new password: " password

echo ""

# echo "ID: $id"
# echo "Password: $password"

#add credentials to caa.conf file
if echo "Copernicus host: $ip" > ~/.caa/caa.conf && echo "Username: $id" >> ~/.caa/caa.conf && echo "Password: $password" >> ~/.caa/caa.conf ;then
    echo "Genrated new config file"
else
    echo "Error writing credentials to file caa.conf, have you installed the program and have root access?"
    exit 3
fi

#start script in daemon mode
pid=$(pgrep caa)
echo "Process ID: $pid"
kill $pid
echo "Killed PID: $pid"
echo "Restarting..."
if ~/.caa/bin/caa -d ;then
    echo "Started Sophos client in daemon mode"
else
    echo "Error starting Sophos client"
    exit 5
fi

