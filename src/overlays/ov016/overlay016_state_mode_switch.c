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
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void DisplayBrightness_StartMaskedTransitions(s32, s32);
extern s32 ModalState_UpdateInput(void *, void *, s32);
extern void Overlay000_SyncSelection(void *);
extern void Overlay016ActorValue_Init(void *, u32, u32);
extern void Overlay016_SetupAlternateModeGraphics(void *);
extern void Overlay016_DestroySceneSprites(void *);
extern void Overlay016_PopulateAuxiliaryList(void *);
extern void Overlay016_UpdateScene(void *);
extern void Overlay016_CreateTransientMessage(void *, s32, s32, void *);
extern void Overlay016_DestroyTransientMessage(void *);
extern void Overlay016_RefreshSelectionPresentation(void *);
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
        DisplayBrightness_StartMaskedTransitions(1, -0x10);
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        /* Deliberate fall-through while the first fade is running. */
    case 1:
        if (DisplayBrightness_IsMainTransitionComplete() != 0) {
            Overlay016_DestroySceneSprites(state);
            GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
            Overlay016_PopulateAuxiliaryList(state);
            Overlay016_SetupAlternateModeGraphics(state);
            Overlay016_RefreshSelectionPresentation(state);
            Overlay000_SyncSelection(FIELD(void *, state, 0x44c));
            if (GameWork_TestFlag(gGameWork, 0x3a7) == 0) {
                FIELD(s32, state, 4) = 10;
            } else {
                GameWork_ClearFlag(gGameWork, 0x3a7);
                Overlay016_CreateTransientMessage(state, 2, 1, 0);
                FIELD(s32, state, 4)++;
            }
            FIELD(s32, state, 8) = 0;
            DisplayBrightness_StartMaskedTransitions(1, 0);
        }
        break;
    case 2:
        if (DisplayBrightness_IsMainTransitionComplete() != 0) {
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 3:
        if (ModalState_UpdateInput(FIELD(void *, state, 0x460),
                          (u8 *)state + 0x30,
                          (FIELD(u32, state, 0x20) & 0x20) != 0 ? -1 : 0) >= 0) {
            Overlay016_DestroyTransientMessage(state);
            Overlay016ActorValue_Init(state, data_ov016_022014b8[0],
                                data_ov016_022014b8[1]);
        }
        break;
    case 10:
        if (DisplayBrightness_IsMainTransitionComplete() != 0) {
            Overlay016ActorValue_Init(state, data_ov016_022014b0[0],
                                data_ov016_022014b0[1]);
        }
        break;
    }
    Overlay016_UpdateScene(state);
    return 0;
}
