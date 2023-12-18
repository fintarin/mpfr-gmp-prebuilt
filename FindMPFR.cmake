find_package(GMP REQUIRED)

if(WIN32)
  set(MPFR_DIR ${CMAKE_CURRENT_LIST_DIR}/x64-windows)
  set(MPFR_INCLUDE_DIR ${MPFR_DIR}/include)
  set(MPFR_LIBRARY ${MPFR_DIR}/lib/mpfr.lib)
elseif(ANDROID)
  set(MPFR_DIR ${CMAKE_CURRENT_LIST_DIR}/${CMAKE_ANDROID_ARCH_ABI}-android)
  set(MPFR_INCLUDE_DIR ${MPFR_DIR}/include)
  set(MPFR_LIBRARY ${MPFR_DIR}/lib/libmpfr.a)
else()
  find_path(
    MPFR_INCLUDE_DIR
    NAMES mpfr.h
    PATHS ENV
          MPFR_ROOT
          ENV
          MPFR_INCLUDE_DIR
          ${MPFR_ROOT}
          /usr
          /usr/local
          $ENV{HOME}/.local
    PATH_SUFFIXES include)

  find_library(
    MPFR_LIBRARY
    NAMES mpfr
    PATHS ENV
          MPFR_ROOT
          ENV
          MPFR_LIB_DIR
          ${MPFR_ROOT}
          /usr
          /usr/local
    PATH_SUFFIXES lib)
endif()

add_library(MPFR UNKNOWN IMPORTED)
set_target_properties(MPFR PROPERTIES IMPORTED_LOCATION ${MPFR_LIBRARY} INTERFACE_INCLUDE_DIRECTORIES ${MPFR_INCLUDE_DIR})
target_link_libraries(MPFR INTERFACE GMP)

mark_as_advanced(MPFR_DIR MPFR_INCLUDE_DIR MPFR_LIBRARY)

