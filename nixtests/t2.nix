{ config, lib, pkgs, ... }:

let
   unstable = import <unstable> {};
in {
  imports = [
    # include NixOS-WSL modules
    <nixos-wsl/modules>
  ];

  programs.bash.shellAliases = {
    vi = "nvim";
  };

  wsl.enable = true;
  wsl.defaultUser = "nixos";
  environment.systemPackages = [
    unstable.neovim
    pkgs.git
    pkgs.zig
    pkgs.lua
    pkgs.unzip
  ];
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
