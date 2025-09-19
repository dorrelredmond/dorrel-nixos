#! /run/current-system/sw/bin/bash

echo -e "n\Notice\nAre you linking nix or darwin configs?"
read configType
    
cd ~/.config

echo -e "\nNotice\nRequesting Update: Common Links"

if ln -sf ~/dorrel-nixos/common/home/config/* ./ ; then
    echo -e "Request Confirmed\nUpdate: Common Links Acquisition Successful"
else
    echo -e "\nNotice\nAn Error Has Occurred"
    exit 1
fi

echo -e "\nNotice\nRequesting Desired Links"

if [ $configType == "nix" ]; then
    if ln -sf ~/dorrel-nixos/nixos/home/config/* ./ ; then
        echo -e "Request Confirmed\nUpdate: Nix Links Acquisition Successful"
    else
        echo -e "\nNotice\nAn Error Has Occurred"
        exit 1
    fi
elif [ $configType == "darwin" ]; then
    if ln -sf ~/dorrel-nixos/darwin/home/config/* ./ ; then
        echo -e "Request Confirmed\nUpdate: Darwin Links Acquisition Successful"
    else
        echo -e "\nNotice\nAn Error Has Occurred"
        exit 1
    fi
else
    echo -e "\nNotice\nAn Error Has Occurred"
    exit 1
fi

echo -e "\nNotice\nAll Configurations Have Been Set"
