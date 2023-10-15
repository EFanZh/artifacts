#!/bin/sh -e

curl -L 'https://nixos.org/nix/install' | sh

echo "/nix/var/nix/profiles/default/bin" >> "$GITHUB_PATH"
echo "$HOME/.nix-profile/bin" >> "$GITHUB_PATH"
