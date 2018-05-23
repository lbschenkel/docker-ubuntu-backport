Docker image and scripts to simplify backporting Ubuntu packages

Usage:

* `do.sh init` -- builds the Docker image
* `do.sh backport <pkg>` -- backports the given package, output will be stored in `deb/`
* `do.sh run` -- starts/enters the container (for manual command executions)

Note that the container needs to be built/run in privileged mode because the
tools `pbuilder` and `debootstrap` need to chroot, which is not possible in a
regular, non-privileged container. I was not able to make it work otherwise
(not even with `fakechroot`).
