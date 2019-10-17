#!/bin/sh

echo "default-sample-format = float32le" > ~/.config/pulse/daemon.conf
echo "default-sample-rate = 48000" >> ~/.config/pulse/daemon.conf
echo "alternate-sample-rate = 44100" >> ~/.config/pulse/daemon.conf
echo "default-sample-channels = 2" >> ~/.config/pulse/daemon.conf
echo "default-channel-map = front-left,front-right" >> ~/.config/pulse/daemon.conf
echo "default-fragments = 2" >> ~/.config/pulse/daemon.conf
echo "default-fragment-size-msec = 125" >> ~/.config/pulse/daemon.conf
echo "resample-method = soxr-vhq" >> ~/.config/pulse/daemon.conf
echo "enable-lfe-remixing = no" >> ~/.config/pulse/daemon.conf
echo "high-priority = yes" >> ~/.config/pulse/daemon.conf
echo "nice-level = -11" >> ~/.config/pulse/daemon.conf
echo "realtime-scheduling = yes" >> ~/.config/pulse/daemon.conf
echo "realtime-priority = 9" >> ~/.config/pulse/daemon.conf
echo "rlimit-rtprio = 9" >> ~/.config/pulse/daemon.conf
echo "daemonize = no" >> ~/.config/pulse/daemon.conf
sudo -i 
echo "pcm.!default {" > /etc/asound.conf
echo "type plug" >> /etc/asound.conf
echo "   slave.pcm hw" >> /etc/asound.conf
echo "}" >> /etc/asound.conf
sudo shutdown -r 0
