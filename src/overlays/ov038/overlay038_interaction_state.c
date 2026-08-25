#include "tingle/types.h"

/*
 * Overlay 38 interaction state machine. This recovered callback opens and
 * advances the selection model, handles keys/touch/list gestures, refreshes
 * selected-record presentation, dispatches exits, and updates the UI each tick.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u32 data_ov038_021fdca8[];
extern const u32 data_ov038_021fdcb8[];

#ifdef __cplusplus
extern "C" {
#endif
extern void InventoryScroll_ResetPresentationState(void *model);
extern s32 InventoryScroll_UpdateInterpolation(void *model);
extern void func_ov038_021fd578(void *presentation);
extern void InventoryScroll_SaveOrigins(void *model);
extern void InventoryScroll_MoveSelectionUp(void *model);
extern void InventoryScroll_MoveSelectionDown(void *model);
extern s32 func_ov038_021fd670(void *presentation);
extern s32 InventoryScroll_TestUpperArrowHold(void *model, void *input);
extern s32 InventoryScroll_TestLowerArrowHold(void *model, void *input);
extern s32 InventoryScroll_TestUpperArrowPress(void *model, void *input);
extern s32 InventoryScroll_TestLowerArrowPress(void *model, void *input);
extern s32 InventoryScroll_TestMarkerHit(void *model, void *input);
extern s32 InventoryScroll_PageUp(void *model);
extern s32 InventoryScroll_PageDown(void *model);
extern void SceneSound_PlayPackedEffect(void *presentation, s32 soundOrEvent);
extern void InventoryScroll_SetSelectedRow(void *model, s32 selection);
extern s32 func_ov038_021fd508(void *presentation);
extern u32 func_ov038_021fd540(void *presentation);
extern void AreaInfoPanelPresentation_ShowIndex(void *label, s32 value);
extern s32 func_ov046_0220c3bc(void *panel, s32 value);
extern s32 func_ov046_0220c410(void *panel, s32 value);
extern void func_ov046_0220c46c(void *panel, s32 first, s32 second);
extern void func_ov046_0220bffc(void *panel, s32 primary, s32 enabled,
                                u32 secondary);
extern void func_ov038_021fd624(void *presentation);
extern s32 SpriteMotionController_BeginHitResponse(void *list, void *input, s32 first, s32 fourth);
extern s32 InventoryScroll_UpdateSelectionMovement(void *model);
extern void func_ov038_021fce04(void *node, u32 first, u32 second);
extern void func_ov038_021fd37c(void *presentation);
#ifdef __cplusplus
}
#endif

static void applySelectedRecord(void *presentation)
{
    s32 primary = func_ov038_021fd508(presentation);
    AreaInfoPanelPresentation_ShowIndex(FIELD(void *, presentation, 0x344), primary);
    void *panel = FIELD(void *, presentation, 0x340);
    s32 first = func_ov046_0220c3bc(panel, primary);
    s32 second = func_ov046_0220c410(panel, primary);
    func_ov046_0220c46c(panel, first, second);
    primary = func_ov038_021fd508(presentation);
    func_ov046_0220bffc(panel, primary, 1,
                        func_ov038_021fd540(presentation));
    func_ov038_021fd624(presentation);
}

/*
 * Drive phases +4=0..2. Phase zero starts model opening and falls through;
 * phase one waits for it, refreshing selection animation while pending; phase
 * two processes key bits 0x40/0x80, model pointer gestures using input +0x30,
 * touch-row selection, list gesture exit, and model close completion. Touching
 * a different row selects it and refreshes the panel; confirmed gesture paths
 * install address-derived callback pairs at 0x021FDCA8/0x021FDCB8. Every call
 * advances the presentation update helper. Returns zero; model, phase, UI,
 * audio/event, timer, and callback state may change.
 */
extern "C" s32 func_ov038_021fd7f8(void *presentation)
{
    void *model = FIELD(void *, presentation, 0x314);
    switch (FIELD(s32, presentation, 4)) {
    case 0:
        InventoryScroll_ResetPresentationState(model);
        FIELD(s32, presentation, 4)++;
        FIELD(s32, presentation, 8) = 0;
        /* fall through */
    case 1:
        if (!InventoryScroll_UpdateInterpolation(model)) {
            func_ov038_021fd578(presentation);
            break;
        }
        FIELD(s32, presentation, 4)++;
        FIELD(s32, presentation, 8) = 0;
        /* fall through */
    case 2: {
        InventoryScroll_SaveOrigins(model);
        u16 keys = **(u16 **)((u8 *)presentation + 0x2c);
        if (keys & 0x40) {
            InventoryScroll_MoveSelectionUp(model);
        } else if (keys & 0x80) {
            InventoryScroll_MoveSelectionDown(model);
        } else if ((FIELD(u32, presentation, 0x20) & 0x10) != 0) {
            s32 touched = func_ov038_021fd670(presentation);
            if (InventoryScroll_TestUpperArrowHold(model, (u8 *)presentation + 0x30)) {
                InventoryScroll_PageUp(model);
            } else if (InventoryScroll_TestLowerArrowHold(model, (u8 *)presentation + 0x30)) {
                InventoryScroll_PageDown(model);
            } else if ((FIELD(u32, presentation, 0x20) & 0x20) != 0) {
                if (InventoryScroll_TestUpperArrowPress(model, (u8 *)presentation + 0x30)) {
                    if (!InventoryScroll_PageUp(model)) SceneSound_PlayPackedEffect(presentation, 0x16);
                } else if (InventoryScroll_TestLowerArrowPress(model, (u8 *)presentation + 0x30)) {
                    if (!InventoryScroll_PageDown(model)) SceneSound_PlayPackedEffect(presentation, 0x16);
                } else if (InventoryScroll_TestMarkerHit(model, (u8 *)presentation + 0x30)) {
                    func_ov038_021fce04(presentation, data_ov038_021fdca8[0],
                                        data_ov038_021fdca8[1]);
                    break;
                } else if (touched >= 0) {
                    if (touched != FIELD(s32, model, 0x14)) {
                        SceneSound_PlayPackedEffect(presentation, 0);
                        InventoryScroll_SetSelectedRow(model, touched);
                        applySelectedRecord(presentation);
                    }
                } else if (SpriteMotionController_BeginHitResponse((u8 *)presentation + 0x64,
                                          (u8 *)presentation + 0x30, 0, 4)) {
                    SceneSound_PlayPackedEffect(presentation, 3);
                    func_ov038_021fce04(presentation, data_ov038_021fdcb8[0],
                                        data_ov038_021fdcb8[1]);
                }
            }
        }
        if (InventoryScroll_UpdateSelectionMovement(model)) {
            SceneSound_PlayPackedEffect(presentation, 0);
            FIELD(s32, presentation, 4)--;
            FIELD(s32, presentation, 8) = 0;
        }
        break;
    }
    }
    func_ov038_021fd37c(presentation);
    return 0;
}
