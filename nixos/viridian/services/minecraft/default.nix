{ inputs, pkgs, lib, ... }:
let
  modpack = pkgs.fetchPackwizModpack rec {
    version = "c9087bf";
    url = "https://github.com/sajenim/minecraft-modpack/raw/${version}/pack.toml";
    packHash = "sha256-F3moe9sxYSbJtPhkCRilqR91Ox+YlBrHN/dXykNajDs=";
  };
  mcVersion = modpack.manifest.versions.minecraft;
  fabricVersion = modpack.manifest.versions.fabric;
  serverVersion = lib.replaceStrings [ "." ] [ "_" ] "fabric-${mcVersion}";
in
{
  imports = [
    inputs.nix-minecraft.nixosModules.minecraft-servers
  ];

  nixpkgs.overlays = [
    inputs.nix-minecraft.overlay
  ];

  services.minecraft-servers = {
    # Enable all of our servers
    enable = true;

    # Our minecraft servers
    servers = {
      kanto = {
        enable = true;
        # The minecraft server package to use.
        package = pkgs.fabricServers.${serverVersion}.override { loaderVersion = fabricVersion; }; # Specific fabric loader version.

        # Allowed players
        whitelist = {
          jasmariiie = "82fc15bb-6839-4430-b5e9-39c5294ff32f";
          Spectre_HWS = "491c085e-f0dc-44f1-9fdc-07c7cfcec8f2";
        };

        # JVM options for the minecraft server.
        jvmOpts = "-Xmx8G";

        # Minecraft server properties for the server.properties file.
        serverProperties = {
          gamemode = "survival";
          difficulty = "normal";
          motd = "\\u00A7aKanto Network \\u00A7e[1.19.2]\\u00A7r\\n\\u00A78I'll Use My Trusty Frying Pan As A Drying Pan!";
          server-port = 25565;
          white-list = true;
        };
        
        # Things to symlink into this server's data directory.
        symlinks = {
         "mods" = "${modpack}/mods";
        };

        # Things to copy into this server's data directory.
        files = {
          "ops.json" = ./ops.json;

          # Youre in grave danger
          "config/yigd.toml" = "${modpack}/config/yigd.toml";
        };

        # Value of systemd's `Restart=` service configuration option.
        restart = "no";
      };
    };

    # Each server will be under a subdirectory named after the server name.
    dataDir = "/srv/services/minecraft";

    # Open firewall for all servers.
    openFirewall = true;

    # https://account.mojang.com/documents/minecraft_eula
    eula = true;
  };
}