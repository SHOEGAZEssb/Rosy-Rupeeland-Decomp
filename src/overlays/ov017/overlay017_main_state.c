#include "tingle/types.h"

/* Overlay 17 main scripted interaction state machine and its per-frame dispatch. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern u8 data_021e9e1c[];
extern void *data_021e9ac0;
extern u8 data_ov017_02201420[];
extern const s32 data_ov017_02201538[2];
extern const s32 data_ov017_02201560[2];
extern u8 data_ov017_022016e0[];
extern void *gGameWork;

#ifdef __cplusplus
extern "C" {
#endif
extern void GameWork_ClearFlag(void *, u32);
extern void GameWork_SetFlag(void *, u32);
extern s32 GameWork_TestFlag(void *, u32);
extern void *ActorDescriptor_GetPrimaryLabel(void *);
extern void ActorDescriptor_SetQuantity(void *, u16);
extern s32 InventoryRecordCollection_FindIdAlternate(void *, s32);
extern void func_0206fcec(void *);
extern void GraphicsSpriteGroup_ReplaceStateResourcesFromSource(void *, s32, void *);
extern void SceneSound_PlayPackedEffect(void *, s32);
extern void SceneSound_PlayDirectSequence(void *, s32);
extern void Presentation_SetScript(void *, void *, s32);
extern void SpritePresentation_SetAnimation(void *, s32);
extern void SpritePresentation_Show(void *);
extern s32 SpriteMotionController_BeginHitResponse(void *, void *, s32, s32);
extern void SpriteMotionController_Show(void *);
extern s32 ModalState_UpdateInput(void *, void *, s32);
extern s32 func_020befec(s32, s32);
extern void Overlay017_SetCallbackDescriptor(void *, s32, s32, s32);
extern void Overlay017_CreateModalPanel(void *, s32, s32, void *);
extern void Overlay017_DestroyModalPanel(void *);
extern void Overlay017_DrawStatusText(void *, void *, s32);
extern s32 func_ov017_02200bf8(void);
extern void Overlay017_UpdateScene(void *);
extern void Overlay017_RenderScene(void *);
#ifdef __cplusplus
}
#endif

/*
 * Advance the scripted interaction selected by phase +4. Phases 0/1 prepare
 * and wait for resource +0x260, then either follow the special +0x3BC route or
 * update a 0x24-byte record selected from global data +0x1C/+0x20. GameWork
 * flags 0x3AB, 0x3AC, 0x3AD, and 0x3CE select message-panel branches; phases
 * 10, 20, 30, and 35 poll and close those panels, while phase 21 delays before
 * opening panel 0x21. Phase 40 waits for one of two UI objects, records flag
 * 0x3A6 and a halfword at GameWork +0x1CA when appropriate, and installs one
 * of two callbacks. Every frame ends by running the main scene update and
 * render pass. Returns zero. Scene, GameWork, UI/resource, text, event, and
 * callback state may change; direct graphics MMIO is performed by the renderer.
 */
