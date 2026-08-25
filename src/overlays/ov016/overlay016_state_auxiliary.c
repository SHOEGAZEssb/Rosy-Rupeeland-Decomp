#include "tingle/types.h"

/* Overlay 16 auxiliary selector/detail/actor interaction state machine. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u32 data_ov016_02201418[];
extern const u32 data_ov016_02201468[];
extern const u32 data_ov016_02201470[];
extern const u32 data_ov016_02201478[];
extern const u32 data_ov016_02201488[];
extern const u32 data_ov016_02201490[];
extern const u32 data_ov016_02201498[];

#ifdef __cplusplus
extern "C" {
#endif
extern void SceneSound_PlayPackedEffect(void *, s32);
extern s32 SpriteMotionController_BeginHitResponse(void *, void *, s32, s32);
extern s32 func_ov000_021fc298(void *, void *);
extern void func_ov000_021fc3f8(void *);
extern s32 func_ov000_021fc424(void *);
extern s32 func_ov000_021fc450(void *);
extern void Overlay000_Grid_UpdateTransition(void *);
extern s32 func_ov000_021fc4fc(void *);
extern s32 func_ov000_021fc528(void *);
extern s32 func_ov000_021fc538(void *);
extern s32 func_ov000_021fc5ac(void *, void *);
extern void Overlay000_SyncSelection(void *);
extern void Overlay000_SetSelection(void *, s32);
extern void *Overlay000_GetActiveMetadata(void *);
extern s32 func_ov000_021fcb98(void *, void *);
extern s32 func_ov000_021fcc18(void *, void *);
extern s32 func_ov000_021fcca8(void *, void *);
extern s32 func_ov000_021fccfc(void *, void *);
extern void *Overlay016_RemoveActor(void *, void *, s32);
extern s32 Overlay016_HasActorReachedLimit(void *);
extern void Overlay016ActorValue_Init(void *, u32, u32);
extern void Overlay016_UpdateScene(void *);
extern void Overlay016_RefreshSelectionPresentation(void *);
extern void Overlay016_ToggleDetailPanel(void *);
extern void Overlay016_MoveDetailSelection(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * Run the auxiliary selector state machine at +4. State 0 begins its opening
 * animation and refreshes selection messaging. State 1 waits for opening, then
 * falls into state 2; while waiting it advances the animation. State 2 routes
 * list keys/touch, selected-entry validation, cancel, actor-group selection,
 * detail previous/next/toggle controls, and auxiliary page changes. Its fixed
 * transition pairs are 0x221498, 0x221490, 0x221488/0x221418 by mode, 0x221478,
 * and 0x221470. State 3 handles page-close/reopen completion. State 10 waits for
 * actor-group completion and transitions through 0x221468. Every call updates
 * all scene components and returns zero. UI/action/transition state changes;
 * no direct hardware registers are accessed by this handler.
 */
