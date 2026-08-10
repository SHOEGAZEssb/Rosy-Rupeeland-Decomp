#include "tingle/types.h"

/* Overlay 32 multi-frame scene entry/exit transitions, sound ramps, and callback selection. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gSoundContext;
extern void *gGameWork;
extern const u8 data_ov032_02202220[];

#ifdef __cplusplus
extern "C" {
#endif
extern void DisplayBrightness_StartMainTransition(...);
extern void DisplayBrightness_StartSubTransition(...);
extern s32 DisplayBrightness_IsMainTransitionComplete(void);
extern s32 DisplayBrightness_IsSubTransitionComplete(void);
extern void func_ov032_021fd994(void *);
extern void func_ov032_021fde38(void *);
extern void func_020595d4(void *);
extern void func_0205958c(...);
extern void func_020595ec(void *);
extern void func_02058ffc(...);
extern void func_020594ec(...);
extern s32 GameWork_TestFlag(...);
extern s32 DisplayBrightness_GetCurrent(void *);
extern void DisplayBrightness_StartTransition(...);
#ifdef __cplusplus
}
#endif

static void install_state_callback(void *scene, u32 tableOffset, s32 nextState)
{
    FIELD(u32, scene, 0xb6c) = FIELD(u32, data_ov032_02202220, tableOffset);
    FIELD(u32, scene, 0xb70) = FIELD(u32, data_ov032_02202220, tableOffset + 4);
    FIELD(s32, scene, 0xb64) = nextState;
}

/*
 * Runs the three-phase scene-entry transition in +0xB64. Phase 0 starts paired
 * 16-frame fades; phase 1 waits for both engines, installs overlay graphics,
 * restores sound/display ownership and starts the complementary fade; phase 2
 * applies sound ramps and selects one of three address-derived state callbacks
 * using GameWork flags 0x15A and 0x3FC. It sets +0xF28 for flag 0x15A and always
 * returns zero because dispatch continues through the installed callback.
 */
extern "C" s32 func_ov032_021febec(void *scene)
{
    switch (FIELD(s32, scene, 0xb64)) {
    case 0:
        DisplayBrightness_StartMainTransition(2, 0x10);
        DisplayBrightness_StartSubTransition(2, 0x10);
        ++FIELD(s32, scene, 0xb64);
        break;
    case 1:
        if (DisplayBrightness_IsMainTransitionComplete() && DisplayBrightness_IsSubTransitionComplete()) {
            func_ov032_021fd994(scene);
            func_020595d4(gSoundContext);
            FIELD(s32, FIELD(void *, scene, 4), 0x20) = 1;
            FIELD(s32, FIELD(void *, scene, 0), 0x20) = 1;
            DisplayBrightness_StartSubTransition(1, 0x10);
            ++FIELD(s32, scene, 0xb64);
        }
        break;
    case 2:
        if (DisplayBrightness_IsSubTransitionComplete()) {
            func_02058ffc(gSoundContext, 1, 0, 0x1e);
            func_02058ffc(gSoundContext, 0, 0, 0x1e);
            func_020594ec(gSoundContext, 0x12);
            if (GameWork_TestFlag(gGameWork, 0x15a)) {
                FIELD(s32, scene, 0xf28) = 1;
                install_state_callback(scene, 0x30, 0);
            } else if (GameWork_TestFlag(gGameWork, 0x3fc)) {
                install_state_callback(scene, 0x28, 0x14);
            } else {
                install_state_callback(scene, 0x20, 0);
            }
        }
        break;
    }
    return 0;
}

/*
 * Runs the three-phase scene-exit transition in +0xB64. It fades either the
 * active handle at +0xBE0 or engine 2, starts the paired fade and sound stop,
 * waits before shutting down overlay graphics, then conditionally restores
 * engine 1 unless GameWork flag 0x3FB is set. Returns one only in final phase.
 */
extern "C" s32 func_ov032_021fed8c(void *scene)
{
    switch (FIELD(s32, scene, 0xb64)) {
    case 0:
        if (FIELD(s32, scene, 0xbc8)) {
            void *handle = FIELD(void *, scene, 0xbe0);
            DisplayBrightness_StartTransition(handle, DisplayBrightness_GetCurrent(handle), -0x10, 0x10);
        } else {
            DisplayBrightness_StartMainTransition(2, 0x10);
        }
        DisplayBrightness_StartSubTransition(2, 0x10);
        func_0205958c(gSoundContext, 0);
        ++FIELD(s32, scene, 0xb64);
        break;
    case 1:
        if (DisplayBrightness_IsMainTransitionComplete() && DisplayBrightness_IsSubTransitionComplete()) {
            func_ov032_021fde38(scene);
            ++FIELD(s32, scene, 0xb64);
        }
        break;
    case 2:
        if (!GameWork_TestFlag(gGameWork, 0x3fb)) {
            DisplayBrightness_StartMainTransition(1, 0x10);
            DisplayBrightness_StartSubTransition(1, 0x10);
        }
        func_020595ec(gSoundContext);
        return 1;
    }
    return 0;
}
