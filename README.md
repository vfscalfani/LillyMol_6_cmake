# LillyMol_6_cmake

## Vin Scalfani Notes on aarch64 Build

> **Caution**
> It's not fully clear to me if we should expect any changes in results for x86 vs. aarch64 builds.
> The population count calculation in this branch uses the builtin gcc `__builtin_popcountll`, whereas the
> original code uses the x86 specific `_mm_popcnt_u64`. I don't have any experience here, so
> any feedback or comments are welcome. I see that newer versions of LillyMol have some tests and data available, but I 
> have not explored any tests between x86 and aarch64 yet.

The original LillyMol_6_cmake version (main branch) builds for me without issue on x86 based
Ubuntu systems (Ubuntu 22.04.3 LTS). I think I used gcc v11.4.0 and cmake v3.22.1 for that. 
I also installed libre2-dev from the repositories.

The purpose of this branch is to get a succesful build of LillyMol 6 using cmake on
an aarch64 based system. In my case, a Raspberry Pi 400 with 4 GB RAM.
I installed cmake and libre2-dev from the Debian repositories.

Details of Raspberry Pi System for Testing:

```
Distributor ID:	Debian
Description:	Debian GNU/Linux 11 (bullseye)
Release:	11
Codename:	bullseye

gcc (Debian 10.2.1-6) 10.2.1 20210110
cmake version 3.18.4
libre2-dev version 20210201+dfsg-1

```
The first attempt at building was unsuccesful. The build was failing on the
`src/foundational/iwbits/fixed_bit_vector.cc` file. There was a fatal error of
"nmmintrin.h: No such file or directory". Some investigation suggests this is used
for SSE4 instructions, and more specifically, to compute the popcount of bits
with the `_mm_popcnt_u32` and `_mm_popcnt_u64` functions. These instructions do not appear
to be supported with aarch64 based CPUs.

Instead of using the SSE4 based functions, there is a builtin GCC extension
(`__builtin_popcountll`) which can be used on aarch64.
See: https://stackoverflow.com/questions/38113284/whats-the-difference-between-builtin-popcountll-and-mm-popcnt-u64

So, I went ahead and changed the popcount calculation to use `__builtin_popcountll`. Here are the specific changes I made:

`src/foundational/iwbits/fixed_bit_vector.cc` file:

```cpp
int
FixedBitVector::nset() const {
  int rc = 0;
  for (int i = 0; i < _nwords; ++i) {
    // rc +=  _mm_popcnt_u64(_bits[i]);
    rc +=  __builtin_popcountll(_bits[i]); // changed for aarch64 build
  }
  return rc;
}

```

```cpp
static inline int
popcount_2fp(const unsigned* bufA,const unsigned* bufB,const int nwords)
{
    int count = 0;
    assert(nwords % 8 == 0);

/*     
#if defined(__x86_64__)
    int nquads = nwords/2;
    const uint64_t* a64 = (uint64_t*)bufA;
    const uint64_t* b64 = (uint64_t*)bufB;
    for (int i = 0; i < nquads; i += 4) {
        count +=  _mm_popcnt_u64(a64[i]&b64[i])     + _mm_popcnt_u64(a64[i+1]&b64[i+1])
                + _mm_popcnt_u64(a64[i+2]&b64[i+2]) + _mm_popcnt_u64(a64[i+3]&b64[i+3]);
    }

*/

// changing for aarch64 build
#if defined(__aarch64__)
    int nquads = nwords/2;
    const uint64_t* a64 = (const uint64_t *)bufA;
    const uint64_t* b64 = (const uint64_t *)bufB;    
    for (int i = 0; i < nquads; i += 4) {
        count += __builtin_popcountll(a64[i]&b64[i])
              + __builtin_popcountll(a64[i+1]&b64[i+1])
              + __builtin_popcountll(a64[i+2]&b64[i+2])
              + __builtin_popcountll(a64[i+3]&b64[i+3]);
    }
```

This above code was also added to the `src/Utilities/GFP_Tools/gfp_standard.cc` file.

```cpp
int
FixedBitVector::BitsInCommon(const FixedBitVector& rhs) const {
  // 32 64-bit words, multiply by 2 for popcount_2fp.
  if (_nwords == 32) {
    return popcount_2fp((const unsigned*) _bits, (const unsigned*)rhs._bits, _nwords * 2);
  }

  int rc = 0;
  for (int i = 0; i < _nwords; ++i) {
    // rc +=  _mm_popcnt_u64(_bits[i] & rhs._bits[i]);
    rc +=  __builtin_popcountll(_bits[i] & rhs._bits[i]); // changed for aarch64 build
  }
  return rc;
}

```

Lastly, in the `src/Utilities/GFP_Tools/gfp_standard.cc` file:

```cpp
static inline int
popcount(const unsigned char * b, const int nwords)
{
  const int nquads = nwords / 2;
  int count = 0;

  const uint64_t * b64 = reinterpret_cast<const uint64_t *>(b);

  for (int i = 0; i < nquads; i += 4)
  {
    // count += _mm_popcnt_u64(b64[i]) + _mm_popcnt_u64(b64[i+1]) + _mm_popcnt_u64(b64[i+2]) + _mm_popcnt_u64(b64[i+3]);
    // changed for aarch64 build
    count += __builtin_popcountll(b64[i]) + __builtin_popcountll(b64[i+1]) + __builtin_popcountll(b64[i+2]) + __builtin_popcountll(b64[i+3]);
  }

  return count;
}

```

Now, Lillymol 6 cmake builds on aarch64 (e.g., Raspberry Pi) without build errors. This takes about 12 minutes:

```
cd src
mkdir build
cd build
cmake ..
make -j 3

```




## Original Notes from Ian A Watson Below This

---

Fork of the official LillyMol, but builds on Ubuntu systems with cmake.

The official LillyMol has a horrible build process. I have been working on
a new version that will use either Bazel, and hopefully cmake, to do the build.
But when that gets released is uncertain.

In the meantime I have done minor code cleanup on LillyMol6 and changed the
build to use cmake.

## Prerequisites

### gcc

On my Ubuntu 20.04 system, the installed gcc compiler is 9.4.0 and
the build works. Earlier and later versions might also work.

### cmake

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

### re2

The old regular expression handling in LillyMol6 was horrible, and has been
replaced by Google's [re2](https://github.com/google/re2). This is a fast and
convenient to use regular expression matcher. On Debian-like systems like Ubuntu
you must have `libre2-dev` installed.

If you are unable to install software on the system, there are options.

1. Install `re2` in your local area and configure CMakeLists.txt to use
   that local install - perhaps by just adjusting cxx flags, or pointing to
   the cloned repo.
1. Use the `ExternalProject_Add` functionality within `cmake`. The `re2` repo
   is configured for use with `cmake`.

Beware that if you download, configure, install and test re2, it might consume
several hunred MB of disk space. Even without tests, it may consume over 100MB.
Removing the source tree after installation may be advisable.

### zlib

When the old LillyMol was built, there were incompatible versions of zlib in
use and it caused considerable problems. On up to date Ubuntu systems this
should be installed by default.

### Eigen (optional)

There are some executables that are not built by default that depend on
`eigen`, and so if you have that installed you could build `tshadow` which
is an interesting 3D tool.

### f2c (optional)

There is a 3D reaction capability that depends on some matrix functionality
implemented in an old Fortran function, that we have been using via f2c.
As distributed, this functionality is suppressed, so you should not need
libf2c in order to build.

## Building

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

## Documentation

As part of a longer term effort to document LillyMol, please see the [docs](docs)
directory. More documentation will be added to this soon.
