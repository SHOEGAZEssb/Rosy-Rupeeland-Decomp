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
extern void func_02094874(void *model);
extern s32 func_02093ffc(void *model);
extern void func_ov038_021fd578(void *presentation);
extern void func_02093de4(void *model);
extern void func_02093e0c(void *model);
extern void func_02093e20(void *model);
extern s32 func_ov038_021fd670(void *presentation);
extern s32 func_02094638(void *model, void *input);
extern s32 func_02094668(void *model, void *input);
extern s32 func_020945c8(void *model, void *input);
extern s32 func_02094600(void *model, void *input);
extern s32 func_02094698(void *model, void *input);
extern s32 func_02093e3c(void *model);
extern s32 func_02093e58(void *model);
extern void func_02092260(void *presentation, s32 soundOrEvent);
extern void func_02093d50(void *model, s32 selection);
extern s32 func_ov038_021fd508(void *presentation);
extern u32 func_ov038_021fd540(void *presentation);
extern void func_02028100(void *label, s32 value);
extern s32 func_ov046_0220c3bc(void *panel, s32 value);
extern s32 func_ov046_0220c410(void *panel, s32 value);
extern void func_ov046_0220c46c(void *panel, s32 first, s32 second);
extern void func_ov046_0220bffc(void *panel, s32 primary, s32 enabled,
                                u32 secondary);
extern void func_ov038_021fd624(void *presentation);
extern s32 func_02095860(void *list, void *input, s32 first, s32 fourth);
extern s32 func_02094758(void *model);
extern void func_ov038_021fce04(void *node, u32 first, u32 second);
extern void func_ov038_021fd37c(void *presentation);
#ifdef __cplusplus
}
#endif

static void applySelectedRecord(void *presentation)
{
    s32 primary = func_ov038_021fd508(presentation);
    func_02028100(FIELD(void *, presentation, 0x344), primary);
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
        func_02094874(model);
        FIELD(s32, presentation, 4)++;
        FIELD(s32, presentation, 8) = 0;
        /* fall through */
    case 1:
        if (!func_02093ffc(model)) {
            func_ov038_021fd578(presentation);
            break;
        }
        FIELD(s32, presentation, 4)++;
        FIELD(s32, presentation, 8) = 0;
        /* fall through */
    case 2: {
        func_02093de4(model);
        u16 keys = **(u16 **)((u8 *)presentation + 0x2c);
        if (keys & 0x40) {
            func_02093e0c(model);
        } else if (keys & 0x80) {
            func_02093e20(model);
        } else if ((FIELD(u32, presentation, 0x20) & 0x10) != 0) {
            s32 touched = func_ov038_021fd670(presentation);
            if (func_02094638(model, (u8 *)presentation + 0x30)) {
                func_02093e3c(model);
            } else if (func_02094668(model, (u8 *)presentation + 0x30)) {
                func_02093e58(model);
            } else if ((FIELD(u32, presentation, 0x20) & 0x20) != 0) {
                if (func_020945c8(model, (u8 *)presentation + 0x30)) {
                    if (!func_02093e3c(model)) func_02092260(presentation, 0x16);
                } else if (func_02094600(model, (u8 *)presentation + 0x30)) {
                    if (!func_02093e58(model)) func_02092260(presentation, 0x16);
                } else if (func_02094698(model, (u8 *)presentation + 0x30)) {
                    func_ov038_021fce04(presentation, data_ov038_021fdca8[0],
                                        data_ov038_021fdca8[1]);
                    break;
                } else if (touched >= 0) {
                    if (touched != FIELD(s32, model, 0x14)) {
                        func_02092260(presentation, 0);
                        func_02093d50(model, touched);
                        applySelectedRecord(presentation);
                    }
                } else if (func_02095860((u8 *)presentation + 0x64,
                                          (u8 *)presentation + 0x30, 0, 4)) {
                    func_02092260(presentation, 3);
                    func_ov038_021fce04(presentation, data_ov038_021fdcb8[0],
                                        data_ov038_021fdcb8[1]);
                }
            }
        }
        if (func_02094758(model)) {
            func_02092260(presentation, 0);
            FIELD(s32, presentation, 4)--;
            FIELD(s32, presentation, 8) = 0;
        }
        break;
    }
    }
    func_ov038_021fd37c(presentation);
    return 0;
}
