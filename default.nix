{ writeScriptBin, bash, nix, haskellPackages, ...}:
# TODO: This should probably use stdenv, but it works :)
writeScriptBin "-nix-project-tool" ''#!${bash}/bin/bash

PATH="${haskellPackages.styx}/bin:$PATH"
PATH="${haskellPackages.cabal2nix}/bin:$PATH"
PATH="${haskellPackages.cabal-install}/bin:$PATH"
PATH="${nix}/bin:$PATH"
export PATH
case $1 in
  help)
    styx --help
    ;;
  version)
    styx --version
    cabal2nix --version
    cabal --version
    ;;
  *)
    exec styx "$@"
    ;;
esac
''
