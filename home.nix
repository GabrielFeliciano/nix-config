{ pkgs, inputs, ... }:

# Home manager Daemon didn't start
# https://github.com/nix-community/impermanence/issues/58
{ 
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
  ];

  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userName  = "Gabriel Feliciano";
      userEmail = "gfp001@outlook.com";
    };
  };

  home.homeDirectory = "/home/gabriel";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.persistence."/persist/home" = {
    directories = [
      "Downloads"
      "Music"
      "Pictures"
      "Documents"
      "Videos"
      "VirtualBox VMs"
      ".gnupg"
      ".ssh"
      ".nixops"
      ".local/share/keyrings"
      ".local/share/direnv"
      ".config/chromium"
      ".mozilla"
      ".cache/chromium"
      {
        directory = ".local/share/Steam";
        method = "symlink";
      }
    ];
    files = [
      ".screenrc"
    ];
    allowOther = true;
  };
}
