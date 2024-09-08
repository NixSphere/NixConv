{
  config,
  lib,
  pkgs,
  ...
}:
let
  unstable = import <unstable> { };
in
{
  imports = [ <nixos-wsl/modules> ];
  programs.bash.shellAliases = {
    vi = nvim;
  };
  wsl.enable = true;
  wsl.defaultUser = nixos;
  environment.systemPackages = [
    unstable.neovim
    pkgs.git
    pkgs.zig
    pkgs.lua
    pkgs.unzip
  ];
  system.stateVersion = 24.05;
}
