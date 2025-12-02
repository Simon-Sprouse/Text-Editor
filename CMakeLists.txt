cmake_minimum_required(VERSION 3.21)
project(text_editor)
set(CMAKE_CXX_STANDARD 17)

# -------------------------------------------------------------------
# Qt6 static build
# -------------------------------------------------------------------
set(Qt6_DIR "$ENV{HOME}/qt-static/lib/cmake/Qt6")
if (NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release CACHE STRING "Build Type" FORCE)
endif()
find_package(Qt6 COMPONENTS Widgets REQUIRED)

# -------------------------------------------------------------------
# Skia (vendored inside project)
# -------------------------------------------------------------------
set(SKIA_ROOT "${CMAKE_SOURCE_DIR}/third_party/skia")

# Skia needs both include/ and modules/
include_directories(
    ${SKIA_ROOT}/include
    ${SKIA_ROOT}/modules
)

# All Skia static libs copied by the vendor script.
file(GLOB SKIA_LIBS "${SKIA_ROOT}/lib/*.a")
message(STATUS "Found Skia libs:")
foreach(lib ${SKIA_LIBS})
    message(STATUS "  ${lib}")
endforeach()

# -------------------------------------------------------------------
# Application
# -------------------------------------------------------------------
add_executable(text_editor
    main.cpp
)

# CRITICAL: Point to SKIA_ROOT (not SKIA_ROOT/include)
# This allows includes like "include/core/SkCanvas.h" and "modules/skcms/skcms.h"
target_include_directories(text_editor PRIVATE 
    ${SKIA_ROOT}
)

target_link_libraries(text_editor
    PRIVATE
        Qt6::Widgets
        ${SKIA_LIBS}
)

# macOS frameworks needed for Skia + Qt static builds
if(APPLE)
    target_link_libraries(text_editor PRIVATE
        "-framework CoreFoundation"
        "-framework CoreGraphics"
        "-framework CoreText"
        "-framework CoreServices"
        "-framework QuartzCore"
        "-framework Metal"
        "-framework MetalKit"
        "-framework AppKit"
    )
endif()

# -------------------------------------------------------------------
# RPATH fix for macOS static Qt builds
# -------------------------------------------------------------------
set_target_properties(text_editor PROPERTIES
    BUILD_WITH_INSTALL_RPATH TRUE
    INSTALL_RPATH "@loader_path"
)