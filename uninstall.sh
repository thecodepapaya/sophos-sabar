#! /bin/bash

choice="n"
read -p "This script will remove all the Sophos client from your machine. Continue(y/n)?: " choice

if [[ "$choice" == "y" ]] || [[ "$choice" == "Y" ]];
then
    if rm -r ~/.caa && rm -r ~/.local/share/gnome-shell/extensions/sophossabar@ashutoshsingh05.co ;then
        echo "Uninstalled Sophos client and shell extension. Log out and Log back in."
    else
        echo "Error deleting folders .caa and sophossabar@ashutoshsingh05.co"
        exit 6
    fi
else
    echo "Aborted"
fi