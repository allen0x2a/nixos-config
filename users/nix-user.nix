# fileName user.nix
{ config, pkgs, ... }:
{
  # Enable Flatpak service
  services.flatpak.enable = true;
  xdg.portal.enable = true;
  users.users.nixuser = {
    isNormalUser = true;
    description = "nixuser";
    extraGroups = [
      "docker"
      "libvirtd"
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      (symlinkJoin {
        name = "davinci-resolve-studio-wrapped";
        paths = [ davinci-resolve-studio ];
        nativeBuildInputs = [ makeWrapper ]; # nativeBuildInputs is cleaner for hooks
        postBuild = ''
          # Fix "GPU memory is full" error caused by OpenGL running on Intel iGPU
          #
          # __NV_PRIME_RENDER_OFFLOAD=1        - Enables NVIDIA PRIME offloading for hybrid GPU setups
          # __NV_PRIME_RENDER_OFFLOAD_PROVIDER - Specifies the NVIDIA GPU as the primary rendering device
          # __GLX_VENDOR_LIBRARY_NAME=nvidia   - Force NVIDIA OpenGL instead of Mesa
          # __VK_LAYER_NV_optimus=NVIDIA_only  - Force Vulkan to use NVIDIA only to prevent driver conflicts
          # QT_AUTO_SCREEN_SCALE_FACTOR=2      - Scales the Qt-based UI for high-resolution (4K) displays
          wrapProgram $out/bin/davinci-resolve-studio \
            --set __NV_PRIME_RENDER_OFFLOAD 1 \
            --set __NV_PRIME_RENDER_OFFLOAD_PROVIDER NVIDIA-G0 \
            --set __GLX_VENDOR_LIBRARY_NAME nvidia \
            --set __VK_LAYER_NV_optimus NVIDIA_only \
            --set QT_AUTO_SCREEN_SCALE_FACTOR 2
        '';
      })
      ffmpeg-full
      freerdp
      gimp
      google-chrome
      kdePackages.kate
      keepassxc
      kodi-wayland
      nixfmt-rfc-style
      (obs-studio.override { cudaSupport = true; ffmpeg = pkgs.ffmpeg-full; })
      reaper
      shotcut
      steam
      vlc
      vscode
      zoom-us
    ];
  };
}
