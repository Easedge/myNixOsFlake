{ pkgs, ... }:

{
  virtualisation = {

    libvirtd = {
      enable = true;
      qemu.ovmf.enable = true;
      qemu.ovmf.packages = [ (pkgs.OVMF.override { csmSupport = false; }).fd ];
      qemu.swtpm.enable = true;
      qemu.runAsRoot = true;
      qemu.package = pkgs.qemu_kvm;
      qemu.verbatimConfig = ''
        nvram = [ "${pkgs.OVMF}/FV/OVMF.fd:${pkgs.OVMF}/FV/OVMF_VARS.fd" ]
      '';
      onBoot = "ignore";
      onShutdown = "shutdown";
    };

    spiceUSBRedirection.enable = true;

    oci-containers.backend = "podman";

    podman = {
      enable = true;
      autoPrune.enable = false;
      autoPrune.flags = [ ];
      autoPrune.dates = "";
      defaultNetwork.settings = { };
      networkSocket = {
        enable = false; 
        openFirewall = false;
      };
      extraPackages = [ ];
      enableNvidia = false;
      dockerSocket.enable = false;
      dockerCompat = false;
    };

    # docker = {
    #   enable = true;
    #   storageDriver = "btrfs";
    # };

    # cri-o = {
    #   enable = true;
    #   logLevel = "info";
    #   runtime = "crun";
    #   storageDriver = "btrfs";
    #   extraPackages= [
    #     pkgs.gvisor
    #     pkgs.cni
    #     pkgs.cni-plugins
    #   ];
    # };

    # virtualbox = {
    #   host.enable = true;
    #   host.enableExtensionPack = true;
    # };

  };

  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    virtiofsd
    libguestfs
    guestfs-tools
    swtpm
    skopeo
    buildah
    podman-desktop
    podman-compose
    # docker-compose
    distrobox
  ];
}
