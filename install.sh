#!/bin/bash
#
# Be VERY Careful. This script may be executed with admin privileges.

echo "Openframe Image -- install.sh"

# Some limited platform detection might be in order... though at present we're targeting the Pi
os=$(uname)
arq=$(uname -m)

if [ $os == "Linux" ]; then

    # on Debian Linux distributions
    # sudo apt-get update
    # do we really want to upgrade? this could take a damn long time.
    # sudo apt-get upgrade

    # same for any debian disto (untested), including rpi (tested)
    # sudo apt-get install -y fim

    sudo apt-get install -y flex bison libreadline-dev libexif-dev libpng-dev libjpeg-dev libgif-dev libtiff-dev libpoppler-dev libaa1-dev
    wget http://download.savannah.nongnu.org/releases/fbi-improved/fim-0.5-rc1.tar.gz
    tar xzf fim-0.5-rc1.tar.gz 
    cd fim-0.5-rc1 
    # ./configure --help=short 
    # read the ./configure --help=short output: you can give options to ./configure
    ./configure --enable-aa 
    make 
    sudo make install
    source ~/.bashrc

    if [ $arq == "armv7l" ]; then
        # on RaspberryPi

        # ####
        #
        # FOR NOW, CODE GOES HERE since we're shooting for RPi support
        #
        # ####
        echo "armv7l"


    else
        # Non-arm7 Debian...
        echo "non armv7l"
    fi

elif [ $os == "Darwin" ]; then
    # OSX
    echo "osx"
fi
