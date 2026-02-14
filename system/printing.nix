{ config, pkgs, ... }:

{
  services.printing.enable = true;

  hardware.printers = {
    ensurePrinters = [
      {
        name = "HP_M254DW";
        location = "Network";
        deviceUri = "ipp://x.x.x.x/ipp/print";
        model = "everywhere";
        description = "HP_M254DW";
      }
    ];
    # Sets the default printer for the system
    ensureDefaultPrinter = "HP_M254DW";
  };

}
