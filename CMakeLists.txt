cmake_minimum_required(VERSION 3.20)

project(tingle_native LANGUAGES C)

if(NOT WIN32)
    message(FATAL_ERROR "The first native backend currently supports Windows only")
endif()

add_executable(tingle_native WIN32
    src/native/main.c
    src/native/native_debug_menu.c
    src/native/native_data.c
    src/native/native_input.c
    src/native/native_phase_selector.c
    src/native/native_render.c
    src/native/platform_win32.c
)

target_include_directories(tingle_native PRIVATE include)
target_compile_features(tingle_native PRIVATE c_std_11)
target_compile_definitions(tingle_native PRIVATE UNICODE _UNICODE WIN32_LEAN_AND_MEAN)
target_link_libraries(tingle_native PRIVATE shell32)

if(MSVC)
    target_compile_definitions(tingle_native PRIVATE _CRT_SECURE_NO_WARNINGS)
    target_compile_options(tingle_native PRIVATE /W4 /WX)
else()
    target_compile_options(tingle_native PRIVATE -Wall -Wextra -Werror)
endif()

include(CTest)
if(BUILD_TESTING)
    add_executable(native_data_test
        tests/native_data_test.c
        src/native/native_data.c
    )
    target_include_directories(native_data_test PRIVATE include)
    target_compile_features(native_data_test PRIVATE c_std_11)
    target_compile_definitions(native_data_test PRIVATE
        TINGLE_TEST_SOURCE_DIR="${CMAKE_SOURCE_DIR}"
    )
    if(MSVC)
        target_compile_definitions(native_data_test PRIVATE _CRT_SECURE_NO_WARNINGS)
        target_compile_options(native_data_test PRIVATE /W4 /WX)
    else()
        target_compile_options(native_data_test PRIVATE -Wall -Wextra -Werror)
    endif()
    add_test(NAME native_data_test COMMAND native_data_test)

    add_executable(native_debug_menu_test
        tests/native_debug_menu_test.c
        src/native/native_debug_menu.c
        src/native/native_render.c
    )
    target_include_directories(native_debug_menu_test PRIVATE include)
    target_compile_features(native_debug_menu_test PRIVATE c_std_11)
    if(MSVC)
        target_compile_definitions(native_debug_menu_test PRIVATE _CRT_SECURE_NO_WARNINGS)
        target_compile_options(native_debug_menu_test PRIVATE /W4 /WX)
    else()
        target_compile_options(native_debug_menu_test PRIVATE -Wall -Wextra -Werror)
    endif()
    add_test(NAME native_debug_menu_test COMMAND native_debug_menu_test)

    add_executable(native_input_test
        tests/native_input_test.c
        src/native/native_input.c
    )
    target_include_directories(native_input_test PRIVATE include)
    target_compile_features(native_input_test PRIVATE c_std_11)
    if(MSVC)
        target_compile_options(native_input_test PRIVATE /W4 /WX)
    else()
        target_compile_options(native_input_test PRIVATE -Wall -Wextra -Werror)
    endif()
    add_test(NAME native_input_test COMMAND native_input_test)

    add_executable(native_phase_selector_test
        tests/native_phase_selector_test.c
        src/native/native_phase_selector.c
        src/native/native_render.c
    )
    target_include_directories(native_phase_selector_test PRIVATE include)
    target_compile_features(native_phase_selector_test PRIVATE c_std_11)
    if(MSVC)
        target_compile_definitions(native_phase_selector_test PRIVATE _CRT_SECURE_NO_WARNINGS)
        target_compile_options(native_phase_selector_test PRIVATE /W4 /WX)
    else()
        target_compile_options(native_phase_selector_test PRIVATE -Wall -Wextra -Werror)
    endif()
    add_test(NAME native_phase_selector_test COMMAND native_phase_selector_test)
endif()
