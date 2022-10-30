#!/usr/bin/env bash

set -e

build_image () {
    echo "Building image for $1"
    if [ ! -d pmaports ]; then
        git clone https://gitlab.com/postmarketOS/pmaports.git
    else 
        cd pmaports
        git pull
        git remote add planet-computers https://github.com/PCPostmarketOS-Ports/pmaports.git
        git fetch --all
        git switch device-planet-cosmocom
        cd ..
    fi

    yes "" | pmbootstrap -y -w $PWD/work -p $PWD/pmaports init

    pmbootstrap config ui weston
    pmbootstrap config device "${1}"
    pmbootstrap config kernel "${2}"

    pmbootstrap -q -y zap -p

    # 12345 is the default pin
    password=12345
    printf "%s\n%s\n" $password $password | pmbootstrap \
        -m http://dl-cdn.alpinelinux.org/alpine/ \
        -mp http://mirror.postmarketos.org/postmarketos/ \
        --details-to-stdout \
        install

    find $(pmbootstrap config work)/chroot_native/home/pmos/

#    cp -v $(pmbootstrap config work)/chroot_native/home/pmos/rootfs/${1}.img .

    WORK=$(pmbootstrap config work)
    pmbootstrap -y zap
    pmbootstrap shutdown
    sudo rm -rf $WORK
    sudo rm ~/.config/pmbootstrap.cfg
}

build_image "planet-cosmocom" ""
