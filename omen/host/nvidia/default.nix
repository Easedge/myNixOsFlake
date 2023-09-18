{ lib, config, pkgs, ... }:
{
  imports = [
    ./off-load.nix
    # ./disable.nix
    # ./open.nix
  ];

  services.xserver.videoDrivers = lib.mkDefault [ "nvidia" ];
  hardware.opengl.extraPackages = with pkgs; [
    vaapiVdpau
  ];
  hardware.nvidia.powerManagement.enable = true;
  hardware.nvidia.nvidiaSettings = true;

  services.xserver.config = ''
    # Integrated Intel GPU
    Section "Device"
      Identifier "iGPU"
      Driver "modesetting"
    EndSection

    # Dedicated NVIDIA GPU
    Section "Device"
      Identifier "dGPU"
      Driver "nvidia"
    EndSection

    Section "ServerLayout"
      Identifier "layout"
      Screen 0 "iGPU"
    EndSection

    Section "Screen"
      Identifier "iGPU"
      Device "iGPU"
    EndSection
  '';
}
