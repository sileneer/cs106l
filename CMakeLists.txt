cmake_minimum_required(VERSION 3.10)
project(cs106l VERSION 1.0.0 LANGUAGES CXX)

# Set C++17 standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Export compile commands for IDEs
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Compiler flags for debugging and warnings
set(CMAKE_CXX_FLAGS_DEBUG "-g -O0 -Wall -Wextra -Wpedantic")
set(CMAKE_CXX_FLAGS_RELEASE "-O3 -DNDEBUG")

# Set default build type to Debug
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Debug)
endif()

# Create bin directory
file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# Set runtime output directory
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# Function to create executables from assignment files
function(add_assignment assignment_name source_file)
    add_executable(${assignment_name} ${source_file})
    target_compile_features(${assignment_name} PRIVATE cxx_std_17)
    set_target_properties(${assignment_name} PROPERTIES
        RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin
    )
endfunction()

# Add main executable
add_assignment(main assignments/main.cpp)

# Automatically find and add all assignment files
file(GLOB ASSIGNMENT_SOURCES "assignments/*.cpp")
foreach(source_file ${ASSIGNMENT_SOURCES})
    get_filename_component(assignment_name ${source_file} NAME_WE)
    if(NOT assignment_name STREQUAL "main")
        add_assignment(${assignment_name} ${source_file})
    endif()
endforeach()

# Add example executables
file(GLOB EXAMPLE_SOURCES "examples/*.cpp")
foreach(source_file ${EXAMPLE_SOURCES})
    get_filename_component(example_name ${source_file} NAME_WE)
    add_assignment(${example_name} ${source_file})
endforeach()

# Print build information
message(STATUS "Build type: ${CMAKE_BUILD_TYPE}")
message(STATUS "C++ Standard: ${CMAKE_CXX_STANDARD}")
message(STATUS "Compiler: ${CMAKE_CXX_COMPILER}")
message(STATUS "Compiler flags: ${CMAKE_CXX_FLAGS}")
message(STATUS "Runtime output directory: ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}")
