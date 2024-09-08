let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/archive/6e99f2a27d60.tar.gz";
  pkgs = import nixpkgs {
    config = { };
    overlays = [ ];
  };
in
pkgs.mkShellNoCC {
  packages = with pkgs; [
    (python3.withPackages (ps: with ps; [ argparse ]))
    nixfmt-rfc-style
  ];
}
