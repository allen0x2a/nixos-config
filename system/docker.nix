# system/docker.nix
{ config, pkgs, ... }:

{
  # --- Docker Daemon Configuration ---
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    daemon.settings.features.cdi = true;
    autoPrune = {
      enable = true;
      dates = "weekly";
    };
  };

  # This enables the CDI (Container Device Interface) for NVIDIA.
  hardware.nvidia-container-toolkit.enable = true;

  # --- CLI Tools ---
  environment.systemPackages = with pkgs; [
    docker-compose  # Modern docker-compose (v2)
    nvtopPackages.full # GPU monitor that works for both host and container
  ];
}
