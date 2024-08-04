{ inputs, outputs, ... }: {
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
    ../features/cli
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };
  
  programs.home-manager.enable = true;

  home = {
    username = "sajenim";
    homeDirectory = "/home/sajenim";
    sessionVariables = {
      EDITOR = "nvim";
    };

    persistence."/persist/home/sajenim" = {
      directories = [
        ".gnupg"
        ".ssh"
        ".var/app"
        ".local/bin"
        ".local/share/flatpak"
        ".local/share/nix"
        ".local/share/direnv"
      ];
      files = [
        ".zsh_history"
      ];
      allowOther = true;
    };
  };

  systemd.user.startServices = "sd-switch";
  home.stateVersion = "22.11";
}
