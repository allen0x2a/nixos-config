# ai.nix
# services do not autostart

{ config, pkgs, lib, ... }:

{
  # Ollama - local LLM backend
  # Start: sudo systemctl start ollama
  services.ollama = {
    enable = true;
    acceleration = "cuda";
  };
  systemd.services.ollama.wantedBy = lib.mkForce [];

  # Open WebUI - browser interface for Ollama (http://localhost:8080)
  # Start: sudo systemctl start open-webui
  services.open-webui = {
    enable = true;
    port = 8080;
    environment = {
      OLLAMA_API_BASE_URL = "http://127.0.0.1:11434";
    };
  };
  systemd.services.open-webui.wantedBy = lib.mkForce [];
}
