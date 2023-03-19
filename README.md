# LillyMol_6_cmake
Fork of the official LillyMol, but builds on Ubuntu systems with cmake.

The official LillyMol has a horrible build process. I have been working on
a new version that will use either Bazel, and hopefully cmake, to do the build.
But when that gets released is uncertain.

In the meantime I have done minor code cleanup on LillyMol6 and changed the
build to use cmake.

# Prerequisites

On my Ubuntu 20.04 system, the installed gcc compiler is 9.4.0 and
the build works. Earlier and later versions might also work.

Since this version used cmake, you must have cmake installed. On my
Ubuntu 20.04 version, this is version 3.16.3 and that is specified
as the minimum version in the top level CMakeLists.txt file. It is
quite possible this might work with earlier versions, I did not 
test this.

This version has been built on two Ubuntu systems only.

```
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=20.04
DISTRIB_CODENAME=focal
DISTRIB_DESCRIPTION="Ubuntu 20.04.5 LTS"
```
and
```
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=22.04
DISTRIB_CODENAME=jammy
DISTRIB_DESCRIPTION="Ubuntu 22.04.1 LTS"
```

The old regular expression handling in LillyMol6 was horrible, and has been
replaced by Google's [re2](https://github.com/google/re2). This is a fast and
convenient to use regular expression matcher. On Ubuntu systems you must have
`libre2_dev` installed.

When the old LillyMol was built, there were incompatible versions of zlib in
use and it caused considerable problems. On up to date Ubuntu systems this
should be installed by default.

There are some executables that are not built by default that depend on
`eigen`, and so if you have that installed you could build `tshadow` which
is an interesting 3D tool.

# Building

Go to the `src` directory and make a build subdirectory.

```
cd src
mkdir build
cd build
```

Then build the Makfiles
```
cmake ..
```

and then you should be ready to build.

```
make
```

which takes a couple of minutes on my system. Of course this can be faster if
you run make in parallel.
```
make -j 4
```

and if you run into problems with a particular executable, you might be able
to just tell make to ignore errors.
```
make -k
```
I would like to hear about problems, ianiwatson@gmail.com, my intent is that
this should build relatively easily..

# Documentation
As part of a longer term effort to document LillyMol, please see the [docs](docs)
directory. More documentation will be added to this soon.
