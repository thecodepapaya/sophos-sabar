# 📡 Sabar Sophos

## 🙄 What it does
Helps you connect to the Sabar campus sophos network without the need of any login portal or whatsoever 🙄

## 🛠 Requirements
- Your laptop 🙄
- Linux OS
- gnome-tweak tool (can be installed with `sudo apt install gnome-tweaks`)
- Gnome Shell (I made this on v3.34.1, not sure on what other versions it's going to work, you are free to test on different verions and send relevant PRs)

## 🍼 How to use
Just clone this repos using
```
git clone https://github.com/ashutoshsingh05/sophos-sabar.git
```
then change the directory with 
```
cd sophos-sabar
```
and finally run the `install.sh` script inside current directory with
```
./install.sh
```

Connect your laptop to the sophos wifi and follow the on screen cues and provide your Institite ID and Sophos login password (don't worry, it won't be saved anywhere in plain.txt) and you are good to go.

Log out and log back in or enter `r` in command palette (Alt+F2) to restart your gnome shell and you should see a new icon in the top right corner of your screen. Click on it to start or reset your connection anytime whenever you are connected to the Sophos wifi network.

### ☠ Entered incorrect password?
Don't worry, just run the `updatePassword.sh` script and you are good to go.

## 🤔 Pupose of making this
I got tired of logging in again and again using the Sophos login portal
