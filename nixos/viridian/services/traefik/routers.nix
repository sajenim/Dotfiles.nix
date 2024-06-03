{ ... }:

{ 
  services.traefik.dynamicConfigOptions.http.routers = {
    httpd = {
      rule = "Host(`sajenim.dev`)";
      entryPoints = [
        "websecure"
      ];
      middlewares = [
        "geoblock"
      ];
      service = "httpd";
    };

    forgejo = {
      rule = "Host(`git.sajenim.dev`)";
      entryPoints = [
        "websecure"
      ];
      middlewares = [
        "geoblock"
      ];
      service = "forgejo";
    };

    homarr = {
      rule = "Host(`kanto.dev`)";
      entryPoints = [ 
        "websecure"
      ];
      middlewares = [ 
        "admin"
      ];
      service = "homarr";
    };

    traefik-dashboard = {
      rule = "Host(`traefik.kanto.dev`)";
      entryPoints = [
        "websecure"
      ];
      middlewares = [
        "admin"
      ];
      service = "api@internal";
    };

    adguard-home = {
      rule = "Host(`adguard.kanto.dev`)";
      entryPoints = [
        "websecure"
      ];
      middlewares = [
        "admin"
      ];
      service = "adguard-home";
    };

    minecraft = {
      rule = "Host(`minecraft.kanto.dev`)";
      entryPoints = [
        "websecure"
      ];
      middlewares = [
        "internal"
      ];
      service = "minecraft";
    };

    jellyfin = {
     rule = "Host(`jellyfin.kanto.dev`)";
      entryPoints = [
        "websecure"
      ];
      middlewares = [
        "internal"
      ];
      service = "jellyfin";
    };

    sonarr = {
      rule = "Host(`sonarr.kanto.dev`)";
      entryPoints = [
        "websecure"
      ];
      middlewares = [
        "admin"
      ];
      service = "sonarr";
    };

    radarr = {
      rule = "Host(`radarr.kanto.dev`)";
      entryPoints = [
        "websecure"
      ];
      middlewares = [
        "admin"
      ];
      service = "radarr";
    };

    lidarr = {
      rule = "Host(`lidarr.kanto.dev`)";
      entryPoints = [
        "websecure"
      ];
      middlewares = [
        "admin"
      ];
      service = "lidarr";
    };

    prowlarr = {
      rule = "Host(`prowlarr.kanto.dev`)";
      entryPoints = [
        "websecure"
      ];
      middlewares = [
        "admin"
      ];
      service = "prowlarr";
    };

    qbittorrent = {
      rule = "Host(`torrent.kanto.dev`)";
      entryPoints = [
        "websecure"
      ];
      middlewares = [
        "admin"
      ];
      service = "qbittorrent";
    };

    jellyseerr = {
      rule = "Host(`jellyseerr.kanto.dev`)";
      entryPoints = [
        "websecure"
      ];
      middlewares = [
        "internal"
      ];
      service = "jellyseerr";
    };

    microbin = {
      rule = "Host(`bin.kanto.dev`)";
      entryPoints = [
        "websecure"
      ];
      middlewares = [
        "internal"
      ];
      service = "microbin";
    };

    ender1 = {
      rule = "Host(`e1.kanto.dev`)";
      entryPoints = [
        "websecure"
      ];
      middlewares = [
        "admin"
      ];
      service = "ender1";
    };
  };
}

