#!/bin/bash

sudo addgroup kvm
sudo adduser $USER kvm
sudo chown root:kvm /dev/kvm
