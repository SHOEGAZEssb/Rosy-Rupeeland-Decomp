/*
 * Windows native-platform backend.
 *
 * This maps a small DS-compatible input snapshot onto Win32 keyboard/mouse
 * events, presents stacked 256x192 software framebuffers, and supplies a
 * monotonic 60 Hz frame boundary without leaking Win32 types to game code.
 */
#include "tingle/native_platform.h"
#include "tingle/native_input.h"

#include <windows.h>
#include <shellapi.h>
#include <stdlib.h>
#include <string.h>

struct TingleNativePlatform {
    HWND window;
    LARGE_INTEGER frequency;
    LARGE_INTEGER next_frame;
    u16 held;
    TingleNativeButtonState buttons;
    HDC framebuffer_dc;
    HBITMAP framebuffer_bitmap;
    HGDIOBJ previous_framebuffer_bitmap;
    void *framebuffer_bits;
};

static const wchar_t sWindowClass[] = L"TingleNativeWindow";

static void DrawFramebuffer(TingleNativePlatform *platform, HDC dc)
{
    RECT client;

    if (platform->framebuffer_dc == NULL) return;
    GetClientRect(platform->window, &client);
    SetStretchBltMode(dc, COLORONCOLOR);
    StretchBlt(dc, 0, 0, client.right - client.left, client.bottom - client.top,
               platform->framebuffer_dc, 0, 0,
               TINGLE_SCREEN_WIDTH, TINGLE_FRAMEBUFFER_HEIGHT, SRCCOPY);
}

static u16 KeyMask(WPARAM key)
{
    switch (key) {
    case 'Z': return TINGLE_KEY_A;
    case 'X': return TINGLE_KEY_B;
    case VK_BACK: return TINGLE_KEY_SELECT;
    case VK_RETURN: return TINGLE_KEY_START;
    case VK_RIGHT: return TINGLE_KEY_RIGHT;
    case VK_LEFT: return TINGLE_KEY_LEFT;
    case VK_UP: return TINGLE_KEY_UP;
    case VK_DOWN: return TINGLE_KEY_DOWN;
    case 'W': return TINGLE_KEY_R;
    case 'Q': return TINGLE_KEY_L;
    default: return 0;
    }
}

static LRESULT CALLBACK WindowProcedure(HWND window, UINT message, WPARAM wparam, LPARAM lparam)
{
    TingleNativePlatform *platform = (TingleNativePlatform *)GetWindowLongPtrW(window, GWLP_USERDATA);

    switch (message) {
    case WM_NCCREATE:
        platform = (TingleNativePlatform *)((CREATESTRUCTW *)lparam)->lpCreateParams;
        SetWindowLongPtrW(window, GWLP_USERDATA, (LONG_PTR)platform);
        platform->window = window;
        return DefWindowProcW(window, message, wparam, lparam);
    case WM_KEYDOWN:
    case WM_SYSKEYDOWN:
        if (platform != NULL) platform->held |= KeyMask(wparam);
        return 0;
    case WM_KEYUP:
    case WM_SYSKEYUP:
        if (platform != NULL) platform->held &= (u16)~KeyMask(wparam);
        return 0;
    case WM_KILLFOCUS:
        if (platform != NULL) platform->held = 0;
        return 0;
    case WM_PAINT:
        if (platform != NULL) {
            PAINTSTRUCT paint;
            HDC dc = BeginPaint(window, &paint);
            DrawFramebuffer(platform, dc);
            EndPaint(window, &paint);
        }
        return 0;
    case WM_ERASEBKGND:
        return 1;
    case WM_DESTROY:
        PostQuitMessage(0);
        return 0;
    default:
        return DefWindowProcW(window, message, wparam, lparam);
    }
}

TingleNativePlatform *TingleNativePlatform_Create(void)
{
    TingleNativePlatform *platform = (TingleNativePlatform *)calloc(1, sizeof(*platform));
    WNDCLASSW window_class = {0};
    BITMAPINFO bitmap_info = {0};
    RECT rect = {0, 0, TINGLE_SCREEN_WIDTH * 2, TINGLE_FRAMEBUFFER_HEIGHT * 2};
    HINSTANCE instance = GetModuleHandleW(NULL);

    if (platform == NULL || !QueryPerformanceFrequency(&platform->frequency)) {
        free(platform);
        return NULL;
    }

    window_class.lpfnWndProc = WindowProcedure;
    window_class.hInstance = instance;
    window_class.lpszClassName = sWindowClass;
    window_class.hCursor = LoadCursorW(NULL, IDC_ARROW);
    if (!RegisterClassW(&window_class) && GetLastError() != ERROR_CLASS_ALREADY_EXISTS) {
        free(platform);
        return NULL;
    }

    AdjustWindowRect(&rect, WS_OVERLAPPEDWINDOW, FALSE);
    platform->window = CreateWindowExW(0, sWindowClass, L"Tingle Native",
        WS_OVERLAPPEDWINDOW, CW_USEDEFAULT, CW_USEDEFAULT,
        rect.right - rect.left, rect.bottom - rect.top, NULL, NULL, instance, platform);
    if (platform->window == NULL) {
        free(platform);
        return NULL;
    }

    bitmap_info.bmiHeader.biSize = sizeof(bitmap_info.bmiHeader);
    bitmap_info.bmiHeader.biWidth = TINGLE_SCREEN_WIDTH;
    bitmap_info.bmiHeader.biHeight = -TINGLE_FRAMEBUFFER_HEIGHT;
    bitmap_info.bmiHeader.biPlanes = 1;
    bitmap_info.bmiHeader.biBitCount = 32;
    bitmap_info.bmiHeader.biCompression = BI_RGB;
    platform->framebuffer_dc = CreateCompatibleDC(NULL);
    platform->framebuffer_bitmap = CreateDIBSection(platform->framebuffer_dc,
        &bitmap_info, DIB_RGB_COLORS, &platform->framebuffer_bits, NULL, 0);
    if (platform->framebuffer_dc == NULL || platform->framebuffer_bitmap == NULL ||
        platform->framebuffer_bits == NULL) {
        TingleNativePlatform_Destroy(platform);
        return NULL;
    }
    platform->previous_framebuffer_bitmap =
        SelectObject(platform->framebuffer_dc, platform->framebuffer_bitmap);

    QueryPerformanceCounter(&platform->next_frame);
    ShowWindow(platform->window, SW_SHOWDEFAULT);
    return platform;
}

