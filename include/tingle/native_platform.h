#ifndef TINGLE_NATIVE_PLATFORM_H
#define TINGLE_NATIVE_PLATFORM_H

#include "tingle/types.h"

enum {
    TINGLE_SCREEN_WIDTH = 256,
    TINGLE_SCREEN_HEIGHT = 192,
    TINGLE_SCREEN_COUNT = 2,
    TINGLE_FRAMEBUFFER_HEIGHT = TINGLE_SCREEN_HEIGHT * TINGLE_SCREEN_COUNT,
    TINGLE_KEY_A = 1u << 0,
    TINGLE_KEY_B = 1u << 1,
    TINGLE_KEY_SELECT = 1u << 2,
    TINGLE_KEY_START = 1u << 3,
    TINGLE_KEY_RIGHT = 1u << 4,
    TINGLE_KEY_LEFT = 1u << 5,
    TINGLE_KEY_UP = 1u << 6,
    TINGLE_KEY_DOWN = 1u << 7,
    TINGLE_KEY_R = 1u << 8,
    TINGLE_KEY_L = 1u << 9
};

typedef struct TingleNativeHostInput {
    u16 keys;
    s32 touch_x;
    s32 touch_y;
    u8 touching;
} TingleNativeHostInput;

typedef struct TingleNativePlatform TingleNativePlatform;

/* Creates the host window and timing/input state; returns null on failure. */
TingleNativePlatform *TingleNativePlatform_Create(void);

/* Releases every resource owned by the host platform object. */
void TingleNativePlatform_Destroy(TingleNativePlatform *platform);

/* Pumps host events and returns zero once the application should terminate. */
s32 TingleNativePlatform_Poll(TingleNativePlatform *platform,
                              TingleNativeHostInput *input);

/* Waits until the next 60 Hz frame boundary without exposing host clock units. */
void TingleNativePlatform_WaitFrame(TingleNativePlatform *platform);

/* Presents two vertically stacked 256x192 XRGB8888 framebuffers. */
void TingleNativePlatform_Present(TingleNativePlatform *platform, const u32 *pixels);

#endif
