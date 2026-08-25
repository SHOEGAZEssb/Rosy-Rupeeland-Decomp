#include "tingle/types.h"

/* Overlay 16 actor-selection confirmation and completion state handlers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u32 data_ov016_02201420[];
extern const u32 data_ov016_02201448[];
extern const u32 data_ov016_02201458[];
extern const u32 data_ov016_02201460[];

#ifdef __cplusplus
extern "C" {
#endif
extern void SceneSound_PlayPackedEffect(void *, s32);
extern void SceneSound_StopPackedEffect(void *, s32);
extern void InventoryScroll_BeginMarkerDrag(void *, s32);
extern void InventoryScroll_EndMarkerDrag(void *, s32);
extern s32 func_ov000_021fc450(void *);
extern void Overlay000_Grid_UpdateTransition(void *);
extern s32 func_ov000_021fc560(void *, void *);
extern void Overlay000_Grid_Render(void *);
extern void *Overlay000_GetActiveMetadata(void *);
extern u32 Overlay016_SpawnMatchingActors(void *, void *, void *);
extern s32 Overlay016_AddActor(void *, void *);
extern s32 Overlay016_HasActorGroupCompleted(void *);
extern void Overlay016ActorValue_Init(void *, u32, u32);
extern void func_ov016_021ff7bc(void *);
extern void func_ov016_021ffc2c(void *);
#ifdef __cplusplus
}
#endif

/*
 * Run a confirmation sub-presentation stored at auxiliary list +0x44C/+0x26C.
 * State 0 opens it in mode 4 and falls through. State 1 waits on the enclosing
 * list animation; if the sub-presentation indices +0x0C/+0x10 differ, refresh
 * selection UI and send action 8, then advance and fall through. While waiting,
 * advance the list animation. State 2 uses scene flag bit 4: accepted list input
 * sends action 8 and backs up a state; otherwise close the sub-presentation in
 * mode 6 and transition through data_ov016_02201460. Update the scene and return
 * zero. UI/action/transition state changes; no direct MMIO occurs.
 */
extern "C" s32 func_ov016_02200d5c(void *state)
{
    void *list = FIELD(void *, state, 0x44c);
    void *presentation = FIELD(void *, list, 0x26c);

    switch (FIELD(s32, state, 4)) {
    case 0:
        InventoryScroll_BeginMarkerDrag(presentation, 4);
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        /* Deliberate fall-through into the opening wait. */
    case 1:
        if (func_ov000_021fc450(list) != 0) {
            if (FIELD(s32, presentation, 0xc) !=
                FIELD(s32, presentation, 0x10)) {
                func_ov016_021ffc2c(state);
                SceneSound_StopPackedEffect(state, 8);
            }
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        } else {
            Overlay000_Grid_UpdateTransition(list);
            break;
        }
        /* Completed opening continues directly into state 2. */
    case 2:
        if ((FIELD(u32, state, 0x20) & 0x10) != 0) {
            if (func_ov000_021fc560(list, (u8 *)state + 0x30) != 0) {
                SceneSound_PlayPackedEffect(state, 8);
                FIELD(s32, state, 4)--;
                FIELD(s32, state, 8) = 0;
            }
        } else {
            InventoryScroll_EndMarkerDrag(presentation, 6);
            Overlay016ActorValue_Init(state, data_ov016_02201460[0],
                                data_ov016_02201460[1]);
        }
        break;
    }
    func_ov016_021ff7bc(state);
    return 0;
}

/*
 * At state 0, consume the currently selected auxiliary entry. Mode +0x54==1
 * calls actor-group helper 0x021FE4D0 and decrements entry count +0x1C by one;
 * other modes call 0x021FE390 with record +0x468 and subtract its returned low
 * halfword. Success sends action 2, refreshes the auxiliary list, and advances;
 * failure sends action 9 and transitions through pair 0x221458 or 0x221420.
 * State 1 waits for actor-group completion then transitions through 0x221448.
 * Update the scene and return zero. Actor/list/action/transition state changes.
 */
extern "C" s32 func_ov016_02200e88(void *state)
{
    void *list = FIELD(void *, state, 0x44c);

    switch (FIELD(s32, state, 4)) {
    case 0:
        if (FIELD(s32, state, 0x54) == 1) {
            void *entry = Overlay000_GetActiveMetadata(list);
            if (Overlay016_AddActor(FIELD(void *, state, 0x470), entry) != 0) {
                SceneSound_PlayPackedEffect(state, 2);
                FIELD(s32, entry, 0x1c)--;
                Overlay000_Grid_Render(list);
                FIELD(s32, state, 4)++;
                FIELD(s32, state, 8) = 0;
            } else {
                SceneSound_PlayPackedEffect(state, 9);
                Overlay016ActorValue_Init(state, data_ov016_02201458[0],
                                    data_ov016_02201458[1]);
                break;
            }
        } else {
            void *entry = Overlay000_GetActiveMetadata(list);
            u32 consumed = Overlay016_SpawnMatchingActors(FIELD(void *, state, 0x470),
                                               FIELD(void *, state, 0x468),
                                               entry);
            if (consumed != 0) {
                SceneSound_PlayPackedEffect(state, 2);
                FIELD(s32, entry, 0x1c) -= (u16)consumed;
                Overlay000_Grid_Render(list);
                FIELD(s32, state, 4)++;
                FIELD(s32, state, 8) = 0;
            } else {
                SceneSound_PlayPackedEffect(state, 9);
                Overlay016ActorValue_Init(state, data_ov016_02201420[0],
                                    data_ov016_02201420[1]);
                break;
            }
        }
        /* Successful consumption continues into the completion check. */
    case 1:
        if (Overlay016_HasActorGroupCompleted(FIELD(void *, state, 0x470)) != 0) {
            Overlay016ActorValue_Init(state, data_ov016_02201448[0],
                                data_ov016_02201448[1]);
        }
        break;
    }
    func_ov016_021ff7bc(state);
    return 0;
}
