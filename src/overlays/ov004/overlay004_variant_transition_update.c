#include "tingle/types.h"

/*
 * Overlay 4 variant-transition update. This recovered six-phase state machine
 * transitions from the variant helper into the main presentation and later
 * closes that presentation through shared transition services.
 */

typedef struct Overlay004VariantTransitionState {
    const void *vtable_000;
    s32 phase_004;
    s32 timer_008;
    u8 field_00c[0x14];
    u32 flags_020;
    u8 field_024[0x30];
    void *helper_054;
    s32 variant_058;
    void *previousResource_05c;
    void *currentResource_060;
} Overlay004VariantTransitionState;

typedef void (*Overlay004VirtualDestroy)(void *object);

#ifdef __cplusplus
extern "C" {
#endif
extern void *gHeapContext;
extern const u8 data_ov004_021fcde4[];
extern const s32 data_ov004_021fcd28[2];
extern const s32 data_ov004_021fcd58[2];
extern s32 SceneInputBase_Update(void *object, s32 active);
extern void DisplayBrightness_StartMaskedTransitions(s32 channel, s32 value);
extern s32 DisplayBrightness_IsMainTransitionComplete(void);
extern void SceneSound_StopDirectSequence(void *state, s32 callbackId, s32 value);
extern void *Heap_Alloc(s32 size, const void *tag, s32 alignment,
                        void *heapContext);
extern void *Overlay004_Presentation_Init(void *memory, s32 variant,
                                void *currentResource);
extern void Overlay004_SetCoordinateState(void *state, s32 first, s32 second);
#ifdef __cplusplus
}
#endif

/* Advance phase_004 and reset the retained phase timer at +0x08. */
static void overlay004_advance_transition(Overlay004VariantTransitionState *state)
{
    state->phase_004++;
    state->timer_008 = 0;
}

/* Destroy helper_054 through its confirmed vtable slot at +0x08. */
static void overlay004_destroy_helper(void *helper)
{
    void *vtable = *(void **)helper;
    Overlay004VirtualDestroy destroy =
        *(Overlay004VirtualDestroy *)((u8 *)vtable + 0x08);

    destroy(helper);
}

/*
 * Execute one frame and return zero. Phase zero sets +0x20 bit 0, advances,
 * and immediately enters phase one. Phase one waits for helper_054 to accept
 * active=1, applies transition channel 3 with +16 for variants 1..10 or -16
 * otherwise, then advances. Phase two requests active=0 and waits for
 * DisplayBrightness_IsMainTransitionComplete. Out-of-range variants then install callback 0x3D/value 0x10
 * and the pair at data_ov004_021fcd28. Valid variants disable +0x20 bit 10,
 * destroy the existing helper, re-enable the bit, allocate 0x15C bytes tagged
 * by data_ov004_021fcde4, construct Overlay004_Presentation_Init with variant and +0x60,
 * store the result at +0x54, reset transition channel 3 to zero, and advance.
 * Phases three and four wait through inactive/active states, with phase four
 * applying -16. Phase five waits for inactive completion, installs the same
 * callback, and applies data_ov004_021fcd58. Allocation, ownership, and the
 * meaning of DisplayBrightness_IsMainTransitionComplete's global readiness result remain delegated/inferred;
 * all branch conditions and stored offsets are confirmed.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 Overlay004_UpdateVariantTransition(Overlay004VariantTransitionState *state)
{
    switch (state->phase_004) {
    case 0:
        state->flags_020 = (state->flags_020 & ~1) | 1;
        overlay004_advance_transition(state);
        /* The original intentionally processes phase one in the same frame. */
    case 1:
        if (SceneInputBase_Update(state->helper_054, 1)) {
            if (state->variant_058 < 1 || state->variant_058 > 10) {
                DisplayBrightness_StartMaskedTransitions(3, -16);
            } else {
                DisplayBrightness_StartMaskedTransitions(3, 16);
            }
            overlay004_advance_transition(state);
        }
        break;

    case 2:
        SceneInputBase_Update(state->helper_054, 0);
        if (!DisplayBrightness_IsMainTransitionComplete()) {
            break;
        }
        if (state->variant_058 < 1 || state->variant_058 > 10) {
            SceneSound_StopDirectSequence(state, 0x3d, 0x10);
            Overlay004_SetCoordinateState(state, data_ov004_021fcd28[0],
                                data_ov004_021fcd28[1]);
            break;
        }

        state->flags_020 &= ~0x400;
        if (state->helper_054 != 0) {
            overlay004_destroy_helper(state->helper_054);
        }
        state->helper_054 = 0;
        state->flags_020 |= 0x400;
        {
            void *memory =
                Heap_Alloc(0x15c, data_ov004_021fcde4, 4, gHeapContext);
            if (memory != 0) {
                memory = Overlay004_Presentation_Init(memory, state->variant_058,
                                             state->currentResource_060);
            }
            state->helper_054 = memory;
        }
        DisplayBrightness_StartMaskedTransitions(3, 0);
        overlay004_advance_transition(state);
        break;

    case 3:
        SceneInputBase_Update(state->helper_054, 0);
        if (DisplayBrightness_IsMainTransitionComplete()) {
            overlay004_advance_transition(state);
        }
        break;

    case 4:
        if (SceneInputBase_Update(state->helper_054, 1)) {
            DisplayBrightness_StartMaskedTransitions(3, -16);
            overlay004_advance_transition(state);
        }
        break;

    case 5:
        SceneInputBase_Update(state->helper_054, 0);
        if (DisplayBrightness_IsMainTransitionComplete()) {
            SceneSound_StopDirectSequence(state, 0x3d, 0x10);
            Overlay004_SetCoordinateState(state, data_ov004_021fcd58[0],
                                data_ov004_021fcd58[1]);
        }
        break;
    }
    return 0;
}
