# nvidia.nix
{ config, pkgs, ... }:
{
  # NVIDIA proprietary driver for the X server.
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    open = true;  # RTX 20 series+, set false for older GPUs
    nvidiaSettings = true;
    powerManagement.enable = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Reduce DRM errors and monitor(s) freezing
  # - modeset=1: Enable kernel modesetting for proper display management
  # - fbdev=1: Enable framebuffer device, fixes dual monitor freeze during login
  # - PreserveVideoMemoryAllocations=1: Preserve VRAM on suspend/resume
  # - NVreg_OpenRmEnableUnsupportedGpus=1 Explicitly allow the Open RM for the 5080 to prevent init hangs
  # - pci=noaer Explicitly allow the Open RM for the 5080 to prevent init hangs
  # - efifb and vesafb=off: Disable framebuffers to prevent the kernel from 'hanging' while searching for monitors on the secondary GPU
  boot.kernelParams = [
    "nvidia-drm.modeset=1"
    "nvidia-drm.fbdev=1"
    "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
    "nvidia.NVreg_OpenRmEnableUnsupportedGpus=1"
    "pci=noaer"
    "video=efifb:off"
    "video=vesafb:off"
  ];
}
