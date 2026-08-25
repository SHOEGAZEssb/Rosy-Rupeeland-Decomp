#include "tingle/types.h"

/*
 * Overlay 4 entry-phase update. This recovered helper performs one-time sound
 * and renderer activation, applies initial coordinates, and updates contexts.
 */

typedef struct Overlay004EntryPhaseState {
    u8 field_000[0x04];
    s32 phase_004;
    s32 field_008;
    u8 field_00c[0x144];
    s32 variant_150;
} Overlay004EntryPhaseState;

#ifdef __cplusplus
extern "C" {
#endif
extern void *gSoundContext;
extern void *data_020f4e14;
extern void *gDebugFont;
extern const s32 data_ov004_021fcd40[2];
extern void SceneSound_PlayDirectSequence(void *state, s32 value);
extern void Sound_SetDirectSequenceTrackMask(void *context, s32 channel, s32 value);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *context);
extern void Overlay004_SetCoordinateState(void *state, s32 first, s32 second);
extern void Overlay004_UpdateContext(void *state);
#ifdef __cplusplus
}
#endif

static s32 overlay004_entry_sound_value(s32 variant)
{
    switch (variant) {
    case 1: return 0x4400;
    case 2: return 0xc408;
    case 3: return 0xc448;
    case 4: return 0xc468;
    case 5: return 0xc668;
    case 6: return 0xc6e8;
    case 7: return 0xc6f8;
    case 8: return 0xc7f8;
    case 9: return 0xc7fa;
    default: return 0xc7fb;
    }
}

/*
 * When phase_004 is zero, call SceneSound_PlayDirectSequence(state,0xCC), submit the
 * variant-selected value above to sound channel 0xCC, activate data_020f4e14
 * and gDebugFont through GraphicsSpriteRenderer_ClearTextBuffer, advance phase to one, and clear +0x08.
 * In phase one (including the fallthrough from phase zero), apply the two-word
 * defaults at data_ov004_021fcd40 through Overlay004_SetCoordinateState. Always update
 * the two renderer contexts and return zero. Sound/renderer effects occur via
 * callees; unknown variant values share the confirmed default with 0 and 10.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 Overlay004_UpdateEntryPhase(Overlay004EntryPhaseState *state)
{
    if (state->phase_004 == 0) {
        SceneSound_PlayDirectSequence(state, 0xcc);
        Sound_SetDirectSequenceTrackMask(gSoundContext, 0xcc,
                      overlay004_entry_sound_value(state->variant_150));
        GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
        GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
        state->phase_004++;
        state->field_008 = 0;
    }
    if (state->phase_004 == 1) {
        Overlay004_SetCoordinateState(state, data_ov004_021fcd40[0],
                            data_ov004_021fcd40[1]);
    }
    Overlay004_UpdateContext(state);
    return 0;
}
