{ config, pkgs, ... }:

{
  home.username = "tux";
  home.homeDirectory = "/home/tux";

  home.stateVersion = "25.11";

  home.packages = [
    pkgs.alacritty
    pkgs.chromium
    pkgs.bc
    pkgs.git
    pkgs.bat
    pkgs.eza
    pkgs.zoxide
    pkgs.nitch
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.fish
    pkgs.tmux
    pkgs.rofi
    pkgs.kdePackages.dolphin
  ];

  imports = [
    ../default/alacritty.nix
    ../default/git.nix
    ../default/neovim.nix
    ../default/fish.nix
    ../default/tmux.nix
    ../default/rofi.nix
    ../default/polybar.nix
    ./modules/qtile.nix
  ];

  programs.home-manager.enable = true;
}
