# NixOS Configuration

A NixOS system configuration with support for AI, Machine Learning, Computer Vision, VFIO-enabled KVM virtualization with GPU acceleration, and a comprehensive software development ecosystem.   

```
├── configuration.nix                # Main configuration file
├── hardware-configuration.nix       # Auto-generated hardware config
├── system/
│   ├── audio.nix                    # Audio configuration
│   ├── bluetooth.nix                # Bluetooth configuration
│   ├── desktop.nix                  # KDE Plasma 6 configuration
│   ├── diagnostics.nix              # Diagnostic Software
│   ├── networking.nix               # Network settings
│   ├── nvidia.nix                   # GPU drivers and settings
│   ├── printing.nix                 # CUPS printer support
│   ├── programming-build-tools.nix  # Build tools and compilers
│   ├── programming-languages.nix    # Language runtimes
│   ├── storage-nas.nix              # Network storage
│   ├── vfio.nix                     # VFIO (GPU) device passthrough for virtual machines
│   └── virtualization.nix           # libvirt/virt-manager
└── users/
    └── nix-user.nix                 # User configuration
```

This configuration has been sanitized to remove sensitive data and is not suitable for production use. It has been published for template/reference purposes only.

## Resources

- [NixOS Manual](https://nixos.org/manual/nixos/stable/)
- [NixOS Options Search](https://search.nixos.org/options)
- [NixOS Package Search](https://search.nixos.org/packages)
- [NixOS Wiki](https://nixos.wiki/)
