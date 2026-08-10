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
 * selector 1. Temporary states are copied through DisplayBrightness_Copy; the pair
 * address is returned and no hardware is changed.
 */
DisplayBrightnessPair *DisplayBrightnessPair_Init(DisplayBrightnessPair *pair)
{
    DisplayBrightness mainTemporary;
    DisplayBrightness subTemporary;

    DisplayBrightness_Init(&mainTemporary, 0);
    DisplayBrightness_Copy(&pair->screens[0], &mainTemporary);
    DisplayBrightness_Init(&subTemporary, 1);
    DisplayBrightness_Copy(&pair->screens[1], &subTemporary);
    return pair;
}

/*
 * Trivial destructor hook for a brightness pair. It accepts the registered
 * global object, changes no state, performs no SDK work, and returns nothing.
 */
void DisplayBrightnessPair_Destroy(DisplayBrightnessPair *pair)
{
    (void)pair;
}

/*
 * Return the main state when screen is zero, otherwise the sub state. This
 * performs no validation or mutation; every nonzero selector chooses sub.
 */
DisplayBrightness *DisplayBrightnessPair_GetScreen(DisplayBrightnessPair *pair, u32 screen)
{
    if (screen != 0)
        return &pair->screens[1];
    return &pair->screens[0];
}

/* Advance both global transitions and apply their visible hardware values. */
void DisplayBrightness_UpdateAll(void)
{
    DisplayBrightness_Update(MAIN_BRIGHTNESS);
    DisplayBrightness_Update(SUB_BRIGHTNESS);
}

/* Start the main-screen transition; observable effects are confined to its state. */
void DisplayBrightness_StartMainTransition(s32 direction, fx32 transitionDivisor)
{
    DisplayBrightness_StartBoundTransition(MAIN_BRIGHTNESS, direction, transitionDivisor);
}

/* Start the sub-screen transition; observable effects are confined to its state. */
void DisplayBrightness_StartSubTransition(s32 direction, fx32 transitionDivisor)
{
    DisplayBrightness_StartBoundTransition(SUB_BRIGHTNESS, direction, transitionDivisor);
}

/* Return TRUE exactly when the main-screen transition direction is idle. */
s32 DisplayBrightness_IsMainTransitionComplete(void)
{
    return data_020f4dbc.pair.screens[0].direction == 0;
}

/* Return TRUE exactly when the sub-screen transition direction is idle. */
s32 DisplayBrightness_IsSubTransitionComplete(void)
{
    return data_020f4dbc.pair.screens[1].direction == 0;
}

/* Return TRUE when the sub-screen packed transition mode is positive one. */
s32 DisplayBrightness_IsSubTransitionIncreasing(void)
{
    return data_020f4dbc.pair.screens[1].mode == 1;
}

/* Return TRUE when the main-screen packed transition mode is negative one. */
s32 DisplayBrightness_IsMainTransitionDecreasing(void)
{
    return data_020f4dbc.pair.screens[0].mode == -1;
}

/* Return TRUE when the sub-screen packed transition mode is negative one. */
s32 DisplayBrightness_IsSubTransitionDecreasing(void)
{
    return data_020f4dbc.pair.screens[1].mode == -1;
}

/* Return the unclassified display offset retained at SystemState offset 0x5e. */
u8 DisplayController_GetVerticalOffset(void)
{
    return gSystemState.unknown5E;
}

/* Return the retained display offset translated by the DS screen height, 192. */
u32 DisplayController_GetSubScreenVerticalOffset(void)
{
    return gSystemState.unknown5E + 192;
}

/* Store a new eight-bit display offset at SystemState offset 0x5e. */
void DisplayController_SetVerticalOffset(u8 value)
{
    gSystemState.unknown5E = value;
}
