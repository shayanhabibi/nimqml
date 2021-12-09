# NimQML

QML binding for the Nim programming language

## Requirements
* [DOtherside](https://github.com/filcuc/DOtherSide) 0.8.X
* [Nim](http://nim-lang.org/) 1.2.0 or higher

## Build instructions
* Compile and Install [DOtherside](https://github.com/filcuc/DOtherSide) in your system PATH (i.e. /usr/lib)
* ```nimble install nimqml```

### Building DOtherSide - Windows 64bit - MinGW

```
cd /cloned/Dotherside
mkdir build
cd build
cmake -G "MinGW Makefiles" ..
cmake --build .
```

**WARNING**: the built dll is prefixed with lib which is not what nimqml tries
to load; nimqml tries to load "DOtherSide.dll" so you will need to remove the
lib prefix.

### Frequent issues:

#### Too many sections/object too large

Anything along those lines requires extra flags passed to the compiler. Try
this instead:

```
cmake -G "MinGW Makefiles" -DCMAKE_CXX_FLAGS="-Wa,-mbig-obj" ..
```

#### Mutex does not have a type

If getting an error like this in the build process, it is likely the gcc was not
built with posix_threading (and instead win32 threading which will not work).

Try the following to check this:

```
gcc -v
```

expected:

```
PS C:\Users\PC> gcc -v
Using built-in specs.
COLLECT_LTO_WRAPPER=C:/Qt/Tools/mingw810_64/bin/../libexec/gcc/x86_64-w64-mingw32/8.1.0/lto-wrapper.exe
Target: x86_64-w64-mingw32
Configured with: ../../../src/gcc-8.1.0/configure --host=x86_64-w64-mingw32 --build=x86_64-w64-mingw32 --target=x86_64-w64-mingw32 --prefix=/mingw64 --with-sysroot=/c/mingw810/x86_64-810-posix-seh-rt_v6-rev0/mingw64 --enable-shared --enable-static --disable-multilib --enable-languages=c,c++,fortran,lto --enable-libstdcxx-time=yes --enable-threads=posix --enable-libgomp --enable-libatomic --enable-lto --enable-graphite --enable-checking=release --enable-fully-dynamic-string --enable-version-specific-runtime-libs --disable-libstdcxx-pch --disable-libstdcxx-debug --enable-bootstrap --disable-rpath --disable-win32-registry --disable-nls --disable-werror --disable-symvers --with-gnu-as --with-gnu-ld --with-arch=nocona --with-tune=core2 --with-libiconv --with-system-zlib --with-gmp=/c/mingw810/prerequisites/x86_64-w64-mingw32-static --with-mpfr=/c/mingw810/prerequisites/x86_64-w64-mingw32-static --with-mpc=/c/mingw810/prerequisites/x86_64-w64-mingw32-s86_64-810-posix-seh-rt_v6-rev0/mingw64/opt/include -I/c/mingw810/prerequisites/x86_64-zlib-static/include -I/c/mingw810/prerequisites/x86_64-w64-mingw32-static/include' CXXFLAGS='-O2 -pipe -fno-ident -I/c/mingw810/x86_64-810-posix-seh-rt_v6-rev0/mingw64/opt/include -I/c/mingw810/prerequisites/x86_64-zlib-static/include -I/c/mingw810/prerequisites/x86_64-w64-mingw32-static/include' CPPFLAGS=' -I/c/mingw810/x86_64-810-posix-seh-rt_v6-rev0/mingw64/opt/include -I/c/mingw810/prerequisites/x86_64-zlib-static/include -I/c/mingw810/prerequisites/x86_64-w64-mingw32-static/include' LDFLAGS='-pipe -fno-ident -L/c/mingw810/x86_64-810-posix-seh-rt_v6-rev0/mingw64/opt/lib -L/c/mingw810/prerequisites/x86_64-zlib-static/lib -L/c/mingw810/prerequisites/x86_64-w64-mingw32-static/lib '
Thread model: posix
```

Nim toolchain or whatever other toolchain you are using might be windows thread model.

Qt toolchain in my case had posix thread model included so I just use their gcc for this purpose.

## Examples
The examples can be built by executing the following command
```
nimble build
```

## Documentation
The project documentation can be read [here](http://filcuc.github.io/nimqml/)
