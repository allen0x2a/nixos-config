# programming-build-tools.nix

{ config, pkgs, ... }:
{

  # Enables compatibility layer for running unpatched dynamic binaries (e.g. VS Code extensions,
  # prebuilt tools) that expect standard Linux library paths instead of /nix/store
  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [
    # Compilers
    clang
    gcc

    # Build systems
    autoconf
    automake
    cmake
    dbus
    gnumake
    libtool
    meson
    ninja
    pkg-config

    # Version control
    git
    gh                  # GitHub CLI

    # Editors
    nano
    vim

    # Debugging and profiling
    gdb
    lldb
    valgrind

    # Other essentials
    binutils            # ar, ld, objdump, etc.
    curl
    patchelf            # For fixing binaries on NixOS
    wget

  ];
}
