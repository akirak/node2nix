# This file has been generated by node2nix 1.9.0. Do not edit!

{pkgs ? import <nixpkgs> {
    inherit system;
  }, system ? builtins.currentSystem, nodejs ? pkgs."nodejs-14_x"}:

let
  nodeEnv = import ../nix/node-env.nix {
    inherit (pkgs) stdenv lib python2 runCommand writeTextFile;
    inherit pkgs nodejs;
    libtool = if pkgs.stdenv.isDarwin then pkgs.darwin.cctools else null;
  };
in
import ./node-packages-v14.nix {
  inherit (pkgs) fetchurl nix-gitignore stdenv lib fetchgit;
  inherit nodeEnv;
}