#include "tingle/types.h"

/* Overlay 28 secondary controller-return interaction state. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s32 data_ov028_021ff240[];

#ifdef __cplusplus
extern "C" {
#endif
extern void SceneSound_PlayPackedEffect(void *, s32);
extern void SceneSound_StopPackedEffect(void *, s32);
extern void InventoryScroll_SaveOrigins(void *);
extern s32 InventoryScroll_UpdateInterpolation(void *);
extern void InventoryScroll_BeginMarkerDrag(void *, s32);
extern s32 InventoryScroll_UpdateMarkerDrag(void *, const void *);
extern void InventoryScroll_EndMarkerDrag(void *, s32);
extern s32 func_ov028_021fd5e0(void *);
extern void func_ov028_021fdad8(void *, s32, s32);
extern void func_ov028_021fe438(void *);
extern void func_ov028_021fe6bc(void *);
#ifdef __cplusplus
}
#endif

/*
 * Runs a three-phase return state on list controller +0x220/+0x44. Phase 0
 * starts controller action 4; phase 1 waits for completion, optionally requests
 * scene transition 8 when first/target indices +0x0C/+0x10 differ, or updates
 * the cursor at the scroll midpoint. Phase 2 either accepts a gated touch at
 * +0x30 (event 8 and back to phase 1) or requests controller action 6 and
 * installs callback pair 0x021FF240. The common graphics update always runs;
 * returns zero and may change scene, audio, input, controller, and UI state.
 */
extern "C" s32 func_ov028_021fea98(void *state)
{
    void *list = FIELD(void *, state, 0x220);
    void *controller = FIELD(void *, list, 0x44);
    s32 phase = FIELD(s32, state, 4);
    if (phase == 0) {
        InventoryScroll_BeginMarkerDrag(controller, 4);
        FIELD(s32, state, 4) = 1;
        FIELD(s32, state, 8) = 0;
        phase = 1;
    }
    if (phase == 1) {
        if (InventoryScroll_UpdateInterpolation(controller) != 0) {
            if (FIELD(s32, controller, 0xc) != FIELD(s32, controller, 0x10))
                SceneSound_StopPackedEffect(state, 8);
            FIELD(s32, state, 4) = 2;
            FIELD(s32, state, 8) = 0;
            phase = 2;
        } else {
            if (func_ov028_021fd5e0(list) != 0)
                func_ov028_021fe6bc(state);
            func_ov028_021fe438(state);
            return 0;
        }
    }
    if (phase == 2) {
        if (FIELD(u32, state, 0x20) & 0x10) {
            InventoryScroll_SaveOrigins(controller);
            if (InventoryScroll_UpdateMarkerDrag(controller, (u8 *)state + 0x30) != 0) {
                SceneSound_PlayPackedEffect(state, 8);
                FIELD(s32, state, 4)--;
                FIELD(s32, state, 8) = 0;
            }
        } else {
            InventoryScroll_EndMarkerDrag(controller, 6);
            func_ov028_021fdad8(state,
                                data_ov028_021ff240[0],
                                data_ov028_021ff240[1]);
        }
    }
    func_ov028_021fe438(state);
    return 0;
}
