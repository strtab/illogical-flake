{ pkgs, lib, ... }:
pkgs.stdenv.mkDerivation rec {
  pname = "gruvbox-plus-icon-pack";
  version = "6.3.0";
  src = pkgs.fetchzip {
    url = "https://github.com/SylEleuth/gruvbox-plus-icon-pack/releases/download/v${version}/gruvbox-plus-icon-pack-${version}.zip";
    sha256 = "sha256-//b+nRH4heswMw+wTaThhDigr9Hf9dMIDugEkTFcrHc=";
    stripRoot = false;
  };
  installPhase = ''
    mkdir -p $out/share/icons
    cp -r Gruvbox-Plus-Dark $out/share/icons/
    cp -r Gruvbox-Plus-Light $out/share/icons/
  '';
  meta = {
    description = "A fork of SylEleuth/gruvbox-plus-icon-pack";
    homepage = "https://github.com/SylEleuth/gruvbox-plus-icon-pack";
    license = lib.licenses.gpl3;
  };
}
