# My Flake

## install
```sh
$ sudo nixos-install --root /mnt --no-root-password --flake .#omen
```

## use
```sh
$ sudo nixos-rebuild switch --flake .#omen
```