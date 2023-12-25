# gha-oldqemu
A reproducible build of an old qemu version (0.11) on a modern linux system. Reference being gha runners, currently Ubuntu 22.04.3 LTS/jammy. Its previous incarnation died together with Travis CI.

Build artifact at https://dugoh.github.io/gha-oldqemu/

The artifact is nothing more than a tarred up qemu source directory after the build. Fish out the binaries and bios you need or extract the tarball and run `make install`.

I don't do workflow, branches, commit messages here and have no qualms using main as a scratch pad. Hic Sunt Leones, here be dragons, buyer beware and all that. Worst case script.sh just provides you hints.
