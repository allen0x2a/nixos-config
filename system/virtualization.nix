{ config, pkgs, ... }:
{
  # Enable libvirtd with QEMU/KVM
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = false;
      swtpm.enable = true;
    };
  };

  # Add user to libvirtd and kvm groups
  users.users.nix-user.extraGroups = [ "libvirtd" "kvm" ];

  # Enable dconf for virt-manager settings
  programs.dconf.enable = true;

  # Install virt-manager and related tools
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    spice
    spice-gtk
    spice-protocol
    virtio-win
    win-spice
    qemu_kvm
  ];

  # Enable USB redirection
  virtualisation.spiceUSBRedirection.enable = true;

  # Set default libvirt URI to system
  environment.sessionVariables = {
    LIBVIRT_DEFAULT_URI = "qemu:///system";
  };

    # Create bridge on eno2 (second ethernet port)
  networking.bridges.br0.interfaces = [ "eno2" ];
  networking.interfaces.br0.useDHCP = true;
  networking.interfaces.eno2.useDHCP = false;

  # Disable STP for no delays
  systemd.network.netdevs."10-br0".netdevConfig = {
    Name = "br0";
    Kind = "bridge";
  };

  systemd.network.netdevs."10-br0".bridgeConfig = {
    STP = false;
  };


}
