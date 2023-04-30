{
  description = "junglefish NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    emacs-overlay.url = "github:nix-community/emacs-overlay";
    hardware.url = "github:nixos/nixos-hardware";
    nur.url = "github:nix-community/NUR";
    nixos-cn = {
      url = "github:nixos-cn/flakes";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nur, nixos-cn, emacs-overlay, hardware, ... }@inputs:
  let 
    system = "x86_64-linux";
    forAllSystems = nixpkgs.lib.genAttrs [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
      ];
    pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        config.allowUnfreePredicate = (_: true);
        overlays = [
            inputs.nur.overlay
            inputs.emacs-overlay.overlay
            inputs.nixos-cn.overlay
        ];
    };
  in
  rec
  {
    packages = forAllSystems (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in import ./pkgs { inherit pkgs; }
    );
    devShells = forAllSystems (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in import ./shell.nix { inherit pkgs; }
    );

    nixosConfigurations."omen" = nixpkgs.lib.nixosSystem {
      inherit pkgs system;
      modules = [
        ./omen/configuration.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.junglefish = import ./omen/home.nix;
        }

        hardware.nixosModules.common-cpu-intel
        hardware.nixosModules.common-gpu-intel
        hardware.nixosModules.common-pc-laptop
        hardware.nixosModules.common-pc-ssd

        nixos-cn.nixosModules.nixos-cn
        nixos-cn.nixosModules.nixos-cn-registries
      ];
    };
  };
}
