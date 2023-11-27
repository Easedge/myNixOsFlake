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

    oci-containers.backend = "docker";

    # podman = {
    #   enable = true;
    #   dockerCompat = true;
    # };

    docker = {
      enable = true;
      storageDriver = "btrfs";
    };

    # virtualbox = {
    #   host.enable = true;
    #   host.enableExtensionPack = true;
    # };

  };

  # systemd.tmpfiles.rules = [
  #   "f /dev/shm/scream 0660 junglefish qemu-libvirtd -"
  #   "f /dev/shm/looking-glass 0660 junglefish qemu-libvirtd -"
  # ];

  # systemd.user.services.scream-ivshmem = {
  #   enable = true;
  #   description = "Scream IVSHMEM";
  #   serviceConfig = {
  #     ExecStart = "${pkgs.scream-receivers}/bin/scream-ivshmem-pulse /dev/shm/scream";
  #     Restart = "always";
  #   };
  #   wantedBy = [ "multi-user.target" ];
  #   requires = [ "pulseaudio.service" ];
  # };

  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    libguestfs
    guestfs-tools
    swtpm
    docker-compose
  ];
}
