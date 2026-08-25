#include "tingle/types.h"

/* Overlay 21 list construction plus visible-row and selected-row rendering. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct Overlay021Row {
    const void *descriptor;
    void *sprite;
    s16 x;
    s16 y;
} Overlay021Row;

extern const u8 data_021f3ecc[];
extern void *data_020f4e18[];
extern const u8 data_ov021_02202f78[];
extern const u8 data_ov021_02202f80[];
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern void MIi_CpuCopy16(const void *, void *, u32);
extern void *Heap_AllocAlternateEntry(u32, const void *, s32, void *);
extern void AnimationResourceState_InitEmbedded(void *);
extern void AnimationResourceState_ReplaceResources(void *, void *, s32, s32, s32);
extern void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern void GraphicsSpriteState_ApplyRenderConfig(void *, s32, s32, s32, s32, s32, s32);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern void GraphicsSpriteRenderer_SetFontResource(void *, void *);
extern void GraphicsSpriteRenderer_DrawText(void *, const void *, s32, s32, s32, s32, s32);
extern u32 LanguageLookupDatabase_GetResourceSize(const void *, s32);
extern const void *LanguageLookupDatabase_GetResourceById(const void *, s32);
extern void TitleCharacterResourceCollection_Init(void *);
extern void func_02092814(void *, s32);
extern s32 func_02092960(void *, s32, u32, s32, s32, s32, s32, s32);
extern void *func_02094154(void *, void *, s32, s32, s32, s32, s32);
extern void InventoryScroll_SetSpritePriority(void *, s32);
extern void InventoryScroll_UpdatePresentation(void *);
extern void GraphicsSpriteCanvas_FillRect(void *, s32, s32, s32, s32, s32);
extern void *func_020c09cc(void *, s32, s32, s32, void (*)(void *), s32);
extern void func_ov021_021fce00(void *);
extern void func_ov021_021fd224(void *);
extern Overlay021Row *func_ov021_021fd6e8(void *);
#ifdef __cplusplus
}
#endif

/*
 * Construct the list using caller font, capacity, and mode. Initialize resource
 * sets +4/+0x10 and manager +0x28; create renderers +0x1C/+0x20; copy message
 * 0x2E5 into +0x64; load resource triples 0x3D..0x3F and
 * 0x329B..0x329D; and create/configure sprite +0x24. Allocate capacity
 * 12-byte rows at +0x4C and a controller at +0x58 (mode 4, trailing -12 for a
 * nonempty list; mode 1, trailing 12 when empty), hide the widget, load manager
 * IDs 0x7007/0x7000, and return state. Heap/font/resource/sprite/list SDK state
 * changes; no direct MMIO occurs.
 */
extern "C" void *func_ov021_021fce18(void *state, void *font,
                                      s32 capacity, s32 mode)
{
    AnimationResourceState_InitEmbedded((u8 *)state + 4);
    AnimationResourceState_InitEmbedded((u8 *)state + 0x10);
    TitleCharacterResourceCollection_Init((u8 *)state + 0x28);
    FIELD(void *, state, 0) = font;
    FIELD(void *, state, 0x1c) = GraphicsSpriteGroupOwner_CreateGroup(font);
    FIELD(s32, FIELD(void *, state, 0x1c), 0x18) = 0x2c;
    FIELD(s32, FIELD(void *, state, 0x1c), 0x1c) = 0x1c;
    FIELD(void *, state, 0x20) = GraphicsSpriteGroupOwner_CreateGroup(font);

    u32 length = LanguageLookupDatabase_GetResourceSize(data_021f3ecc, 0x2e5);
    MIi_CpuCopy16(LanguageLookupDatabase_GetResourceById(data_021f3ecc, 0x2e5),
                  (u8 *)state + 0x64, length);
    AnimationResourceState_ReplaceResources((u8 *)state + 4, data_020f4e18[0], 0x3d, 0x3e, 0x3f);
    AnimationResourceState_ReplaceResources((u8 *)state + 0x10, data_020f4e18[0],
                  0x329b, 0x329c, 0x329d);
    FIELD(void *, state, 0x24) =
        GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 0x20), (u8 *)state + 4, 1);
    GraphicsSpriteState_ApplyRenderConfig(FIELD(void *, state, 0x24), 0x1c, 0x38, 0x86, 1, 0, 4);

    FIELD(s32, state, 0x60) = mode;
    FIELD(s32, state, 0x50) = capacity;
    FIELD(s32, state, 0x54) = 0;
    if (capacity != 0) {
        void *rows = Heap_AllocAlternateEntry(capacity * 12 + 8,
                                   data_ov021_02202f78, 4, gHeapContext);
        if (rows != 0)
            rows = func_020c09cc(rows, capacity, 12, 8,
                                 func_ov021_021fce00, 0);
        FIELD(void *, state, 0x4c) = rows;
    } else {
        FIELD(void *, state, 0x4c) = 0;
    }

    void *controller = Heap_Alloc(0x80, data_ov021_02202f80,
                                  4, gHeapContext);
    if (controller != 0) {
        controller = func_02094154(controller, font, capacity,
                                   capacity != 0 ? 4 : 1,
                                   0xda, 0x18, capacity != 0 ? -12 : 12);
    }
    FIELD(void *, state, 0x58) = controller;
    InventoryScroll_SetSpritePriority(controller, 0);
    InventoryScroll_UpdatePresentation(controller);
    func_ov021_021fd224(state);
    func_02092814((u8 *)state + 0x28, 0x7007);
    func_02092814((u8 *)state + 0x28, 0x7000);
    return state;
}

