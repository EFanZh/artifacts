#!/bin/sh -e

target_path=$(realpath "$1")

mkdir -p "$target_path"

cd "$(dirname "$0")/source"

git_version=$(git show -s --format='%h')
SOURCE_DATE_EPOCH=$(git show -s --format='%at')

export FORCE_SOURCE_DATE=1 SOURCE_DATE_EPOCH

sed -i "s/dev/$git_version/" 'src/version.tex'
make ctfp

mv 'src/ctfp.pdf' "$target_path/Category Theory for Programmers.pdf"
