{ config, lib, pkgs, ... }:

{
  specialisation."VFIO".configuration = {
    system.nixos.tags = [ "vfio-isolation" ];

    boot = {
      # Force these modules to load in the Initrd (very early boot)
      initrd.kernelModules = [ "vfio_pci" "vfio" "vfio_iommu_type1" ];

      kernelParams = [
        "intel_iommu=on"
        "iommu=pt"
        # Hard-bind the IDs here. This is more authoritative than modprobe.
        "vfio-pci.ids=10de:27b2,10de:22bc"
      ];

      # Softdep as a backup
      extraModprobeConfig = ''
        softdep nvidia pre: vfio-pci
      '';
    };

  };
}
