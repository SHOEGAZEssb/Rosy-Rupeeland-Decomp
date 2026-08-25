#include "tingle/types.h"

/* Overlay 16 alternate selectable-list interaction state machine. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u32 data_ov016_02201480[];

#ifdef __cplusplus
extern "C" {
#endif
extern void SceneSound_PlayPackedEffect(void *, s32);
extern void SceneSound_StopPackedEffect(void *, s32);
extern void InventoryScroll_SaveOrigins(void *);
extern s32 InventoryScroll_UpdateInterpolation(void *);
extern void InventoryScroll_BeginMarkerDrag(void *, s32);
extern s32 InventoryScroll_UpdateMarkerDrag(void *, void *);
extern void InventoryScroll_EndMarkerDrag(void *, s32);
extern s32 func_ov016_021fd640(void *);
extern void Overlay016ActorValue_Init(void *, u32, u32);
extern void Overlay016_UpdateScene(void *);
extern void Overlay016_UpdateCursorPosition(void *);
extern void Overlay016_SyncSelectedPanel(void *);
#ifdef __cplusplus
}
#endif

/*
 * Run the alternate list handler using substate +4. State 0 starts presentation
 * mode 4 and falls through. State 1 waits for opening; if the presentation's
 * +0x0C and +0x10 indices differ it synchronizes the panel and sends action 8,
 * then advances and falls through. While waiting it only refreshes cursor motion.
 * State 2 updates input: when scene flag bit 4 is set, accepted input backs up
 * one state with action 8; otherwise it closes using presentation mode 6 and
 * transitions through data_ov016_02201480. Update all scene components every
 * call and return zero. UI/action/transition state changes; no direct MMIO.
 */
extern "C" s32 Overlay016_UpdateAlternateListState(void *state)
{
    void *list = FIELD(void *, state, 0x444);
    void *presentation = FIELD(void *, list, 0x58);

    switch (FIELD(s32, state, 4)) {
    case 0:
        InventoryScroll_BeginMarkerDrag(presentation, 4);
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        /* Deliberate fall-through while the opening sequence begins. */
    case 1:
        if (InventoryScroll_UpdateInterpolation(presentation) != 0) {
            if (FIELD(s32, presentation, 0xc) !=
                FIELD(s32, presentation, 0x10)) {
                Overlay016_SyncSelectedPanel(state);
                SceneSound_StopPackedEffect(state, 8);
            }
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        } else {
            if (func_ov016_021fd640(list) != 0) {
                Overlay016_UpdateCursorPosition(state);
            }
            break;
        }
        /* Completed opening continues directly into input state 2. */
    case 2:
        InventoryScroll_SaveOrigins(presentation);
        if ((FIELD(u32, state, 0x20) & 0x10) != 0) {
            if (InventoryScroll_UpdateMarkerDrag(presentation, (u8 *)state + 0x30) != 0) {
                SceneSound_PlayPackedEffect(state, 8);
                FIELD(s32, state, 4)--;
                FIELD(s32, state, 8) = 0;
            }
        } else {
            InventoryScroll_EndMarkerDrag(presentation, 6);
            Overlay016ActorValue_Init(state, data_ov016_02201480[0],
                                data_ov016_02201480[1]);
        }
        break;
    }
    Overlay016_UpdateScene(state);
    return 0;
}
