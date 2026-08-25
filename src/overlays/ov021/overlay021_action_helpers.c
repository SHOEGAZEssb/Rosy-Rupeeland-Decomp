#include "tingle/types.h"

/* Overlay 21 descriptor predicates and selection-action transition helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u32 data_ov021_02202f00[];
extern const u32 data_ov021_02202f08[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 RecordDescriptor_IsDiscovered(const void *);
extern void SceneSound_PlayPackedEffect(void *, s32);
extern void DisplayBrightness_StartMaskedTransitions(s32, s32);
extern void TitleDialog_ClearTextRect(void *);
extern u32 Overlay021_Descriptor_GetCategory(const void *);
extern void Overlay021_SetTransition(void *, u32, u32);
extern void *Overlay021_List_GetSelectedRow(void *);
extern void Overlay021_UpdateScene(void *);
#ifdef __cplusplus
}
#endif

/*
 * Return one when descriptor->record(+4) flags +0x0C contain bit 29,
 * otherwise zero. Inputs are read only; no SDK or hardware effects occur.
 */
extern "C" s32 Overlay021_Descriptor_HasFlag29(const void *descriptor)
{
    const u8 *record = FIELD(const u8 *, descriptor, 4);
    return (FIELD(u32, record, 0xc) & 0x20000000U) != 0;
}

/*
 * Refresh every active scene component through 0x021FEEA4 and return one.
 * UI/resource state may change through that update; no direct MMIO here.
 */
extern "C" s32 Overlay021_UpdateAndComplete(void *state)
{
    Overlay021_UpdateScene(state);
    return 1;
}

/*
 * Begin an action for the active list selection. Reset dialog +0x388, emit
 * action 2, cache the selected row descriptor at +0x2BC, and inspect its
 * category. Category one with nested halfword +4 at least two sets +0x3E0,
 * records predicate 0x0207C518 at +0x3DC, and transitions through
 * data_ov021_02202F08. Other selections emit SDK action (1,-16) and transition
 * through data_ov021_02202F00. Dialog/action/transition state changes; no MMIO.
 */
extern "C" void Overlay021_BeginSelectedAction(void *state)
{
    TitleDialog_ClearTextRect(FIELD(void *, state, 0x388));
    SceneSound_PlayPackedEffect(state, 2);
    void *row = Overlay021_List_GetSelectedRow(FIELD(void *, state, 0x2c0));
    const void *descriptor = FIELD(const void *, row, 0);
    FIELD(const void *, state, 0x2bc) = descriptor;
    const u8 *record = FIELD(const u8 *, descriptor, 4);
    if (Overlay021_Descriptor_GetCategory(descriptor) == 1 &&
        FIELD(u16, record, 4) >= 2) {
        FIELD(s32, state, 0x3e0) = 1;
        FIELD(s32, state, 0x3dc) = RecordDescriptor_IsDiscovered(descriptor) != 0;
        Overlay021_SetTransition(state, data_ov021_02202f08[0],
                            data_ov021_02202f08[1]);
    } else {
        DisplayBrightness_StartMaskedTransitions(1, -16);
        Overlay021_SetTransition(state, data_ov021_02202f00[0],
                            data_ov021_02202f00[1]);
    }
}
