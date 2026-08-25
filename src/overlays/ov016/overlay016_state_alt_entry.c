#include "tingle/types.h"

/* Overlay 16 alternate-mode entry prompt and transition state handler. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u32 data_ov016_022014a0[];
extern const u32 data_ov016_022014a8[];
extern void *data_020f4e14;
extern void *gDebugFont;
extern void *gGameWork;

#ifdef __cplusplus
extern "C" {
#endif
extern void GameWork_ClearFlag(void *, u32);
extern s32 GameWork_TestFlag(void *, u32);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern s32 ModalState_UpdateInput(void *, void *, s32);
extern void Overlay000_SyncSelection(void *);
extern void Overlay016ActorValue_Init(void *, u32, u32);
extern void Overlay016_UpdateScene(void *);
extern void Overlay016_CreateTransientMessage(void *, s32, s32, void *);
extern void Overlay016_DestroyTransientMessage(void *);
extern void Overlay016_RefreshSelectionPresentation(void *);
#ifdef __cplusplus
}
#endif

/*
 * At substate 0, set scene +0x4C bit 1 and clear bit 2, refresh both fonts,
 * refresh selection UI and auxiliary list +0x44C, then branch on eligible count
 * +0x46C. With eligible entries, game-work flag 0x3A7 is cleared and message
 * (2,1,null) opens before state 1, or an absent flag transitions immediately
 * via pair 0x2214A8. With no eligible entries, flag 0x3A8 chooses message 0x1B
 * variant 0 versus message 0x1A variant 1, then advances. State 1 waits for the
 * message, closes it, and transitions via pair 0x2214A0. Update all scene
 * components and return zero. Persistent flags and UI/transition state change.
 */
extern "C" s32 Overlay016_UpdateAlternateEntryState(void *state)
{
    switch (FIELD(s32, state, 4)) {
    case 0:
        FIELD(u32, state, 0x4c) = (FIELD(u32, state, 0x4c) | 2u) & ~4u;
        GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
        GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
        Overlay016_RefreshSelectionPresentation(state);
        Overlay000_SyncSelection(FIELD(void *, state, 0x44c));
        if (FIELD(s32, state, 0x46c) != 0) {
            if (GameWork_TestFlag(gGameWork, 0x3a7) != 0) {
                GameWork_ClearFlag(gGameWork, 0x3a7);
                Overlay016_CreateTransientMessage(state, 2, 1, 0);
                FIELD(s32, state, 4)++;
                FIELD(s32, state, 8) = 0;
            } else {
                Overlay016ActorValue_Init(state, data_ov016_022014a8[0],
                                    data_ov016_022014a8[1]);
            }
        } else {
            if (GameWork_TestFlag(gGameWork, 0x3a8) != 0) {
                Overlay016_CreateTransientMessage(state, 0x1b, 0, 0);
            } else {
                Overlay016_CreateTransientMessage(state, 0x1a, 1, 0);
            }
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 1:
        if (ModalState_UpdateInput(FIELD(void *, state, 0x460),
                          (u8 *)state + 0x30,
                          (FIELD(u32, state, 0x20) & 0x20) != 0 ? -1 : 0) >= 0) {
            Overlay016_DestroyTransientMessage(state);
            Overlay016ActorValue_Init(state, data_ov016_022014a0[0],
                                data_ov016_022014a0[1]);
        }
        break;
    }
    Overlay016_UpdateScene(state);
    return 0;
}
