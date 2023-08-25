{ pkgs, ... }:

{
  # this is needed to get a bridge with DHCP enabled
  virtualisation = {

    libvirtd = {
      enable = true;
      qemu.ovmf.enable = true;
      qemu.swtpm.enable = true;
      qemu.runAsRoot = true;
      qemu.package = pkgs.qemu_kvm;
    };

    oci-containers.backend = "docker";

    # podman = {
    #   enable = true;
    #   dockerCompat = true;
    # };

    docker = {
      enable = true;
    };

    # virtualbox = {
    #   host.enable = true;
    #   host.enableExtensionPack = true;
    # };

  };


  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
  ];
}
