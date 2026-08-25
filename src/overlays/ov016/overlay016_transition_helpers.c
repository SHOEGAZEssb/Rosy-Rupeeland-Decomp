#include "tingle/types.h"

/* Overlay 16 entry-transition and selected-descriptor decision helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern const u32 data_ov016_022013d0[];
extern const u32 data_ov016_022013d8[];
extern const u32 data_ov016_02201440[];
extern void *gDebugFont;

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void SceneSound_PlayPackedEffect(void *, s32);
extern s32 ModalState_UpdateInput(void *, void *, s32);
extern void SpriteMotionController_Hide(void *);
extern void Overlay016_RenderList(void *);
extern void *func_ov016_021fd628(void *);
extern void Overlay016ActorValue_Init(void *, u32, u32);
extern void Overlay016_DrawStatusMessage(void *, u16);
extern void Overlay016_CreateTransientMessage(void *, s32, s32, void *);
extern void Overlay016_UpdateCursorPosition(void *);
extern void Overlay016_SyncSelectedPanel(void *);
#ifdef __cplusplus
}
#endif

/*
 * At substate +4==0, refresh both font owners, draw message 0x18 in mode zero,
 * and either render/synchronize a nonempty list then transition with pair
 * data_ov016_022013D8, or prepare the empty-list prompt: hide actor +0x194,
 * set sprite +0xE4 flag bit 2, clear scene flag bit 2 at +0x48/+0x4C, open
 * transient message (3,1,null), and advance the substate. Set scene flag bit 0.
 * At substate 1, update message +0x460 using input +0x30 and a sign mask derived
 * from scene flag bit 5; on nonnegative completion transition with pair 0x221440.
 * Return zero. Presentation state changes; no direct MMIO occurs here.
 */
extern "C" s32 Overlay016_UpdateMessageTransition(void *state)
{
    switch (FIELD(s32, state, 4)) {
    case 0:
        GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
        GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
        if (FIELD(s32, state, 0x54) == 0) {
            Overlay016_DrawStatusMessage(state, 0x18);
        }
        if (FIELD(s32, FIELD(void *, state, 0x444), 0x50) != 0) {
            Overlay016_RenderList(FIELD(void *, state, 0x444));
            Overlay016_UpdateCursorPosition(state);
            Overlay016_SyncSelectedPanel(state);
            Overlay016ActorValue_Init(state, data_ov016_022013d8[0],
                                data_ov016_022013d8[1]);
        } else {
            SpriteMotionController_Hide((u8 *)state + 0x194);
            FIELD(u16, FIELD(void *, state, 0xe4), 0x24) |= 4;
            FIELD(u32, state, 0x48) &= ~4u;
            FIELD(u32, state, 0x4c) &= ~4u;
            Overlay016_CreateTransientMessage(state, 3, 1, 0);
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        FIELD(u32, state, 0x20) = (FIELD(u32, state, 0x20) & ~1u) | 1u;
        break;
    case 1:
        if (ModalState_UpdateInput(FIELD(void *, state, 0x460), (u8 *)state + 0x30,
                          (FIELD(u32, state, 0x20) & 0x20) != 0 ? -1 : 0) >= 0) {
            Overlay016ActorValue_Init(state, data_ov016_02201440[0],
                                data_ov016_02201440[1]);
        }
        break;
    }
    return 0;
}

/*
 * Read the current descriptor from list +0x444 unless mode +0x54 is 2. Any of
 * descriptor flag bits 0-2 sends action 9 and switches substate +4 to 10. With
 * no such flags, send action 2, store descriptor word +0 at scene +0x468, and
 * transition using data_ov016_022013D0. The original control flow also retests
 * flag bit 1 after establishing all three bits are clear; that matching-only
 * branch cannot be taken but remains visible in the exact assembly fallback.
 * Return void. Scene transition and sound/action state may change.
 */
extern "C" void Overlay016_DispatchPendingTransition(void *state)
{
    void *descriptor = func_ov016_021fd628(FIELD(void *, state, 0x444));
    u16 flags;

    if (FIELD(s32, state, 0x54) == 2) {
        return;
    }
    flags = FIELD(u16, descriptor, 0xc);
    if ((flags & 7) != 0) {
        SceneSound_PlayPackedEffect(state, 9);
        FIELD(s32, state, 4) = 10;
        FIELD(s32, state, 8) = 0;
        return;
    }
    if ((flags & 2) != 0) {
        SceneSound_PlayPackedEffect(state, 9);
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        return;
    }
    SceneSound_PlayPackedEffect(state, 2);
    FIELD(void *, state, 0x468) = FIELD(void *, descriptor, 0);
    Overlay016ActorValue_Init(state, data_ov016_022013d0[0],
                        data_ov016_022013d0[1]);
}
