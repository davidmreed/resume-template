{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    nativeBuildInputs = with pkgs.buildPackages; [ zola just python311Packages.weasyprint inotify-tools ];
}