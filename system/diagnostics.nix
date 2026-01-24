{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # diagnostic tools
    btop
    dmidecode
    htop
    hwinfo
    nvtopPackages.full
    pciutils
    usbutils

    # Network tools
    inetutils  # telnet, ftp, etc.
    nmap       # port scanning
  ];
}
