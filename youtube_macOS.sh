#!/bin/bash

PROGRAM="youtube-dl"

if [ -e ~/.usr/local/bin/$PROGRAM ]; then
   read -p "Enter path to the location you want the download to go to: " path_
   youtube-dl --output $path_
   read -p "Enter URL of the video you want to download: " url
   youtube-dl -f best $url
   echo "Download successul!"
else
   if [!  -e ~/.usr/local/bin/pip3 ]; then
   echo "pip3, a requirement for youtube-dl will be installed."
   curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
   python3 get-pip.py
   python3 -m pip install –upgrade pip
   else
	echo "youtube-dl will now be installed:"
	pip3 install youtube-dl
fi

    read -p "Enter path to the location you want the download to go to: " path_
    youtube-dl --output $path_
    read -p "Enter URL of the video you want to download: " url
    youtube-dl -f best $url
    echo "Download successul!"
   
fi