void TingleNativePlatform_Destroy(TingleNativePlatform *platform)
{
    if (platform == NULL) return;
    if (platform->window != NULL && IsWindow(platform->window)) DestroyWindow(platform->window);
    if (platform->framebuffer_dc != NULL && platform->previous_framebuffer_bitmap != NULL)
        SelectObject(platform->framebuffer_dc, platform->previous_framebuffer_bitmap);
    if (platform->framebuffer_bitmap != NULL) DeleteObject(platform->framebuffer_bitmap);
    if (platform->framebuffer_dc != NULL) DeleteDC(platform->framebuffer_dc);
    free(platform);
}

s32 TingleNativePlatform_Poll(TingleNativePlatform *platform, TingleNativeInput *input)
{
    MSG message;
    POINT cursor;
    RECT client;

    while (PeekMessageW(&message, NULL, 0, 0, PM_REMOVE)) {
        if (message.message == WM_QUIT) return 0;
        TranslateMessage(&message);
        DispatchMessageW(&message);
    }

    TingleNativeInput_UpdateButtons(&platform->buttons, platform->held, input);
    GetCursorPos(&cursor);
    ScreenToClient(platform->window, &cursor);
    GetClientRect(platform->window, &client);
    input->touch_x = client.right > 0 ? cursor.x * TINGLE_SCREEN_WIDTH / client.right : 0;
    input->touch_y = client.bottom > 0 ? cursor.y * TINGLE_FRAMEBUFFER_HEIGHT / client.bottom - TINGLE_SCREEN_HEIGHT : 0;
    input->touching = (u8)((GetKeyState(VK_LBUTTON) & 0x8000) != 0 &&
                           input->touch_x >= 0 && input->touch_x < TINGLE_SCREEN_WIDTH &&
                           input->touch_y >= 0 && input->touch_y < TINGLE_SCREEN_HEIGHT);
    return 1;
}

void TingleNativePlatform_WaitFrame(TingleNativePlatform *platform)
{
    LARGE_INTEGER now;
    LONGLONG frame_ticks = platform->frequency.QuadPart / 60;

    platform->next_frame.QuadPart += frame_ticks;
    QueryPerformanceCounter(&now);
    while (now.QuadPart < platform->next_frame.QuadPart) {
        LONGLONG remaining = platform->next_frame.QuadPart - now.QuadPart;
        DWORD milliseconds = (DWORD)(remaining * 1000 / platform->frequency.QuadPart);
        if (milliseconds > 1) Sleep(milliseconds - 1);
        QueryPerformanceCounter(&now);
    }
    if (now.QuadPart - platform->next_frame.QuadPart > frame_ticks * 4) {
        platform->next_frame = now;
    }
}

void TingleNativePlatform_Present(TingleNativePlatform *platform, const u32 *pixels)
{
    memcpy(platform->framebuffer_bits, pixels,
           sizeof(*pixels) * TINGLE_SCREEN_WIDTH * TINGLE_FRAMEBUFFER_HEIGHT);
    InvalidateRect(platform->window, NULL, FALSE);
    UpdateWindow(platform->window);
}

extern int TingleNative_Run(int argc, char **argv);

int WINAPI wWinMain(HINSTANCE instance, HINSTANCE previous, PWSTR command_line, int show_command)
{
    wchar_t **wide_argv;
    char **argv;
    int argc;
    int i;
    int result = EXIT_FAILURE;
    (void)instance;
    (void)previous;
    (void)command_line;
    (void)show_command;
    wide_argv = CommandLineToArgvW(GetCommandLineW(), &argc);
    if (wide_argv == NULL) return EXIT_FAILURE;
    argv = (char **)calloc((size_t)argc, sizeof(*argv));
    if (argv != NULL) {
        for (i = 0; i < argc; ++i) {
            int size = WideCharToMultiByte(CP_UTF8, 0, wide_argv[i], -1, NULL, 0, NULL, NULL);
            if (size <= 0) break;
            argv[i] = (char *)malloc((size_t)size);
            if (argv[i] == NULL ||
                WideCharToMultiByte(CP_UTF8, 0, wide_argv[i], -1, argv[i], size, NULL, NULL) == 0) break;
        }
        if (i == argc) result = TingleNative_Run(argc, argv);
        for (i = 0; i < argc; ++i) free(argv[i]);
        free(argv);
    }
    LocalFree(wide_argv);
    return result;
}
