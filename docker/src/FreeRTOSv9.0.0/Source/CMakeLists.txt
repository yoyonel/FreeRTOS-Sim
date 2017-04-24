# Define library. Only source files here!
# project(libFreeRTOS VERSION 9.0.0 LANGUAGES C)
project(libFreeRTOS LANGUAGES C)

set(CMAKE_C_WARNS "         \
    -W                      \
    -Wall                   \
    -Werror                 \
    -Wextra                 \
    -Wformat                \
    -Wmissing-braces        \
    -Wno-cast-align         \
    -Wparentheses           \
    -Wshadow                \
    -Wno-sign-compare       \
    -Wswitch                \
    -Wuninitialized         \
    -Wunknown-pragmas       \
    -Wunused-function       \
    -Wunused-label          \
    -Wunused-parameter      \
    -Wunused-value          \
    -Wunused-variable       \
    -Wmissing-prototypes    \
    ")

set(CMAKE_C_CFLAGS   "              \
    -m32                            \
    -DDEBUG=1                       \
    -g                              \
    -UUSE_STDIO                     \
    -D__GCC_POSIX__=1               \
    -pthread                        \
    -DMAX_NUMBER_OF_TASKS=300 -O2")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CMAKE_C_CFLAGS} ${CMAKE_C_WARNS}")

# FreeRTOS Objects
set(SRCS_FREERTOS_OBJECTS
    croutine.c
    event_groups.c
    list.c
    queue.c
    tasks.c
    timers.c
)
    
set(SRCS_FREERTOS_PORTABLE_OBJECTS
    # portable Objects
    portable/MemMang/heap_3.c
    portable/GCC/POSIX/port.c
)

SET(FreeRTOS_INCLUDE_DIRS
    include 
    portable/GCC/POSIX
    )
include_directories(${FreeRTOS_INCLUDE_DIRS})

add_library(libFreeRTOS
    ${SRCS_FREERTOS_OBJECTS}
    ${SRCS_FREERTOS_PORTABLE_OBJECTS})

# Define headers for this library. PUBLIC headers are used for
# compiling the library, and will be added to consumers' build
# paths.
target_include_directories(libFreeRTOS PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include>
    # PRIVATE Source)
    )

# If we have compiler requirements for this library, list them
# here
# target_compile_features(lib
#     PUBLIC 
set_target_properties(libFreeRTOS PROPERTIES COMPILE_FLAGS ${CMAKE_C_FLAGS})

# Depend on a library that we defined in the top-level file
# target_link_libraries(lib
#     boost
#     MyOtherLibrary)

# 'make install' to the correct locations (provided by GNUInstallDirs).
MESSAGE(CMAKE_INSTALL_LIBDIR: ${CMAKE_INSTALL_LIBDIR})
if(NOT DEFINED CMAKE_INSTALL_LIBDIR)
    set(CMAKE_INSTALL_LIBDIR lib)
endif()
if(NOT DEFINED CMAKE_INSTALL_INCLUDEDIR)
    set(CMAKE_INSTALL_INCLUDEDIR include)
endif()
install(TARGETS libFreeRTOS EXPORT libFreeRTOSConfig
    ARCHIVE  DESTINATION ${CMAKE_INSTALL_LIBDIR}
    LIBRARY  DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME  DESTINATION ${CMAKE_INSTALL_BINDIR})  # This is for Windows
install(DIRECTORY include/ DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

# This makes the project importable from the install directory
# Put config file in per-project dir (name MUST match), can also
# just go into 'cmake'.
install(EXPORT libFreeRTOSConfig DESTINATION share/libFreeRTOS/cmake)

# This makes the project importable from the build directory
export(TARGETS libFreeRTOS FILE libFreeRTOSConfig.cmake)

# # Every library has unit tests, of course
# add_executable(testlib
#     test/testlib.cpp)

# target_link_libraries(testlib
#     lib)

# add_test(testlib testlib)