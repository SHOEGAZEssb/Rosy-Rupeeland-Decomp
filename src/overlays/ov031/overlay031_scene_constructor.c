#include "tingle/types.h"

/* Overlay 31 main scene and embedded input-coordinate construction. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov031_021fe774[];
extern const u8 data_ov031_021fe798[];
extern const u8 data_ov031_021fe7a0[];
extern const s32 data_ov031_021fe6f0[];
extern void *gDebugFont;
extern void *data_020f4e18[];
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02091e28(void *);
extern void func_02071ea4(void *);
extern void func_02092798(void *);
extern void func_ov031_021fce00(void *, s32, s32);
extern u32 genrand_int32(void);
extern void func_02092814(void *, s32);
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern void *func_02092cc0(void *, void *, void *);
extern void func_ov031_021fd91c(void *, s32, s32, s32, s32);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern void GraphicsSpriteGroup_ReleaseIndexedEntries(void *);
extern void func_02071ee0(void *, void *, s32, s32, s32);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void func_02073e48(void *, s32, s32, s32, s32, s32, s32);
extern void *func_ov031_021fd258(void *);
extern void func_ov031_021fdfa8(void *);
extern void func_ov031_021fd934(void *, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Initializes an embedded coordinate record with inputs `x`/`y` at +0x24/+0x28
 * and clears its live words +4/+8. Returns void; only record memory changes.
 */
extern "C" void func_ov031_021fd934(void *record, s32 x, s32 y)
{
    FIELD(s32, record, 0x24) = x;
    FIELD(s32, record, 0x28) = y;
    FIELD(s32, record, 4) = 0;
    FIELD(s32, record, 8) = 0;
}

/*
 * Constructs the main overlay-31 scene from caller-provided storage and `owner`.
 * It initializes base/vtable 0x021FE774, resource set +0x5C, graphics config +0x70,
 * a mode-0 eight-frame waveform at +0xA4, random seed +0x54C, and config entry
 * 0x7007. It allocates/configures dialog +0x98 with bounds (71,47)-(134,80),
 * creates a disabled debug-font renderer +0x58, loads resources 0x14EC..0x14EE,
 * creates sprites +0x6C/+0x68 at (38,91)/(38,109), and allocates the 0x154-byte
 * animated effect at +0x548. It then applies scene graphics setup, clears the
 * sub-engine blend register, enables scene flag 0x400, seeds coordinates from
 * 0x021FE6F0, and returns `scene`. Heap, PRNG, dialog, renderer, sprite, resource,
 * graphics SDK, and sub-engine MMIO state change.
 */
extern "C" void *func_ov031_021fd95c(void *scene, void *owner)
{
    func_02091e28(scene);
    FIELD(const void *, scene, 0) = data_ov031_021fe774;
    FIELD(void *, scene, 0x54) = owner;
    func_02071ea4((u8 *)scene + 0x5c);
    func_02092798((u8 *)scene + 0x70);
    FIELD(s32, scene, 0xa0) = 0;
    func_ov031_021fce00((u8 *)scene + 0xa4, 0, 8);
    FIELD(u32, scene, 0x54c) = 0;
    FIELD(u32, scene, 0x54c) = genrand_int32();
    func_02092814((u8 *)scene + 0x70, 0x7007);

    void *dialog = Heap_Alloc(0xec, data_ov031_021fe798, 4, gHeapContext);
    if (dialog != 0)
        dialog = func_02092cc0(dialog, gDebugFont,
                               FIELD(void *, scene, 0x70));
    FIELD(void *, scene, 0x98) = dialog;
    func_ov031_021fd91c(dialog, 0x47, 0x2f, 0x86, 0x50);
    FIELD(s32, dialog, 0xd0) = 9;
    FIELD(s32, dialog, 0xd4) = 0;
    FIELD(s32, dialog, 0xbc) = -2;

    void *renderer = GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);
    FIELD(void *, scene, 0x58) = renderer;
    GraphicsSpriteGroup_ReleaseIndexedEntries(renderer);
    func_02071ee0((u8 *)scene + 0x5c, data_020f4e18[0],
                  0x14ec, 0x14ed, 0x14ee);
    void *sprite = GraphicsSpriteGroup_CreateStateFromSource(renderer, (u8 *)scene + 0x5c, 1);
    FIELD(void *, scene, 0x6c) = sprite;
    func_02073e48(sprite, 0, 0x26, 0x5b, 0, 0, 0);
    FIELD(s32, scene, 0x94) = 4;
    sprite = GraphicsSpriteGroup_CreateStateFromSource(renderer, (u8 *)scene + 0x5c, 1);
    FIELD(void *, scene, 0x68) = sprite;
    func_02073e48(sprite, 2, 0x26, 0x6d, 0, 0, 2);
    FIELD(s32, scene, 0x9c) = 0;

    void *effect = Heap_Alloc(0x154, data_ov031_021fe7a0, 4, gHeapContext);
    if (effect != 0)
        effect = func_ov031_021fd258(effect);
    FIELD(void *, scene, 0x548) = effect;
    func_ov031_021fdfa8(scene);
    *(volatile u16 *)0x04001050 = 0;
    FIELD(u32, scene, 0x20) |= 0x400;
    func_ov031_021fd934(scene, data_ov031_021fe6f0[0],
                        data_ov031_021fe6f0[1]);
    return scene;
}
