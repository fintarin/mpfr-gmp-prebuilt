# mpfr-gmp-prebuilt

Prebuilt versions of [MPFR 4.2.1](https://www.mpfr.org/) and [GMP 6.2.1](https://gmplib.org/) for Android (NDK 25) and Windows. The libraries were built using [vcpkg](https://vcpkg.io/).

There are also CMake files [FindMPFR](./FindMPFR.cmake) and [FindGMP](./FindGMP.cmake) to easily incorporate these libraries into your project. If the platform is not Android or Windows, the libraries will be searched on your system.

## Usage example

Add repository as a submodule to your project.

```sh
git submodule add https://github.com/fintarin/mpfr-gmp-prebuilt mpfr-gmp-prebuilt
```

Add the following lines to your CMakeLists.txt.

```cmake
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/mpfr-gmp-prebuilt)

find_package(MPFR REQUIRED)

add_executable(example example.cpp)
target_link_libraries(example MPFR)
```
