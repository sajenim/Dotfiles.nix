{ pkgs, ... }:

{
  imports = [
    ./global

    ./features/desktop/common
    ./features/desktop/jade

    ./features/printing
    ./features/games
  ];

  home = {
    packages = with pkgs; [
      # Graphics
      gimp
      inkscape
      krita
      # Games
      gamemode
      protonup-ng
      prismlauncher
      runelite
      # Hardware
      libratbag
      piper
      # Misc
      spotify
      jellyfin-media-player
      firefox
      pulsemixer
    ];

    persistence."/persist/home/sajenim" = {
      directories = [
        ".mozilla"
        # Mutable configurations
        ".config/Yubico"
        # Application specific data
        ".local/share/PrismLauncher"
        # Our user data
        "Documents"
        "Downloads"
        "Games"
        "Music"
        "Pictures"
        "Printer"
        "Videos"
      ];
    };
  };
}