/*
 * Clear the list text area to 0xB0 with color 0xFF. When rows exist, choose
 * manager text source +0x28 and final color -2 for mode zero, otherwise source
 * +0x2C and color zero. Render up to four rows from controller first-visible
 * +0x0C using each descriptor's nested text at +4/+0x2C, X=0x40,
 * Y=0x13+row*24, width/style 0x0E/8, changing style to 3 when descriptor +8 is
 * null. Font/UI state changes; returns void and performs no direct MMIO.
 */
extern "C" void func_ov021_021fd39c(void *state)
{
    void *font = FIELD(void *, state, 0);
    GraphicsSpriteCanvas_FillRect(font, 0, 0, 0xff, 0xb0, 0);
    if (FIELD(s32, state, 0x54) == 0)
        return;
    s32 finalColor;
    if (FIELD(s32, state, 0x60) == 0) {
        GraphicsSpriteRenderer_SetFontResource(
            font, FIELD(void *, state, 0x28));
        finalColor = -2;
    } else {
        GraphicsSpriteRenderer_SetFontResource(
            font, FIELD(void *, state, 0x2c));
        finalColor = 0;
    }
    Overlay021Row *rows = FIELD(Overlay021Row *, state, 0x4c);
    s32 first = FIELD(s32, FIELD(void *, state, 0x58), 0xc);
    s32 i;
    for (i = 0; i < 4 && first + i < FIELD(s32, state, 0x54); i++) {
        const u8 *descriptor = (const u8 *)rows[first + i].descriptor;
        s32 style = FIELD(void *, descriptor, 8) == 0 ? 3 : 0xe;
        const u8 *record = FIELD(const u8 *, descriptor, 4);
        GraphicsSpriteRenderer_DrawText(font, record + 0x2c, 0x40, i * 0x18 + 0x13,
                      style, 8, finalColor);
    }
}

/*
 * Set visible-row sprite animations to 2 for nested record type >=2, otherwise
 * zero; clear the selected-value text area; and update the selected row sprite
 * to animation 3/1. For nested type zero with value +0x10 above one, choose
 * marker animation 0x1C/0x1D/0x1E for thresholds 100 and 10000, show marker
 * +0x24, print the value and append the cached +0x64 label. Otherwise hide the
 * marker. Sprite/font/UI state changes; returns void and performs no MMIO.
 */
extern "C" void func_ov021_021fd490(void *state)
{
    Overlay021Row *rows = FIELD(Overlay021Row *, state, 0x4c);
    void *controller = FIELD(void *, state, 0x58);
    s32 first = FIELD(s32, controller, 0xc);
    s32 i;
    for (i = 0; i < 4 && first + i < FIELD(s32, state, 0x54); i++) {
        const u8 *record = FIELD(const u8 *, rows[first + i].descriptor, 4);
        GraphicsSpriteState_SetAnimationIndex(rows[first + i].sprite,
                      FIELD(u16, record, 4) >= 2 ? 2 : 0);
    }

    void *font = FIELD(void *, state, 0);
    GraphicsSpriteCanvas_FillRect(font, 0x2a, 0x7e, 0x7a, 0x8e, 0);
    Overlay021Row *selected = func_ov021_021fd6e8(state);
    if (selected == 0) {
        FIELD(u16, FIELD(void *, state, 0x24), 0x24) |= 4;
        return;
    }
    const u8 *descriptor = (const u8 *)selected->descriptor;
    const u8 *record = FIELD(const u8 *, descriptor, 4);
    GraphicsSpriteState_SetAnimationIndex(selected->sprite, FIELD(u16, record, 4) >= 2 ? 3 : 1);
    s32 value = FIELD(s32, record, 0x10);
    if (FIELD(u16, record, 4) == 0 && value > 1) {
        s32 animation = value < 100 ? 0x1c : (value < 10000 ? 0x1d : 0x1e);
        GraphicsSpriteState_SetAnimationIndex(FIELD(void *, state, 0x24), animation);
        FIELD(u16, FIELD(void *, state, 0x24), 0x24) &= ~4;
        GraphicsSpriteRenderer_SetFontResource(
            font, FIELD(void *, state, 0x2c));
        s32 width = func_02092960(font, value, 0xff676980, 0x2a,
                                  0x7e, 0xe, 8, 0);
        GraphicsSpriteRenderer_DrawText(font, (u8 *)state + 0x64, width + 0x2e, 0x7e,
                      0xe, 4, 0);
    } else {
        FIELD(u16, FIELD(void *, state, 0x24), 0x24) |= 4;
    }
}
