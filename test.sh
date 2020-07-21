#!/bin/bash

CURRENTUSERNAME=$(logname)

echo "User: $CURRENTUSERNAME"
echo "Sudo: $SUDO_USER"
echo "I am: $(whoami)"