extern "C" s32 Overlay016_UpdateAuxiliaryState(void *state)
{
    void *list = FIELD(void *, state, 0x44c);
    s32 selected;

    switch (FIELD(s32, state, 4)) {
    case 0:
        func_ov000_021fc3f8(list);
        Overlay016_RefreshSelectionPresentation(state);
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        break;
    case 1:
        if (func_ov000_021fc450(list) != 0) {
            Overlay016_RefreshSelectionPresentation(state);
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        } else {
            Overlay000_Grid_UpdateTransition(list);
            break;
        }
        /* Completed opening continues directly into state 2. */
    case 2:
        if (func_ov000_021fcb98(list, FIELD(void *, state, 0x2c)) == 0 &&
            (FIELD(u32, state, 0x20) & 0x10) != 0 &&
            func_ov000_021fcca8(list, (u8 *)state + 0x30) == 0 &&
            (FIELD(u32, state, 0x20) & 0x20) != 0) {
            selected = func_ov000_021fc298(list, (u8 *)state + 0x30);
            if (func_ov000_021fcc18(list, (u8 *)state + 0x30) == 0) {
                if (func_ov000_021fccfc(list, (u8 *)state + 0x30) != 0) {
                    Overlay016ActorValue_Init(state, data_ov016_02201498[0],
                                        data_ov016_02201498[1]);
                    break;
                }
                if (selected >= 0) {
                    if (selected == FIELD(s32, list, 0x25c)) {
                        void *entry = Overlay000_GetActiveMetadata(list);
                        void *child = FIELD(void *, entry, 0xc);
                        if (child != 0 && FIELD(void *, entry, 0x1c) != 0 &&
                            (FIELD(u32, child, 0x20) & 1) == 0) {
                            Overlay016ActorValue_Init(state,
                                                data_ov016_02201490[0],
                                                data_ov016_02201490[1]);
                        } else {
                            SceneSound_PlayPackedEffect(state, 9);
                        }
                    } else {
                        SceneSound_PlayPackedEffect(state, 0);
                        Overlay000_SetSelection(list, selected);
                        Overlay000_SyncSelection(list);
                        Overlay016_RefreshSelectionPresentation(state);
                    }
                } else if (func_ov000_021fc5ac(list,
                                               (u8 *)state + 0x30) != 0) {
                    SceneSound_PlayPackedEffect(state, 3);
                    if (FIELD(s32, state, 0x54) == 1) {
                        Overlay016ActorValue_Init(state,
                                            data_ov016_02201488[0],
                                            data_ov016_02201488[1]);
                    } else {
                        Overlay016ActorValue_Init(state,
                                            data_ov016_02201418[0],
                                            data_ov016_02201418[1]);
                    }
                    break;
                } else if (SpriteMotionController_BeginHitResponse(
                               (u8 *)FIELD(void *, state, 0x470) + 0x20,
                               (u8 *)state + 0x30, 0, 4) != 0) {
                    SceneSound_PlayPackedEffect(state, 2);
                    if (FIELD(s32, state, 0x54) == 1) {
                        FIELD(s32, state, 0x478) = 1;
                        Overlay016ActorValue_Init(state,
                                            data_ov016_02201478[0],
                                            data_ov016_02201478[1]);
                    } else {
                        FIELD(s32, state, 4) = 10;
                        FIELD(s32, state, 8) = 0;
                    }
                    break;
                } else if (SpriteMotionController_BeginHitResponse((u8 *)state + 0x2ec,
                                          (u8 *)state + 0x30, -4, 0) != 0) {
                    SceneSound_PlayPackedEffect(state, 0xb);
                    Overlay016_MoveDetailSelection(state, -1);
                } else if (SpriteMotionController_BeginHitResponse((u8 *)state + 0x398,
                                          (u8 *)state + 0x30, 4, 0) != 0) {
                    SceneSound_PlayPackedEffect(state, 0xb);
                    Overlay016_MoveDetailSelection(state, 1);
                } else if (SpriteMotionController_BeginHitResponse((u8 *)state + 0x240,
                                          (u8 *)state + 0x30, 0, -4) != 0) {
                    SceneSound_PlayPackedEffect(state, 0xb);
                    Overlay016_ToggleDetailPanel(state);
                } else {
                    FIELD(void *, state, 0x474) =
                        Overlay016_RemoveActor(FIELD(void *, state, 0x470),
                                            (u8 *)state + 0x30,
                                            FIELD(s32, state, 0x54));
                    if (FIELD(void *, state, 0x474) != 0) {
                        Overlay016ActorValue_Init(state,
                                            data_ov016_02201470[0],
                                            data_ov016_02201470[1]);
                    }
                }
            }
        }
        if (func_ov000_021fc424(list) != 0) {
            SceneSound_PlayPackedEffect(state, 0);
            FIELD(s32, state, 4)--;
            FIELD(s32, state, 8) = 0;
        } else if (func_ov000_021fc4fc(list) != 0) {
            SceneSound_PlayPackedEffect(state, 0);
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 3:
        if (func_ov000_021fc528(list) != 0) {
            FIELD(s32, state, 4)--;
            FIELD(s32, state, 8) = 0;
        } else if (func_ov000_021fc538(list) != 0) {
            Overlay016_RefreshSelectionPresentation(state);
        }
        break;
    case 10:
        if (Overlay016_HasActorReachedLimit((u8 *)FIELD(void *, state, 0x470) + 0x20) != 0) {
            Overlay016ActorValue_Init(state, data_ov016_02201468[0],
                                data_ov016_02201468[1]);
        }
        break;
    }
    Overlay016_UpdateScene(state);
    return 0;
}
