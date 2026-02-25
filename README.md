# NixOS Configuration

A NixOS system configuration with support for AI, Machine Learning, Computer Vision, VFIO-enabled KVM virtualization with GPU acceleration, and a comprehensive software development ecosystem.   
<p align="left">
  <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/nixos/nixos-original.svg" height="40" alt="NixOS"/>
  <img width="12" />
  <img src="https://cdn.simpleicons.org/nvidia/76B900" height="40" alt="NVIDIA"/>
  <img width="12" />
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/pytorch/pytorch-original.svg" height="40" alt="PyTorch"/>
  <img width="12" />
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/vscode/vscode-original.svg" height="40" alt="VSCode"/>
  <img width="12" />
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/python/python-original.svg" height="40" alt="Python"/>
  <img width="12" />
  <img src="https://cdn.simpleicons.org/docker/2496ED" height="40" alt="Docker"/>
  <img width="12" />
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/cplusplus/cplusplus-original.svg" height="40" alt="C++"/>
  <img width="12" />
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/java/java-original.svg" height="40" alt="Java"/>
  <img width="12" />
  <img src="https://cdn.simpleicons.org/rust/B7410E" height="40" alt="Rust"/>
  <img width="12" />
  <img src="https://upload.wikimedia.org/wikipedia/commons/8/83/Steam_icon_logo.svg" height="40" alt="Steam"/>
  <img width="12" />
  <img src="https://upload.wikimedia.org/wikipedia/commons/d/d3/OBS_Studio_Logo.svg" height="40" alt="OBS Studio"/> 
</p>

```
├── configuration.nix                # Main configuration file
├── hardware-configuration.nix       # Auto-generated hardware config
├── system/
│   ├── audio.nix                    # Audio configuration
│   ├── bluetooth.nix                # Bluetooth configuration
│   ├── desktop.nix                  # KDE Plasma 6 configuration
│   ├── diagnostics.nix              # Diagnostic Software
│   ├── docker.nix                   # Docker
│   ├── networking.nix               # Network settings
│   ├── nvidia.nix                   # GPU drivers and settings
│   ├── printing.nix                 # CUPS printer support
│   ├── programming-build-tools.nix  # Build tools and compilers
│   ├── programming-languages.nix    # Language runtimes
│   ├── steam.nix                    # Steam
│   ├── storage-nas.nix              # Network storage
│   ├── vfio.nix                     # VFIO (GPU) device passthrough for virtual machines
│   ├── virtual-camera.nix           # v4l2loopback
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
