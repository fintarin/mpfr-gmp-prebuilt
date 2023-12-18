if(WIN32)
  set(GMP_DIR ${CMAKE_CURRENT_LIST_DIR}/x64-windows)
  set(GMP_INCLUDE_DIR ${GMP_DIR}/include)
  set(GMP_LIBRARY ${GMP_DIR}/lib/gmp.lib)
elseif(ANDROID)
  set(GMP_DIR ${CMAKE_CURRENT_LIST_DIR}/${CMAKE_ANDROID_ARCH_ABI}-android)
  set(GMP_INCLUDE_DIR ${GMP_DIR}/include)
  set(GMP_LIBRARY ${GMP_DIR}/lib/libgmp.a)
else()
  find_path(
    GMP_INCLUDE_DIR
    NAMES gmp.h
    PATHS ENV
          GMP_ROOT
          ENV
          GMP_INCLUDE_DIR
          ${GMP_ROOT}
          /usr
          /usr/local
          $ENV{HOME}/.local
    PATH_SUFFIXES include)

  find_library(
    GMP_LIBRARY
    NAMES gmp
    PATHS ENV
          GMP_ROOT
          ENV
          GMP_LIB_DIR
          ${GMP_ROOT}
          /usr
          /usr/local
    PATH_SUFFIXES lib)
endif()

add_library(GMP UNKNOWN IMPORTED)
set_target_properties(GMP PROPERTIES IMPORTED_LOCATION ${GMP_LIBRARY} INTERFACE_INCLUDE_DIRECTORIES ${GMP_INCLUDE_DIR})

mark_as_advanced(GMP_DIR GMP_INCLUDE_DIR GMP_LIBRARY)
