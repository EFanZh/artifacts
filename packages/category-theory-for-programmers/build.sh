#!/bin/sh -e

target_path=$(realpath "$1")

mkdir -p "$target_path"

cd "$(dirname "$0")/source"

SOURCE_DATE_EPOCH=$(git show -s --format='%at')

export FORCE_SOURCE_DATE=1 SOURCE_DATE_EPOCH

nix build \
    --extra-experimental-features flakes \
    --extra-experimental-features nix-command \
    '.#ctfp'

cp 'result/ctfp.pdf' "$target_path/Category Theory for Programmers.pdf"
