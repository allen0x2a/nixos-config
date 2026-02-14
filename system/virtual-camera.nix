{ config, pkgs, ... }:

{
  # v4l2loopback for virtual camera
  boot.extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];
  boot.kernelModules = [ "v4l2loopback" ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=2 card_label=virtual-camera exclusive_caps=1
  '';

  # userspace tools
  environment.systemPackages = with pkgs; [
    v4l-utils
  ];
}
