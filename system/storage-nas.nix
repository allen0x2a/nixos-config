{ config, pkgs, ... }:
{
  # Install CIFS utilities
  environment.systemPackages = with pkgs; [
    cifs-utils
  ];

  # Mount network drive
  fileSystems."/mnt/nas" = {
    device = "//127.0.0.1/share";
    fsType = "cifs";
    options = [
      "credentials=/root/.smbcredentials"
      "uid=1000"
      "gid=100"
      "iocharset=utf8"
      "file_mode=0755"
      "dir_mode=0755"
      "vers=3.1.1"            # SMB3 for speed (or vers=3.0 if server doesn't support 3.1.1)
      "cache=loose"           # Aggressive caching for maximum speed
      "actimeo=30"            # Cache attributes for 30 seconds
      "noserverino"           # Better performance
      "nofail"                # Don't fail boot if unavailable
      "x-systemd.automount"   # Auto-mount on first access
      "x-systemd.idle-timeout=300"  # Auto-unmount after 5min idle (optional)
    ];
  };
}
