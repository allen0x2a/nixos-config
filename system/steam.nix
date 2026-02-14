{ pkgs, ... }:
{
  # ===========================================================================
  # CORE STEAM CONFIGURATION
  # ===========================================================================
  programs.steam = {
    enable = true;
    # Installs GE-Proton (GloriousEggroll) declaratively
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };

  # ===========================================================================
  # GAMING UTILITIES
  # ===========================================================================
  environment.systemPackages = with pkgs; [
    steam-run    # Run non-Nix binaries in a Steam-like FHS environment
    mangohud     # FPS, CPU, and GPU temperature overlay
    protonup-qt  # GUI for managing Proton versions (if not using declarative above)
  ];

  # --- Performance & Optimization ---
  programs.gamemode.enable = true;
}
