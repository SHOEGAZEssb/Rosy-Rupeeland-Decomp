#include "tingle/types.h"

/* Overlay 16 fade-synchronized transition into its alternate presentation mode. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u32 data_ov016_022014b0[];
extern const u32 data_ov016_022014b8[];
extern void *data_020f4e14;
extern void *gGameWork;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 GameWork_TestFlag(void *, u32);
extern void GameWork_ClearFlag(void *, u32);
extern s32 DisplayBrightness_IsMainTransitionComplete(void);
extern void func_020755bc(void *);
extern void func_02092c8c(s32, s32);
extern s32 func_02095dd4(void *, void *, s32);
extern void func_ov000_021fc9d4(void *);
extern void func_ov016_021fe754(void *, u32, u32);
extern void func_ov016_021ff17c(void *);
extern void func_ov016_021ff4ec(void *);
extern void func_ov016_021ff510(void *);
extern void func_ov016_021ff7bc(void *);
extern void func_ov016_021ff908(void *, s32, s32, void *);
extern void func_ov016_021ff9b8(void *);
extern void func_ov016_021ffc2c(void *);
#ifdef __cplusplus
}
#endif

/*
 * Run the fade-synchronized mode switch in substate +4. State 0 begins a fade
 * toward -16 and falls through. State 1 waits for completion, tears down the
 * original scene sprites, refreshes the main font, constructs alternate auxiliary
 * objects/resources, refreshes selection UI, and initializes the auxiliary list.
 * Game-work flag 0x3A7 either skips to state 10 or is cleared before opening
 * message (2,1,null) and advancing; then a fade toward zero begins. State 2 waits
 * for that fade, state 3 waits for/closes the message and transitions via pair
 * 0x2214B8, while state 10 transitions via 0x2214B0 after fade completion.
 * Update all scene components and return zero. Game-work, UI, and fade state
 * change; no direct MMIO occurs in this handler.
 */
extern "C" s32 func_ov016_022005c8(void *state)
{
    switch (FIELD(s32, state, 4)) {
    case 0:
        func_02092c8c(1, -0x10);
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        /* Deliberate fall-through while the first fade is running. */
    case 1:
        if (DisplayBrightness_IsMainTransitionComplete() != 0) {
            func_ov016_021ff4ec(state);
            func_020755bc(data_020f4e14);
            func_ov016_021ff510(state);
            func_ov016_021ff17c(state);
            func_ov016_021ffc2c(state);
            func_ov000_021fc9d4(FIELD(void *, state, 0x44c));
            if (GameWork_TestFlag(gGameWork, 0x3a7) == 0) {
                FIELD(s32, state, 4) = 10;
            } else {
                GameWork_ClearFlag(gGameWork, 0x3a7);
                func_ov016_021ff908(state, 2, 1, 0);
                FIELD(s32, state, 4)++;
            }
            FIELD(s32, state, 8) = 0;
            func_02092c8c(1, 0);
        }
        break;
    case 2:
        if (DisplayBrightness_IsMainTransitionComplete() != 0) {
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 3:
        if (func_02095dd4(FIELD(void *, state, 0x460),
                          (u8 *)state + 0x30,
                          (FIELD(u32, state, 0x20) & 0x20) != 0 ? -1 : 0) >= 0) {
            func_ov016_021ff9b8(state);
            func_ov016_021fe754(state, data_ov016_022014b8[0],
                                data_ov016_022014b8[1]);
        }
        break;
    case 10:
        if (DisplayBrightness_IsMainTransitionComplete() != 0) {
            func_ov016_021fe754(state, data_ov016_022014b0[0],
                                data_ov016_022014b0[1]);
        }
        break;
    }
    func_ov016_021ff7bc(state);
    return 0;
}
