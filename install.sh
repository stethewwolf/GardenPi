#!/bin/bash


if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

BASE_DIR=$(pwd)

SERVER_SRC=$BASE_DIR/src/server

NEW_USER=garden
NEW_USER_HOME=/var/lib/garden
NEW_USER_GROUPS=tty

DEB_TO_INSTALL="screen vim python3 python3-serial python3-pip"


/usr/sbin/adduser \ 
      --home-dir  $NEW_USER_HOME\
      --create-home --system \
      --groups  $NEW_USER_GROUPS\
      $NEW_USER

/usr/bin/apt-get install -y $DEB_TO_INSTALL

/usr/bin/cp -vr $SERVER_SRC $NEW_USER_HOME/src

/usr/bin/chown -R $NEW_USER. $NEW_USER_HOME
