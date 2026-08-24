#include "tingle/types.h"

/* Overlay 30 seven-slot selector widget construction and embedded base state. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e18[];
extern const s16 data_ov030_021ff708[];
extern const u8 data_ov030_021ff88c[];

#ifdef __cplusplus
extern "C" {
#endif
extern void AnimationResourceState_InitEmbedded(void *);
extern void func_02071ee0(void *, void *, s32, s32, s32);
extern void func_020708c4(void *);
extern void GraphicsSpriteState_ApplyRenderConfig(void *, s32, s32, s32, s32, s32, s32);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern void func_02091e0c(void *, s32);
extern void func_020957bc(void *);
extern void func_020957f0(void *, void *, s32, s32, s32);
extern void func_02095820(void *, s32, s32);
extern void func_02095940(void *);
extern void *ActorDescriptor_GetComponent(void *, s32);
extern s32 ActorDescriptorComponent_GetCharacterResourceId(void *);
extern s32 ActorDescriptorComponent_GetPaletteResourceId(void *);
extern s32 ActorDescriptorComponent_GetCellResourceId(void *);
extern s32 ActorDescriptorComponent_GetAnimation(void *);
extern void func_ov030_021fd260(void *);
extern void func_ov030_021fd434(void *);
#ifdef __cplusplus
}
#endif

/*
 * Constructs the selector widget from owner/font `font`, source `source`, and
 * resource variant `variant`. It initializes resource sets +4/+0x10/+0x1C,
 * controllers +0x58/+0x104, embedded state +0x1B8, and four 8-tick timers at
 * +0x1D0..+0x1E8. It records source halfword +4 and owner pointer, loads one of
 * triples 0x32A1..0x32A3 or 0x32A4..0x32A6 into +4, a source-derived triple into
 * +0x1C, and 0x42/1/0x43 into +0x10. It creates renderers +0x28/+0x2C, a source-
 * selected sprite +0x30, seven slot sprites +0x34..+0x4C positioned from table
 * 0x021FF708, two bottom sprites +0x50/+0x54, and two hidden control sprites at
 * +0x58/+0x104 with bounds (0x80,0xB0)/(0xE4,0xB0). Finally it applies initial
 * state through 0x021FD434 and returns `widget`. Resource, renderer, sprite,
 * controller, and timer SDK state change; no direct MMIO occurs.
 */
extern "C" void *func_ov030_021fcf20(void *widget, void *font,
                                      void *source, s32 variant)
{
    AnimationResourceState_InitEmbedded((u8 *)widget + 4);
    AnimationResourceState_InitEmbedded((u8 *)widget + 0x10);
    AnimationResourceState_InitEmbedded((u8 *)widget + 0x1c);
    func_020957bc((u8 *)widget + 0x58);
    func_020957bc((u8 *)widget + 0x104);
    func_ov030_021fd260((u8 *)widget + 0x1b8);
    func_02091e0c((u8 *)widget + 0x1d0, 8);
    func_02091e0c((u8 *)widget + 0x1d8, 8);
    func_02091e0c((u8 *)widget + 0x1e0, 8);
    func_02091e0c((u8 *)widget + 0x1e8, 8);
    FIELD(void *, widget, 0) = font;
    FIELD(s32, widget, 0x1b4) = FIELD(u16, source, 4);
    FIELD(s32, widget, 0x1c4) = 0;
    FIELD(s32, widget, 0x1b0) = 0;
    FIELD(void *, widget, 0x1cc) = FIELD(void *, font, 0);

    if (variant == 1)
        func_02071ee0((u8 *)widget + 4, data_020f4e18[0],
                      0x32a1, 0x32a2, 0x32a3);
    else
        func_02071ee0((u8 *)widget + 4, data_020f4e18[0],
                      0x32a4, 0x32a5, 0x32a6);

    void *sourceObject = ActorDescriptor_GetComponent(source, 0);
    s32 id0 = ActorDescriptorComponent_GetCharacterResourceId(sourceObject);
    sourceObject = ActorDescriptor_GetComponent(source, 0);
    s32 id1 = ActorDescriptorComponent_GetPaletteResourceId(sourceObject);
    sourceObject = ActorDescriptor_GetComponent(source, 0);
    s32 id2 = ActorDescriptorComponent_GetCellResourceId(sourceObject);
    func_02071ee0((u8 *)widget + 0x1c, data_020f4e18[0], id0, id1, id2);
    func_020708c4(FIELD(void *, widget, 8));
    func_02071ee0((u8 *)widget + 0x10, data_020f4e18[0], 0x42, 1, 0x43);

    FIELD(void *, widget, 0x28) = GraphicsSpriteGroupOwner_CreateGroup(font);
    FIELD(void *, widget, 0x2c) = GraphicsSpriteGroupOwner_CreateGroup(font);
    FIELD(void *, widget, 0x30) = GraphicsSpriteGroup_CreateStateFromSource(
        FIELD(void *, widget, 0x2c), (u8 *)widget + 0x1c, 2);
    sourceObject = ActorDescriptor_GetComponent(source, 0);
    GraphicsSpriteState_ApplyRenderConfig(FIELD(void *, widget, 0x30),
                  ActorDescriptorComponent_GetAnimation(sourceObject), 0x20, 0xb0, 0, 0x100, 0);

    for (s32 i = 0; i < 7; ++i) {
        void *sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, widget, 0x28),
                                     (u8 *)widget + 4, 1);
        FIELD(void *, widget, 0x34 + i * 4) = sprite;
        const s16 *entry = &data_ov030_021ff708[i * 4];
        s32 x = (entry[0] + entry[2]) / 2;
        s32 y = (entry[1] + entry[3]) / 2 + 7;
        GraphicsSpriteState_ApplyRenderConfig(sprite, 0, x, y, 1, 0, 4);
    }
    for (s32 i = 0; i < 2; ++i) {
        void *sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, widget, 0x2c),
                                     (u8 *)widget + 0x10, 1);
        FIELD(void *, widget, 0x50 + i * 4) = sprite;
        GraphicsSpriteState_ApplyRenderConfig(sprite, 0, 0x32 + i * 8, 0xb0, 0, i, 0);
    }

    void *sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, widget, 0x2c),
                                 (u8 *)widget + 0x10, 1);
    func_020957f0((u8 *)widget + 0x58, sprite, 4, 0, 0);
    func_02095820((u8 *)widget + 0x58, 0x80, 0xb0);
    func_02095940((u8 *)widget + 0x58);
    sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, widget, 0x2c),
                           (u8 *)widget + 0x10, 1);
    func_020957f0((u8 *)widget + 0x104, sprite, 6, 0, 0);
    func_02095820((u8 *)widget + 0x104, 0xe4, 0xb0);
    func_02095940((u8 *)widget + 0x104);
    func_ov030_021fd434(widget);
    return widget;
}

/*
 * Installs vtable 0x021FF88C and clears words +4/+8 in embedded state. Returns
 * void; only object memory changes and the class role remains unidentified.
 */
extern "C" void func_ov030_021fd260(void *object)
{
    FIELD(const void *, object, 0) = data_ov030_021ff88c;
    FIELD(s32, object, 4) = 0;
    FIELD(s32, object, 8) = 0;
}
