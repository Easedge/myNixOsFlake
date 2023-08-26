{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" "sdhci_pci" ];
  # boot.initrd.kernelModules = [ "vfio_pci" "vfio" "vfio_iommu_type1" "vfio_virqfd" ];
  # boot.kernelPackages = pkgs.stable.linuxKernel.packages.linux_zen;
  # boot.kernelParams = [ "intel_iommu=on" "iommu=pt" ];
  boot.kernelPatches = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  # boot.blacklistedKernelModules = [ "nvidia" "nouveau" ];
  boot.extraModulePackages = [ ];
  # boot.extraModprobeConfig = "options vfio-pci ids=10de:2520,10de:228e";

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

  swapDevices =
    [{ device = "/dev/disk/by-label/SWAP"; }];

  networking.useDHCP = lib.mkDefault true;
  networking.interfaces.eno1.useDHCP = lib.mkDefault true;
  networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.opengl.enable = true;
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
