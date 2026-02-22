# networking.nix
{ config, pkgs, ... }:
{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Set to flase because redundant with NetworkManager
  networking.dhcpcd.enable = false;

  # Set to false otherwise will block the boot/login if the KVM network isn't online
  systemd.services.NetworkManager-wait-online.enable = false;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
}
