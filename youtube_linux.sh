#!/bin/bash

dpkg -s youtube-dl &> /dev/null

if [$? -ne 0]
   then 
      echo "youtube-dl has not been installed. It will be installed now."
      sudo apt-get update
      sudo apt-get install youtube-dl
   else
      read -p "Enter path to the location you want the download to go to: " path_
      youtube-dl --output $path_
      read -p "Enter URL of the video you want to download: " url
      youtube-dl -f best $url
      echo "Download successul!" 
fi


