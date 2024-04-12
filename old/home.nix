{ config, pkgs, ...}:

let
  wallpaperImg = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/wyfhbb/MyNixosConfiguration/main/Wallpaper/1689266787572.jpg";
    # replace this with the SHA256 hash of the image file
    hash = "sha256-0oqiUASeamh0J+qj1Pda5YzQqoAYN/J4naiZ/54Xa4M";
  };
  wallpaperImgDark = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/wyfhbb/MyNixosConfiguration/main/Wallpaper/1689266903394.jpg";
    # replace this with the SHA256 hash of the image file
    hash = "sha256-RDV4cah8QZMnup0zcvpLijyy/zJ8BeqidkAKK1DNXE0";
  };
in
{
  home.username = "wyf";
  home.homeDirectory = "/home/wyf";

  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri = "file://${wallpaperImg}";
      picture-uri-dark = "file://${wallpaperImgDark}";
    };
    "org/gnome/desktop/interface" = {
      enable-hot-corners = true;
    };
    "org/gnome/mutter" = {
      edge-tiling = true;
    };
  };
  
  home.packages = with pkgs;[
    htop
  ];
  home.stateVersion = "23.11";
}