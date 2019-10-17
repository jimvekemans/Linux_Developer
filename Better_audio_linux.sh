#!/bin/sh

sudo -i 
echo "default-sample-format = float32le" > /home/$USER/.config/pulse/daemon.conf
echo "default-sample-rate = 48000" >> /home/$USER/.config/pulse/daemon.conf
echo "alternate-sample-rate = 44100" >> /home/$USER/.config/pulse/daemon.conf
echo "default-sample-channels = 2" >> /home/$USER/.config/pulse/daemon.conf
echo "default-channel-map = front-left,front-right" >> /home/$USER/.config/pulse/daemon.conf
echo "default-fragments = 2" >> /home/$USER/.config/pulse/daemon.conf
echo "default-fragment-size-msec = 125" >> /home/$USER/.config/pulse/daemon.conf
echo "resample-method = soxr-vhq" >> /home/$USER/.config/pulse/daemon.conf
echo "enable-lfe-remixing = no" >> /home/$USER/.config/pulse/daemon.conf
echo "high-priority = yes" >> /home/$USER/.config/pulse/daemon.conf
echo "nice-level = -11" >> /home/$USER/.config/pulse/daemon.conf
echo "realtime-scheduling = yes" >> /home/$USER/.config/pulse/daemon.conf
echo "realtime-priority = 9" >> /home/$USER/.config/pulse/daemon.conf
echo "rlimit-rtprio = 9" >> /home/$USER/.config/pulse/daemon.conf
echo "daemonize = no" >> /home/$USER/.config/pulse/daemon.conf
echo "pcm.!default {" > /etc/asound.conf
echo "type plug" >> /etc/asound.conf
echo "   slave.pcm hw" >> /etc/asound.conf
echo "}" >> /etc/asound.conf
sudo shutdown -r 0
