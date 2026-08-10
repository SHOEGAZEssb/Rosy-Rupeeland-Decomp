#include "tingle/types.h"

/* Overlay 20 detail-dialog construction and selection-dependent content rendering. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_020ea650[];
extern const u8 data_021f3ecc[];
extern void *data_020f4e18[];
extern const u8 data_ov020_021fe48c[];
extern const u8 data_ov020_021fe528[];
extern void *gHeapContext;
extern u8 gSystemState[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern void func_02071ea4(void *);
extern void func_02071ee0(void *, void *, s32, s32, s32);
extern void func_02071f38(void *);
extern void func_02073e48(void *, s32, s32, s32, s32, s32, s32);
extern void *func_02073ffc(void *, void *, s32);
extern void func_02074058(void *);
extern void *func_020742cc(void *);
extern void GraphicsSpriteRenderer_SetFontResource(void *, void *);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void GraphicsSpriteRenderer_DrawGlyph(void *, s32, s32, s32, s32);
extern s32 GraphicsSpriteRenderer_DrawText(void *, const void *, s32, s32, s32, s32, s32);
extern const void *func_020791e0(const void *, u16);
extern const void *func_02079f3c(const void *, u16);
extern void func_02092798(void *);
extern void func_02092814(void *, s32);
extern void func_02092960(void *, s32, s32, s32, s32, s32, s32, s32);
extern void *func_02092cc0(void *, void *, void *);
extern void func_02092e9c(void *, const void *, s32);
extern s32 func_02093360(void *, const void *);
extern void func_ov020_021fd308(void *, s32, s32, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Initialize detail-panel resources +0x10/+0x1C and manager +0x28, cache -1 at
 * +0, save font +8, create renderer +0xC, and load manager IDs 0x7000/0x7005/
 * 0x7007. Allocate/construct the 0xEC-byte dialog +0x4C using the font and the
 * manager word at +0x28, set layout 0x22/0x87/0xC0/0x30, and load resources
 * 0x4C..0x4E into +0x1C. Return state. Heap, dialog, font, graphics, and resource
 * SDK state change; no direct hardware access occurs.
 */
extern "C" void *func_ov020_021fd320(void *state, void *font)
{
    func_02071ea4((u8 *)state + 0x10);
    func_02071ea4((u8 *)state + 0x1c);
    func_02092798((u8 *)state + 0x28);
    FIELD(s32, state, 0) = -1;
    FIELD(void *, state, 8) = font;
    FIELD(void *, state, 0xc) = func_020742cc(font);
    func_02092814((u8 *)state + 0x28, 0x7000);
    func_02092814((u8 *)state + 0x28, 0x7005);
    func_02092814((u8 *)state + 0x28, 0x7007);

    void *dialog = Heap_Alloc(0xec, data_ov020_021fe528, 4, gHeapContext);
    if (dialog != 0)
        dialog = func_02092cc0(dialog, font, FIELD(void *, state, 0x28));
    FIELD(void *, state, 0x4c) = dialog;
    func_ov020_021fd308(dialog, 0x22, 0x87, 0xc0, 0x30);
    func_02071ee0((u8 *)state + 0x1c, data_020f4e18[0],
                  0x4c, 0x4d, 0x4e);
    return state;
}

/* Create one icon sprite with fixed mode 1 and zero trailing values. */
static void createQuantitySprite(void *state, s32 animation, s32 x, s32 y)
{
    void *sprite = func_02073ffc(FIELD(void *, state, 0xc),
                                 (u8 *)state + 0x1c, 1);
    func_02073e48(sprite, animation, x, y, 1, 0, 0);
}

/*
 * Render table entry selection*0x18 from data_020EA650. When selection differs
 * from cache +0, clear resources +0x10 and renderer +0xC, load entry resource
 * IDs +2/+4/+6, create a header sprite, then express each signed quantity byte
 * +9..+B as groups of 8/4/1 using three animation variants and X advances
 * 64/32/8 across rows Y=0x52/0x62/0x72. Render localized entry labels +0xC/
 * +0xE, a system-state-clamped (0..5) 16-byte label from 0x021FE48C, two numeric
 * values around separator glyph 15, and submit localized dialog text +0x10 in
 * mode 1. Return the dialog update result from 0x02093360. The third caller
 * argument is unused. Renderer, resource, font, sprite, and dialog SDK state
 * may change; no direct hardware access occurs. Styling constants are retained
 * without speculative semantic names.
 */