extern "C" s32 func_ov017_02200cc0(void *state)
{
    switch (FIELD(s32, state, 4)) {
    case 0:
        if (++FIELD(s32, state, 8) > 0x10) {
            if (FIELD(s32, data_ov017_022016e0, 0x80) == 0) {
                SceneSound_PlayPackedEffect(state, 0x4100);
                if (FIELD(s32, state, 0x3bc) != 0) {
                    SpritePresentation_SetAnimation(FIELD(void *, state, 0x260), 1);
                } else {
                    GraphicsSpriteGroup_ReplaceStateResourcesFromSource(FIELD(void *, state, 0x58),
                                  FIELD(s32, FIELD(void *, state, 0x260), 0x9c),
                                  (u8 *)state + 0x74);
                }
            } else {
                SceneSound_PlayPackedEffect(state, 0x4103);
            }
            SpritePresentation_Show(FIELD(void *, state, 0x260));
            Presentation_SetScript(FIELD(void *, state, 0x260),
                          data_ov017_02201420, 0);
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;

    case 1: {
        typedef s32 (*ReadyMethod)(void *);
        void *resource = FIELD(void *, state, 0x260);
        ReadyMethod ready = FIELD(ReadyMethod *, resource, 0)[2];
        if (ready(resource)) {
            FIELD(u32, state, 0x4c) |= 8;
            if (FIELD(s32, state, 0x3bc) != 0 &&
                FIELD(s32, data_ov017_022016e0, 0x80) == 0) {
                FIELD(s32, state, 0x3b8) = 1;
                SceneSound_PlayDirectSequence(state, 7);
                if (GameWork_TestFlag(gGameWork, 0x3ab)) {
                    GameWork_ClearFlag(gGameWork, 0x3ab);
                    func_0206fcec(data_021e9e1c);
                    Overlay017_CreateModalPanel(state, 9, 1, 0);
                    FIELD(s32, state, 4) = 10;
                } else {
                    func_0206fcec(data_021e9e1c);
                    SpriteMotionController_Show((u8 *)state + 0x12c);
                    SpriteMotionController_Show((u8 *)state + 0x80);
                    FIELD(s32, state, 4) = 40;
                }
                FIELD(s32, state, 8) = 0;
                Overlay017_DrawStatusText(
                    state, (u8 *)FIELD(void *, FIELD(void *, state, 0x258), 0) + 4,
                    FIELD(u16, data_021e9e1c, 0x20));
            } else {
                void *global;
                void *record;
                s32 amount;

                SceneSound_PlayDirectSequence(state, 8);
                amount = func_020befec(
                    FIELD(s32, state, 0x3c0) * FIELD(s32, state, 0x3c4) + 4,
                    5);
                global = data_021e9ac0;
                record = (u8 *)FIELD(void *, global, 0x20) +
                         InventoryRecordCollection_FindIdAlternate((u8 *)global + 0x1c, 0xec) * 0x24;
                Overlay017_DrawStatusText(state, record, amount);
                if (func_ov017_02200bf8()) {
                    Overlay017_CreateModalPanel(state, 0x25, 0,
                                        ActorDescriptor_GetPrimaryLabel(record));
                    FIELD(s32, state, 4) = 0x23;
                    FIELD(s32, state, 8) = 0;
                    break;
                }
                ActorDescriptor_SetQuantity(record,
                              (u16)(FIELD(u16, record, 4) + amount));

                if (FIELD(s32, state, 0x3bc) == 0 &&
                    GameWork_TestFlag(gGameWork, 0x3ac)) {
                    GameWork_ClearFlag(gGameWork, 0x3ac);
                    Overlay017_CreateModalPanel(state, 10, 1, 0);
                    FIELD(s32, state, 4) = 20;
                    FIELD(s32, state, 8) = 0;
                } else if (FIELD(s32, data_ov017_022016e0, 0x80) != 0 &&
                           GameWork_TestFlag(gGameWork, 0x3ad)) {
                    GameWork_ClearFlag(gGameWork, 0x3ad);
                    Overlay017_CreateModalPanel(state, 11, 1, 0);
                    FIELD(s32, state, 4) = 20;
                    FIELD(s32, state, 8) = 0;
                } else if (GameWork_TestFlag(gGameWork, 0x3ce)) {
                    GameWork_ClearFlag(gGameWork, 0x3ce);
                    Overlay017_CreateModalPanel(state, 0x21, 1, 0);
                    FIELD(s32, state, 4) = 30;
                    FIELD(s32, state, 8) = 0;
                } else {
                    SpriteMotionController_Show((u8 *)state + 0x12c);
                    SpriteMotionController_Show((u8 *)state + 0x80);
                    FIELD(s32, state, 4) = 40;
                    FIELD(s32, state, 8) = 0;
                }
            }
        }
        break;
    }

    case 10:
    case 30:
    case 35:
        if (ModalState_UpdateInput(FIELD(void *, state, 0x400),
                           (u8 *)state + 0x30,
                           ((s32)(FIELD(u32, state, 0x20) << 26)) >> 31) >= 0) {
            Overlay017_DestroyModalPanel(state);
            SpriteMotionController_Show((u8 *)state + 0x12c);
            SpriteMotionController_Show((u8 *)state + 0x80);
            FIELD(s32, state, 4) = 40;
            FIELD(s32, state, 8) = 0;
        }
        break;

    case 20:
        if (ModalState_UpdateInput(FIELD(void *, state, 0x400),
                           (u8 *)state + 0x30,
                           ((s32)(FIELD(u32, state, 0x20) << 26)) >> 31) >= 0) {
            Overlay017_DestroyModalPanel(state);
            if (GameWork_TestFlag(gGameWork, 0x3ce)) {
                GameWork_ClearFlag(gGameWork, 0x3ce);
                FIELD(s32, state, 4)++;
                FIELD(s32, state, 8) = 0;
            } else {
                SpriteMotionController_Show((u8 *)state + 0x12c);
                SpriteMotionController_Show((u8 *)state + 0x80);
                FIELD(s32, state, 4) = 40;
                FIELD(s32, state, 8) = 0;
            }
        }
        break;

    case 21:
        if (++FIELD(s32, state, 8) > 0x14) {
            Overlay017_CreateModalPanel(state, 0x21, 1, 0);
            FIELD(s32, state, 4) = 30;
            FIELD(s32, state, 8) = 0;
        }
        break;

    case 40:
        if ((((s32)(FIELD(u32, state, 0x20) << 26)) >> 31) != 0) {
            if (SpriteMotionController_BeginHitResponse((u8 *)state + 0x80, (u8 *)state + 0x30,
                              0, 4)) {
                SceneSound_PlayPackedEffect(state, 2);
                Overlay017_SetCallbackDescriptor(state, data_ov017_02201538[0],
                                    data_ov017_02201538[1], 4);
            } else if (SpriteMotionController_BeginHitResponse((u8 *)state + 0x12c,
                                     (u8 *)state + 0x30, 0, 4)) {
                u16 result;
                SceneSound_PlayPackedEffect(state, 2);
                GameWork_SetFlag(gGameWork, 0x3a6);
                if (FIELD(s32, state, 0x3b8) == 0) {
                    result = 0xec;
                } else {
                    result = FIELD(u16,
                        FIELD(void *, FIELD(void *, state, 0x258), 0), 4);
                }
                FIELD(u16, gGameWork, 0x1ca) = result;
                Overlay017_SetCallbackDescriptor(state, data_ov017_02201560[0],
                                    data_ov017_02201560[1], 4);
            }
        }
        break;
    }

    Overlay017_UpdateScene(state);
    Overlay017_RenderScene(state);
    return 0;
}
