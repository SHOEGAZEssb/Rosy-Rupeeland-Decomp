#include "tingle/types.h"

/*
 * Overlay 4 variant-controller construction. This recovered constructor
 * initializes its shared presentation base, resolves variant-adjacent data,
 * allocates an overlay-26 helper, and selects initial coordinates.
 */

typedef struct Overlay004VariantController {
    const void *vtable_000;
    u8 field_004[0x1c];
    u32 field_020_0_9 : 10;
    s32 applyDisplayMode_020_10 : 1;
    u32 field_020_11_31 : 21;
    u8 field_024[0x30];
    void *helper_054;
    s32 variant_058;
    void *previousResource_05c;
    void *currentResource_060;
} Overlay004VariantController;

#ifdef __cplusplus
extern "C" {
#endif
extern void *gHeapContext;
extern const u8 data_ov004_021fcdbc[];
extern const u8 data_ov004_021fcddc[];
extern const s32 data_ov004_021fcd48[2];
extern void SceneInputBase_Init(void *state);
extern void *GamePhaseProgress_GetOrCreateGlobal(void);
extern void *func_02027828(void *context, s32 index);
extern void *Heap_Alloc(s32 size, const void *tag, s32 alignment,
                        void *heapContext);
extern void *func_ov026_021ff8a0(void *memory, s32 variant,
                                void *previousResource,
                                void *currentResource);
extern void func_ov004_021fb6e4(void *state, s32 first, s32 second);
#ifdef __cplusplus
}
#endif

/*
 * Initialize state through SceneInputBase_Init, install the vtable at
 * data_ov004_021fcdbc, clamp variant to a minimum of one, and retain it at
 * +0x58. Variants 1..10 resolve indices variant-1 and variant through the
 * shared GamePhaseProgress_GetOrCreateGlobal context; values above 10 use null for both resources.
 * Allocate 0x7C4 bytes tagged by data_ov004_021fcddc with alignment 4 and, on
 * success, construct an overlay-26 helper in that memory. Store the resulting
 * helper (or null) at +0x54, set the signed display-update flag at +0x20 bit
 * 10, apply the coordinate pair at data_ov004_021fcd48, and return state.
 * Allocation and resource ownership remain with their respective callees; no
 * direct hardware access occurs here.
 */
#ifdef __cplusplus
extern "C"
#endif
Overlay004VariantController *
func_ov004_021fc944(Overlay004VariantController *state, s32 variant)
{
    void *memory;

    SceneInputBase_Init(state);
    if (variant < 1) {
        variant = 1;
    }
    state->vtable_000 = data_ov004_021fcdbc;
    state->variant_058 = variant;

    if (variant > 10) {
        state->previousResource_05c = 0;
        state->currentResource_060 = 0;
    } else {
        state->previousResource_05c =
            func_02027828(GamePhaseProgress_GetOrCreateGlobal(), variant - 1);
        state->currentResource_060 =
            func_02027828(GamePhaseProgress_GetOrCreateGlobal(), variant);
    }

    memory = Heap_Alloc(0x7c4, data_ov004_021fcddc, 4, gHeapContext);
    if (memory != 0) {
        memory = func_ov026_021ff8a0(memory, variant,
                                    state->previousResource_05c,
                                    state->currentResource_060);
    }
    state->helper_054 = memory;
    state->applyDisplayMode_020_10 = 1;
    func_ov004_021fb6e4(state, data_ov004_021fcd48[0],
                        data_ov004_021fcd48[1]);
    return state;
}
