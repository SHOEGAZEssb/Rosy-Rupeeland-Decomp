#include "tingle/types.h"

/* Overlay 30 selector-board entry and result-dialog state handler. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov030_021ff8dc[];
extern void *data_020f4e14[];
extern void *gGameWork;
extern u8 gHeapContext[];
extern const s32 data_ov030_021ff7b0[];
extern const s32 data_ov030_021ff7a8[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov030_021fea00(void *);
extern void SceneSound_PlayDirectSequence(void *, s32);
extern s32 DisplayBrightness_IsMainTransitionComplete(void);
extern void GraphicsSpriteGroup_ReleaseIndexedEntries(void *);
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern void *func_ov030_021fcf20(void *, void *, void *, s32);
extern void func_ov030_021fe554(void *);
extern void DisplayBrightness_StartMaskedTransitions(s32, s32, ...);
extern void TitleDialog_ClearTextRect(void *);
extern s32 GameWork_TestFlag(void *, s32);
extern void GameWork_ClearFlag(void *, s32);
extern void func_ov030_021fe954(void *, u16);
extern void func_ov030_021fda14(void *, s32, s32);
extern void func_ov030_021fe768(void *);
#ifdef __cplusplus
}
#endif

/*
 * Board-entry handler keyed by scene substate +4. State 0 starts scene mode
 * 0xE4 and falls through to a transition wait. State 1 releases renderer +0x78,
 * allocates and constructs a 0x1F0-byte selector widget at +0x2C4 from selected
 * catalog record +0x394 and mode +0x390, sets its scroll to 16, loads board-screen
 * resources, enables record mode (1,0), and advances. State 2 waits again, closes
 * the dialog, consumes GameWork flag 0x3E1 when present, and opens message 0x1F8
 * for mode 1, 0x31D for mode 2, or 0x1FA without the flag; it then targets table
 * 0x021FF7B0. State 3 retargets to 0x021FF7A8 once dialog status bit 0 is set.
 * Every call services dialog input and the normal frame, returning zero. Heap,
 * widget, graphics, persistent flags, dialog, and scene state may change.
 */
extern "C" s32 func_ov030_021fee6c(void *scene)
{
    (void)func_ov030_021fea00(scene);
    switch (FIELD(s32, scene, 4)) {
    case 0:
        SceneSound_PlayDirectSequence(scene, 0xe4);
        ++FIELD(s32, scene, 4);
        FIELD(s32, scene, 8) = 0;
        /* Recovered control flow intentionally continues into state 1. */
    case 1:
        if (DisplayBrightness_IsMainTransitionComplete() != 0) {
            GraphicsSpriteGroup_ReleaseIndexedEntries(FIELD(void *, scene, 0x78));
            void *widget = Heap_Alloc(0x1f0, data_ov030_021ff8dc,
                                      4, gHeapContext);
            if (widget != 0)
                widget = func_ov030_021fcf20(
                    widget, data_020f4e14[0], FIELD(void *, scene, 0x394),
                    FIELD(s32, scene, 0x390));
            FIELD(void *, scene, 0x2c4) = widget;
            FIELD(s32, widget, 0x1c4) = 0x10;
            func_ov030_021fe554(scene);
            DisplayBrightness_StartMaskedTransitions(1, 0);
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        break;
    case 2:
        if (DisplayBrightness_IsMainTransitionComplete() != 0) {
            TitleDialog_ClearTextRect(FIELD(void *, scene, 0x2bc));
            if (GameWork_TestFlag(gGameWork, 0x3e1) != 0) {
                GameWork_ClearFlag(gGameWork, 0x3e1);
                func_ov030_021fe954(scene,
                    FIELD(s32, scene, 0x390) == 1 ? 0x1f8 : 0x31d);
                ++FIELD(s32, scene, 4);
                FIELD(s32, scene, 8) = 0;
            } else {
                func_ov030_021fe954(scene, 0x1fa);
            }
            func_ov030_021fda14(scene, data_ov030_021ff7b0[0],
                                data_ov030_021ff7b0[1]);
        }
        break;
    case 3:
        if ((FIELD(u32, FIELD(void *, scene, 0x2bc), 0x38) & 1) != 0)
            func_ov030_021fda14(scene, data_ov030_021ff7a8[0],
                                data_ov030_021ff7a8[1]);
        break;
    }
    func_ov030_021fe768(scene);
    return 0;
}
