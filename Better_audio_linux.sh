#!/bin/sh

sudo echo "default-sample-format = float32le" > /home/$USER/.config/pulse/daemon.conf
sudo echo "default-sample-rate = 48000" >> /home/$USER/.config/pulse/daemon.conf
sudo echo "alternate-sample-rate = 44100" >> /home/$USER/.config/pulse/daemon.conf
sudo echo "default-sample-channels = 2" >> /home/$USER/.config/pulse/daemon.conf
sudo echo "default-channel-map = front-left,front-right" >> /home/$USER/.config/pulse/daemon.conf
sudo echo "default-fragments = 2" >> /home/$USER/.config/pulse/daemon.conf
sudo echo "default-fragment-size-msec = 125" >> /home/$USER/.config/pulse/daemon.conf
sudo echo "resample-method = soxr-vhq" >> /home/$USER/.config/pulse/daemon.conf
sudo echo "enable-lfe-remixing = no" >> /home/$USER/.config/pulse/daemon.conf
sudo echo "high-priority = yes" >> /home/$USER/.config/pulse/daemon.conf
sudo echo "nice-level = -11" >> /home/$USER/.config/pulse/daemon.conf
sudo echo "realtime-scheduling = yes" >> /home/$USER/.config/pulse/daemon.conf
sudo echo "realtime-priority = 9" >> /home/$USER/.config/pulse/daemon.conf
sudo echo "rlimit-rtprio = 9" >> /home/$USER/.config/pulse/daemon.conf
sudo echo "daemonize = no" >> /home/$USER/.config/pulse/daemon.conf
sudo echo "pcm.!default {" > /etc/asound.conf
sudo echo "type plug" >> /etc/asound.conf
sudo echo "   slave.pcm hw" >> /etc/asound.conf
sudo echo "}" >> /etc/asound.conf
echo "Please reboot your computer :)"
