#include "tingle/display_controller.h"
#include "tingle/system.h"

/*
 * Global two-screen display-brightness controller and small display-coordinate
 * accessors. It constructs one brightness transition state per DS engine,
 * advances both each frame, exposes transition-status queries, and retains an
 * eight-bit display offset in SystemState field 0x5e.
 */

typedef struct GlobalDisplayBrightnessStorage {
    u8 destructorRecord[12];
    DisplayBrightnessPair pair;
    u8 unknown34[8];
} GlobalDisplayBrightnessStorage;

#ifndef MATCHING
GlobalDisplayBrightnessStorage data_020f4dbc;
#define MAIN_BRIGHTNESS (&data_020f4dbc.pair.screens[0])
#define SUB_BRIGHTNESS  (&data_020f4dbc.pair.screens[1])
#else
extern GlobalDisplayBrightnessStorage data_020f4dbc;
extern DisplayBrightness data_020f4dc8;
extern DisplayBrightness data_020f4ddc;
#define MAIN_BRIGHTNESS (&data_020f4dc8)
#define SUB_BRIGHTNESS  (&data_020f4ddc)
#endif

/*
 * Construct a caller-provided pair with main-screen selector 0 and sub-screen
 * selector 1. Temporary states are copied through func_02002930; the pair
 * address is returned and no hardware is changed.
 */
DisplayBrightnessPair *func_02002cdc(DisplayBrightnessPair *pair)
{
    DisplayBrightness mainTemporary;
    DisplayBrightness subTemporary;

    func_020028f0(&mainTemporary, 0);
    func_02002930(&pair->screens[0], &mainTemporary);
    func_020028f0(&subTemporary, 1);
    func_02002930(&pair->screens[1], &subTemporary);
    return pair;
}

/*
 * Trivial destructor hook for a brightness pair. It accepts the registered
 * global object, changes no state, performs no SDK work, and returns nothing.
 */
void func_02002d24(DisplayBrightnessPair *pair)
{
    (void)pair;
}

/*
 * Return the main state when screen is zero, otherwise the sub state. This
 * performs no validation or mutation; every nonzero selector chooses sub.
 */
DisplayBrightness *func_02002d28(DisplayBrightnessPair *pair, u32 screen)
{
    if (screen != 0)
        return &pair->screens[1];
    return &pair->screens[0];
}

/* Advance both global transitions and apply their visible hardware values. */
void func_02002d34(void)
{
    func_02002b3c(MAIN_BRIGHTNESS);
    func_02002b3c(SUB_BRIGHTNESS);
}

/* Start the main-screen transition; observable effects are confined to its state. */
void func_02002d54(s32 direction, fx32 transitionDivisor)
{
    func_02002a04(MAIN_BRIGHTNESS, direction, transitionDivisor);
}

/* Start the sub-screen transition; observable effects are confined to its state. */
void func_02002d74(s32 direction, fx32 transitionDivisor)
{
    func_02002a04(SUB_BRIGHTNESS, direction, transitionDivisor);
}

/* Return TRUE exactly when the main-screen transition direction is idle. */
s32 func_02002d94(void)
{
    return data_020f4dbc.pair.screens[0].direction == 0;
}

/* Return TRUE exactly when the sub-screen transition direction is idle. */
s32 func_02002db0(void)
{
    return data_020f4dbc.pair.screens[1].direction == 0;
}

/* Return TRUE when the sub-screen packed transition mode is positive one. */
s32 func_02002dcc(void)
{
    return data_020f4dbc.pair.screens[1].mode == 1;
}

/* Return TRUE when the main-screen packed transition mode is negative one. */
s32 func_02002df0(void)
{
    return data_020f4dbc.pair.screens[0].mode == -1;
}

/* Return TRUE when the sub-screen packed transition mode is negative one. */
s32 func_02002e14(void)
{
    return data_020f4dbc.pair.screens[1].mode == -1;
}

/* Return the unclassified display offset retained at SystemState offset 0x5e. */
u8 func_02002e38(void)
{
    return gSystemState.unknown5E;
}

/* Return the retained display offset translated by the DS screen height, 192. */
u32 func_02002e48(void)
{
    return gSystemState.unknown5E + 192;
}

/* Store a new eight-bit display offset at SystemState offset 0x5e. */
void func_02002e5c(u8 value)
{
    gSystemState.unknown5E = value;
}
