{ config, pkgs, ... }:
{
  users.users.nix-user = {
    isNormalUser = true;
    description = "nix-user";
    extraGroups = [
    "networkmanager"
    "wheel"
    "libvirtd"
    ];
    packages = with pkgs; [
      davinci-resolve-studio
      freerdp
      gimp
      google-chrome
      kdePackages.kate
      keepassxc
      kodi-wayland
      obs-studio
      reaper
      steam
      vscode
      zoom-us
    ];
  };
}
