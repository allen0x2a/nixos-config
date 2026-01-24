{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Compilers
    gcc
    clang

    # Build systems
    cmake
    gnumake
    meson
    ninja
    autoconf
    automake
    libtool
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
