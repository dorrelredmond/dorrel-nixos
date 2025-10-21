#! /run/current-system/sw/bin/bash
  
cd ~/.config

echo -e "\nNotice\nRequesting Update: Required Links"

if ln -sf ~/dorrel-nixos/common/home//required/config/* ./ ; then
    echo -e "Request Confirmed\nUpdate: Required Links Acquisition Successful"
else
    echo -e "\nNotice\nAn Error Has Occurred"
    exit 1
fi

echo -e "\nNotice\nRequired Configurations Have Been Set"
