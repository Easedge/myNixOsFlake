{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" "sdhci_pci" ];
  # boot.kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_stable;
  boot.kernelParams = [ "intel_iommu=on" "iommu=pt" ];
  boot.kernelPatches = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = with config.boot.kernelPackages; [ ];
  boot.extraModprobeConfig = "options kvm_intel nested=1";

  fileSystems."/" =
    {
      device = "/dev/disk/by-label/NIX";
      fsType = "btrfs";
    };

  fileSystems."/boot/efi" =
    {
      device = "/dev/disk/by-label/BOOT";
      fsType = "vfat";
    };

  # swapDevices =
  #   [{ device = "/dev/disk/by-label/SWAP"; }];

  zramSwap.enable = true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.opengl.enable = true;
  hardware.steam-hardware.enable = true;
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
