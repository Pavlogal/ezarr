#!/bin/bash

# Make users and group
sudo useradd sonarr -u 13001
sudo useradd radarr -u 13002
sudo useradd lidarr -u 13003
sudo useradd readarr -u 13004
sudo useradd mylar -u 13005
sudo useradd audiobookshelf -u 13006
sudo useradd bazarr -u 13007
sudo useradd prowlarr -u 13008
sudo useradd jackett -u 13009
sudo useradd plex -u 13010
sudo useradd overseerr -u 130011
sudo useradd jellyseerr -u 13012
sudo useradd qbittorrent -u 130013
sudo useradd sabnzbd -u 13014

sudo groupadd mediacenter -g 13000

# Adds current user to the mediacenter group. This is recommended so that you can still have access to files inside the ezarr folder structure for manual manipulation.
# This is way better than just doing everything as root, especially on NFS shares. Also some services run as the default user anyway (Jellyfin, Tautulli) so this is necessary
sudo usermod -a -G mediacenter $USER

# adds all the service users to the group 
sudo usermod -a -G mediacenter sonarr
sudo usermod -a -G mediacenter radarr
sudo usermod -a -G mediacenter lidarr
sudo usermod -a -G mediacenter readarr
sudo usermod -a -G mediacenter mylar
sudo usermod -a -G mediacenter audiobookshelf
sudo usermod -a -G mediacenter bazarr
sudo usermod -a -G mediacenter prowlarr
sudo usermod -a -G mediacenter jackett
sudo usermod -a -G mediacenter plex
sudo usermod -a -G mediacenter overseerr
sudo usermod -a -G mediacenter jellyseerr
sudo usermod -a -G mediacenter qbittorrent
sudo usermod -a -G mediacenter sabnzbd

# Make directories
sudo mkdir -pv config/{sonarr,radarr,lidarr,readarr,mylar,audiobookshelf,bazarr,jackett,prowlarr,plex,tautulli,overseerr,jellyseerr,qbittorrent,sabnzbd}-config
sudo mkdir -pv data/{torrents,usenet,media}/{tv,movies,music,books,comics,audiobooks,podcasts,audiobookshelf-metadata}

# Set permissions
sudo chmod -R 775 data/
sudo chown -R $(id -u):mediacenter data/
sudo chown -R sonarr:mediacenter config/sonarr-config
sudo chown -R radarr:mediacenter config/radarr-config
sudo chown -R lidarr:mediacenter config/lidarr-config
sudo chown -R readarr:mediacenter config/readarr-config
sudo chown -R mylar:mediacenter config/mylar-config
sudo chown -R bazarr:mediacenter config/audiobookshelf-config
sudo chown -R bazarr:mediacenter config/bazarr-config
sudo chown -R prowlarr:mediacenter config/prowlarr-config
sudo chown -R jackett:mediacenter config/jackett-config
sudo chown -R plex:mediacenter config/plex-config
sudo chown -R overseerr:mediacenter config/overseerr-config
sudo chown -R jellyseerr:mediacenter config/jellyseerr-config
sudo chown -R qbittorrent:mediacenter config/qbittorrent-config
sudo chown -R sabnzbd:mediacenter config/sabnzbd-config

echo "UID=$(id -u)" >> .env
