#! /bin/bash

# This script minimises checks and time spent on the boot process.
sudo bootctl set-timeout 0
sudo bootctl update

# This script sets the default boot entry to the one with the highest version number.

# Get the default boot entry.
default_entry=$(sudo bootctl list | grep -E '^\*.*' | awk '{print $2}')