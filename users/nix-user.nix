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
        nativeBuildInputs = [ makeWrapper ]; # ativeBuildInputs is cleaner for hooks
        postBuild = ''
          # 'wrapProgram' modifies the file in place within the new symlink tree
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
