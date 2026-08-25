#include "tingle/types.h"

/* Overlay 16 final actor, fade, quantity prompt, completion, and deletion handlers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u32 data_ov016_022013f0[];
extern const u32 data_ov016_022013f8[];
extern const u32 data_ov016_02201428[];
extern const u32 data_ov016_02201430[];
extern const u32 data_ov016_02201438[];
extern const u32 data_ov016_02201520[];
extern void *data_020f4e14;
extern void *data_021e9ac0;
extern void *gGameWork;

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *);
extern void GameWork_ClearFlag(void *, u32);
extern s32 DisplayBrightness_IsMainTransitionComplete(void);
extern s32 ActorDescriptorState_FindInactiveQuantity(void *, u16);
extern s32 func_0206fb18(void *);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void DisplayBrightness_StartMaskedTransitions(s32, s32);
extern void SceneSound_PlayPackedEffect(void *, s32);
extern void PresentationList_DeleteAll(void *);
extern s32 func_02096450(void *, void *, void *, s32, s32);
extern void Overlay000_Grid_Render(void *);
extern void Overlay016_RenderList(void *);
extern s32 Overlay016_HasActorGroupCompleted(void *);
extern void Overlay016ActorValue_Init(void *, u32, u32);
extern void func_ov016_021ff094(void *);
extern void Overlay016_CreateSceneSprite(void *);
extern void func_ov016_021ff71c(void *);
extern void func_ov016_021ff7bc(void *);
extern void func_ov016_021ff848(void *, u16);
extern void func_ov016_021ff9f8(void *, u16, s32);
extern void func_ov016_021ffb3c(void *);
extern void func_ov016_021ffba4(void *);
#ifdef __cplusplus
}
#endif

/*
 * At state 0, mode +0x54==1 sends action 3, advances, and falls into the actor
 * completion wait. Other modes send action 9, clear selected actor pointer
 * +0x474, and transition through data_ov016_022013F8. At state 1, once actor
 * group +0x470 completes, increment the selected actor's +0x1C count, clear
 * +0x474, refresh auxiliary list +0x44C, advance/reset the substate, and
 * transition through data_ov016_02201438. Update the scene and return zero.
 */
extern "C" s32 func_ov016_02200fe4(void *state)
{
    switch (FIELD(s32, state, 4)) {
    case 0:
        if (FIELD(s32, state, 0x54) == 1) {
            SceneSound_PlayPackedEffect(state, 3);
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        } else {
            SceneSound_PlayPackedEffect(state, 9);
            FIELD(void *, state, 0x474) = 0;
            Overlay016ActorValue_Init(state, data_ov016_022013f8[0],
                                data_ov016_022013f8[1]);
            break;
        }
        /* Mode-one success continues into the actor completion wait. */
    case 1:
        if (Overlay016_HasActorGroupCompleted(FIELD(void *, state, 0x470)) != 0) {
            void *actor = FIELD(void *, state, 0x474);
            FIELD(s32, actor, 0x1c)++;
            FIELD(void *, state, 0x474) = 0;
            Overlay000_Grid_Render(FIELD(void *, state, 0x44c));
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
            Overlay016ActorValue_Init(state, data_ov016_02201438[0],
                                data_ov016_02201438[1]);
        }
        break;
    }
    func_ov016_021ff7bc(state);
    return 0;
}

/*
 * Fade from the alternate scene back to the primary list. State 0 starts a fade
 * toward -16 and falls through. State 1 waits, destroys auxiliary objects,
 * refreshes the main font and message 0x18, reconstructs primary sprites and
 * graphics, rerenders list +0x444 and cursor, starts a fade toward zero, and
 * advances. State 2 waits for completion, transitions via pair 0x221430, then
 * advances once more. Update the scene and return zero. UI/fade state changes.
 */
