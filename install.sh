#! /bin/bash

#variables used
#the const ip for connecting to Sophos wifi in Sabar campus
ip="172.16.16.1"
id="This variable will hold your Institute ID"
password="This variable will hold your password"

echo "Enter Your Sophos login Credentials"
read -p 'Your Institute ID(eg: 201851029): ' id

#code dhyaan se padhne ke liye shukriya 🙏
#bohut jugadu method hai ID verify karne ka 😢
until [ $id -gt 201651000 ] && [ $id -lt 202051000 ]
do
    echo "Enter correct ID(201651000 < ID < 201951000)"
    read -p "Institue ID: " id
done

read -sp 'Enter Your Sophos password: ' password
echo ""

# echo "Your ID is $id"
# echo "Your Password is $password"

# echo "Generating config file"

# echo "$(touch /caa.conf)"

#creating directory for extension related files
if mkdir -p ~/.local/share/gnome-shell/extensions/sophossabar@ashutoshsingh05.co ; then
    echo "Created required directories"
else
    echo "Error creating directory ~.local/share/gnome-shell/extensions/sophossabar@ashutoshsingh05.co"
    exit 7
fi

#copying extension files to appropriate directory
if cp -r {icons,extension.js,metadata.json,stylesheet.css} ~/.local/share/gnome-shell/extensions/sophossabar@ashutoshsingh05.co ; then
    echo "Copied extension files, please restart and enable extension from gnome-tweak tool"
else
    echo "Error copying extension files to ~/.local/share/gnome-shell/extensions/sophossabar@ashutoshsingh05.co"
    exit 8
fi

#copy sophos script files from curent directory to home directory
if cp -r .caa ~/ ; then
    echo "Succesfully copied files to $HOME"
else
    echo "Error coping folder .caa to home directory. Check write permissions and copy files manually."
    exit 2
fi

#create file with touch command
if touch ~/.caa/caa.conf ; then
    echo "Generated config file"
else
    echo "Error creating file caa.conf. Do you have write permissions?"
    exit 1
fi

#add credentials to caa.conf file
if echo "Copernicus host: $ip" > ~/.caa/caa.conf && echo "Username: $id" >> ~/.caa/caa.conf && echo "Password: $password" >> ~/.caa/caa.conf ;then
    echo "Succesfully added credentials"
else
    echo "Error writing credentials to file caa.conf, are you root?"
    exit 4
fi

#start script in daemon mode
if ~/.caa/bin/caa -d ;then
    echo "Started Sophos client in daemon mode"
else
    echo "Error starting Sophos client"
    exit 5
fi

# echo "Copernicus host: $ip" > caa.conf
# echo "Username: $id" >> caa.conf
# echo "Password: $password" >> caa.conf