#!/bin/sh -e

target_path=$(realpath "$1")

mkdir -p "$target_path"

cd "$(dirname "$0")/source"

SOURCE_DATE_EPOCH=$(git show -s --format='%at')

export SOURCE_DATE_EPOCH

sed -i 's/\\def\\edition{1}/\\def\\edition{0}/' book.tex
make
mv 'book.pdf' "$target_path/Essentials of Compilation - Racket.pdf"

sed -i 's/\\def\\edition{0}/\\def\\edition{1}/' book.tex
make
mv 'book.pdf' "$target_path/Essentials of Compilation - Python.pdf"
