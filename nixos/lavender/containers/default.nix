{ ... }:

{
  imports = [
    # Dashboard
    ./homepage

    # Website
    ./nginx

    # Dns blackhole
    ./pihole

    # Multimedia
    ./plex
    ./sonarr
    ./radarr
    ./prowlarr
    ./recyclarr

    # Documents & Files
    ./qbittorrent

    # Reverse proxy
    ./traefik
  ];
}
