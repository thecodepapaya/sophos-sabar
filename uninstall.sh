#! /bin/bash

choice="n"
read -p "This script will remove all the Sophos client from your machine. Continue(y/n)?: " choice

if [[ "$choice" == "y" ]] || [[ "$choice" == "Y" ]];
then
    if rm -r ~/.caa ;then
        echo "Uninstalled Sophos client. You can now turn this extension off in gnome-tweak tools."
    else
        echo "Error deleting folder .caa from $HOME."
        exit 6
    fi
else
    echo "Not Uninstalling"
fi