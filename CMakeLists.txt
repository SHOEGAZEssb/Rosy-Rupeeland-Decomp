cmake_minimum_required(VERSION 3.20)

project(tingle_native LANGUAGES C)

if(NOT WIN32)
    message(FATAL_ERROR "The first native backend currently supports Windows only")
endif()

add_executable(tingle_native WIN32
    src/native/main.c
    src/native/platform_win32.c
)

target_include_directories(tingle_native PRIVATE include)
target_compile_features(tingle_native PRIVATE c_std_11)
target_compile_definitions(tingle_native PRIVATE UNICODE _UNICODE WIN32_LEAN_AND_MEAN)

if(MSVC)
    target_compile_options(tingle_native PRIVATE /W4 /WX)
else()
    target_compile_options(tingle_native PRIVATE -Wall -Wextra -Werror)
endif()
