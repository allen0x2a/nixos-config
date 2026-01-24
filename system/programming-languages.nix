{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Python
    python312
    python312Packages.pip
    python312Packages.virtualenv

    # Rust
    rustc
    cargo
    rustfmt
    clippy

    # Java
    jdk21
    maven
    gradle

    # Node.js
    nodejs_22              # Node.js 22 LTS
    nodePackages.npm
    nodePackages.yarn      # Optional: if you use yarn
    nodePackages.pnpm      # Optional: if you use pnpm
  ];
}
