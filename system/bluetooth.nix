{ config, pkgs, ... }:
{
  # Enable Bluetooth
  hardware.bluetooth.enable = true;

  # Optional: auto-power on at boot
  hardware.bluetooth.powerOnBoot = true;

  # Enable Bluetooth management (blueman for GUI)
  services.blueman.enable = true;

}
