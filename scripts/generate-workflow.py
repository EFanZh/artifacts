#!/usr/bin/env python3

import os
from os import path


def job_id(package: str):
    return f'build-{package}'

def main():
    root_path = path.dirname(path.dirname(__file__))
    packages = os.listdir(path.join(root_path, "packages"))

    print("on: push\njobs:")

    for package in packages:
        print(f"    {job_id(package)}:")
        print("        runs-on: ubuntu-latest")
        print("        steps:")
        print("          - uses: actions/checkout@v4")
        print(f"          - run: git submodule update --init packages/{package}/source")
        print(f"          - run: packages/{package}/install-dependencies.sh")
        print(f"          - run: packages/{package}/build.sh target")
        print("          - uses: actions/upload-artifact@v3")
        print("            with:")
        print(f"                name: {package}")
        print(f"                path: target")

    print("    publish:")
    print("        runs-on: ubuntu-latest")
    print("        needs:")

    for package in packages:
        print(f"          - {job_id(package)}")

    print("        permissions:")
    print("            contents: write")
    print("        steps:")
    print("          - uses: actions/download-artifact@v3")
    print("            with:")
    print(f"                path: download")
    print("          - run: mkdir target && mv -t target download/*/*")
    print("          - uses: peaceiris/actions-gh-pages@v3")
    print("            with:")
    print("                github_token: ${{ secrets.GITHUB_TOKEN }}")
    print("                publish_branch: target")
    print("                publish_dir: target")
    print("                enable_jekyll: true")


if __name__ == "__main__":
    main()