extern "C" s32 func_ov016_022010c0(void *state)
{
    switch (FIELD(s32, state, 4)) {
    case 0:
        DisplayBrightness_StartMaskedTransitions(1, -0x10);
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        /* Deliberate fall-through while fading out. */
    case 1:
        if (DisplayBrightness_IsMainTransitionComplete() != 0) {
            func_ov016_021ff71c(state);
            GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
            func_ov016_021ff848(state, 0x18);
            Overlay016_CreateSceneSprite(state);
            func_ov016_021ff094(state);
            Overlay016_RenderList(FIELD(void *, state, 0x444));
            func_ov016_021ffba4(state);
            DisplayBrightness_StartMaskedTransitions(1, 0);
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 2:
        if (DisplayBrightness_IsMainTransitionComplete() != 0) {
            Overlay016ActorValue_Init(state, data_ov016_02201430[0],
                                data_ov016_02201430[1]);
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    }
    func_ov016_021ff7bc(state);
    return 0;
}

/*
 * At state 0, derive candidate quantity +0x484 from record slot +0x468, clamp
 * it so the global value keyed by record halfword +4 cannot exceed 99, and open
 * quantity message 0x1D when the result exceeds one or 0x1F otherwise. State 1
 * updates object +0x464 with input +0x30, button source +0x2C, and sign masks
 * from scene bits 4/5. On acceptance, a nonzero object field +0x1B8 stores its
 * selected quantity +0x0C, sets completion marker +0x478, and transitions via
 * 0x2213F0. Otherwise close the prompt, refresh list +0x44C, and transition via
 * 0x221428. Update the scene and return zero. Quantity/UI state changes.
 */
extern "C" s32 func_ov016_022011c0(void *state)
{
    switch (FIELD(s32, state, 4)) {
    case 0: {
        void *record = FIELD(void *, FIELD(void *, state, 0x468), 0);
        s32 current;

        FIELD(s32, state, 0x484) = func_0206fb18(FIELD(void *, state, 0x468));
        current = ActorDescriptorState_FindInactiveQuantity((u8 *)data_021e9ac0 + 0x1c,
                               FIELD(u16, record, 4));
        if (FIELD(s32, state, 0x484) + current >= 99) {
            FIELD(s32, state, 0x484) = 99 - current;
        }
        if (FIELD(s32, state, 0x484) > 1) {
            func_ov016_021ff9f8(state, 0x1d, FIELD(s32, state, 0x484));
        } else {
            func_ov016_021ff9f8(state, 0x1f, FIELD(s32, state, 0x484));
        }
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        break;
    }
    case 1:
        if (func_02096450(FIELD(void *, state, 0x464),
                          (u8 *)state + 0x30, FIELD(void *, state, 0x2c),
                          (FIELD(u32, state, 0x20) & 0x10) != 0 ? -1 : 0,
                          (FIELD(u32, state, 0x20) & 0x20) != 0 ? -1 : 0) != 0) {
            void *object = FIELD(void *, state, 0x464);
            if (FIELD(s32, object, 0x1b8) != 0) {
                FIELD(s32, state, 0x484) = FIELD(s32, object, 0xc);
                FIELD(s32, state, 0x478) = 1;
                Overlay016ActorValue_Init(state, data_ov016_022013f0[0],
                                    data_ov016_022013f0[1]);
            } else {
                func_ov016_021ffb3c(state);
                Overlay000_Grid_Render(FIELD(void *, state, 0x44c));
                Overlay016ActorValue_Init(state, data_ov016_02201428[0],
                                    data_ov016_02201428[1]);
            }
        }
        break;
    }
    func_ov016_021ff7bc(state);
    return 0;
}

/*
 * On first entry, clear game-work flag 0x3A8 when completion marker +0x478 is
 * nonzero, then advance/reset substate +4/+8. Always update the scene and return
 * one, signalling this terminal handler's completion. Persistent flag state may
 * change; no direct hardware access occurs.
 */
extern "C" s32 func_ov016_02201304(void *state)
{
    if (FIELD(s32, state, 4) == 0) {
        if (FIELD(s32, state, 0x478) != 0) {
            GameWork_ClearFlag(gGameWork, 0x3a8);
        }
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
    }
    func_ov016_021ff7bc(state);
    return 1;
}

/*
 * Restore vtable data_ov016_02201520 at word +0, destroy the embedded base
 * through 0x02095308, free the object, and return its original pointer value.
 * The returned address no longer owns valid storage. Heap state changes; no
 * direct hardware access occurs.
 */
extern "C" void *func_ov016_02201364(void *state)
{
    FIELD(const u32 *, state, 0) = data_ov016_02201520;
    PresentationList_DeleteAll(state);
    Heap_Free(state);
    return state;
}