extern "C" s32 func_ov020_021fd44c(void *state, s32 selection, void *unused)
{
    (void)unused;
    GraphicsSpriteRenderer_ClearTextBuffer(FIELD(void *, state, 8));
    const u8 *entry;
    if (FIELD(s32, state, 0) != selection) {
        FIELD(s32, state, 0) = -1;
        func_02071f38((u8 *)state + 0x10);
        func_02074058(FIELD(void *, state, 0xc));
        entry = data_020ea650 + selection * 0x18;
        FIELD(s32, state, 0) = selection;
        func_02071ee0((u8 *)state + 0x10, data_020f4e18[0],
                      FIELD(u16, entry, 2), FIELD(u16, entry, 4),
                      FIELD(u16, entry, 6));
        void *header = func_02073ffc(FIELD(void *, state, 0xc),
                                     (u8 *)state + 0x10, 2);
        func_02073e48(header, 3, 0x30, 0x28, 2, 0, 0);

        for (s32 row = 0; row < 3; row++) {
            s32 quantity = FIELD(s8, entry, 9 + row);
            s32 groups8 = quantity / 8;
            s32 x = 0x40;
            s32 animation = row * 3;
            for (s32 i = 0; i < groups8; i++) {
                createQuantitySprite(state, animation + 2,
                                     x, 0x52 + row * 0x10);
                x += 0x40;
            }
            quantity -= groups8 * 8;
            s32 groups4 = quantity / 4;
            for (s32 i = 0; i < groups4; i++) {
                createQuantitySprite(state, animation + 1,
                                     x, 0x52 + row * 0x10);
                x += 0x20;
            }
            quantity -= groups4 * 4;
            for (s32 i = 0; i < quantity; i++) {
                createQuantitySprite(state, animation,
                                     x, 0x52 + row * 0x10);
                x += 8;
            }
        }
    } else {
        entry = data_020ea650 + selection * 0x18;
    }

    s32 firstY = gSystemState[0x5f] == 0 ? 0x18 : 0x16;
    s32 firstSpacing = gSystemState[0x5f] == 0 ? 8 : 4;
    GraphicsSpriteRenderer_SetFontResource(FIELD(void *, state, 8), (u8 *)state + 0x2c);
    const void *text = func_020791e0(data_021f3ecc, FIELD(u16, entry, 0xe));
    GraphicsSpriteRenderer_DrawText(FIELD(void *, state, 8), text, 0x60, firstY,
                  14, firstSpacing, 0);

    GraphicsSpriteRenderer_SetFontResource(FIELD(void *, state, 8), (u8 *)state + 0x30);
    text = func_02079f3c(data_021f3ecc, FIELD(u16, entry, 0xc));
    GraphicsSpriteRenderer_DrawText(FIELD(void *, state, 8), (u8 *)text + 2,
                  0x60, 0x28, 13, 8, -1);

    s32 systemIndex = gSystemState[0x5f];
    if (systemIndex >= 6)
        systemIndex = 5;
    GraphicsSpriteRenderer_SetFontResource(FIELD(void *, state, 8), (u8 *)state + 0x28);
    s32 width = GraphicsSpriteRenderer_DrawText(FIELD(void *, state, 8),
                              data_ov020_021fe48c + systemIndex * 0x10,
                              0xa8, 0x3c, 14, 6, 0);
    s32 numberX = 0xa8 + width;
    func_02092960(FIELD(void *, state, 8), FIELD(s8, entry, 8),
                  10, numberX + 6, 0x3c, 14, -8, 1);
    GraphicsSpriteRenderer_DrawGlyph(FIELD(void *, state, 8), 15,
                  numberX + 0x16, 0x3c, 14);
    func_02092960(FIELD(void *, state, 8), 30,
                  10, numberX + 0x1e, 0x3c, 14, -8, 1);

    GraphicsSpriteRenderer_SetFontResource(FIELD(void *, state, 8), (u8 *)state + 0x28);
    text = func_020791e0(data_021f3ecc, FIELD(u16, entry, 0x10));
    func_02092e9c(FIELD(void *, state, 0x4c), text, 1);
    return func_02093360(FIELD(void *, state, 0x4c), 0);
}
