cmake_minimum_required(VERSION 3.21)
project(text_editor)

set(CMAKE_CXX_STANDARD 17)

# point cmake to static qt installation
set(Qt6_DIR "$ENV{HOME}/qt-static/lib/cmake/Qt6")

# default build type
if (NOT CMAKE_BUILD_TYPE)
    set (CMAKE_BUILD_TYPE Release CACHE STRING "Build Type" FORCE)
endif()

find_package(Qt6 COMPONENTS Widgets REQUIRED)

add_executable(text_editor main.cpp)

target_link_libraries(text_editor PRIVATE Qt6::Widgets)