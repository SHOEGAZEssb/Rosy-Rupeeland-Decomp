#include "tingle/types.h"

/* Overlay 33 scene/controller construction and ownership setup. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_021052fc;
extern void *data_020f4e14[];
extern const u8 data_ov033_021fdeb0[];
extern const u8 data_ov033_021fdeb8[];
extern const s32 data_ov033_021fdd08[];
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void VecFx32Object_Init(void *object);
extern void func_02091b6c(void *object);
extern void TitleCharacterResourceCollection_Init(void *object);
extern void Type7Actor_EnterFlag40000State(void *activeObject);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *fontOrContext);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment,
                       void *heapContext);
extern void *func_ov033_021fce1c(void *group, void *spriteContext);
extern void func_02092814(void *owner, s32 resourceId, void *object);
extern void *TitleDialog_Init(void *dialog, void *fontOrContext, void *resource);
extern void func_ov033_021fd034(void *object, s32 first, s32 second,
                               s32 third, s32 fourth);
extern void func_ov033_021fd04c(void *object, s32 callbackWord,
                               s32 adjustmentWord);
#ifdef __cplusplus
}
#endif

/*
 * Constructs the overlay-33 scene/controller in `scene`. It initializes six
 * embedded engine objects (+0x14, +0x24, +0x4C, +0x68, +0x84, +0xA0), binds
 * the primary game object from global slot +0x2EA4, temporarily suppresses two
 * of that object's sprites via flag bit 0x10, and conditionally binds the active
 * secondary object from +0x2EA8. Secondary types 5/12 and objects carrying flag
 * 0x40000 are rejected; accepted objects receive the recovered preparation and
 * virtual-call sequence.
 *
 * The function then creates a sprite context, heap-allocates/constructs the
 * 0x134-byte nine-sprite group at +0x48, configures the primary object's fixed-
 * point coordinates, initializes resource owner +0xA0 with resource 0x7007,
 * allocates/configures a 0xEC-byte dialog at +0xC4, and installs the callback
 * pair stored at 0x021FDD08. Runtime offsets/counters +0x38..+0x44 are reset
 * (with +0x44 = -24). Returns `scene`; heap, sprite, dialog, active-object, and
 * render-resource state change, but no direct MMIO is performed.
 */
extern "C" void *func_ov033_021fd070(void *scene)
{
    void *global = data_021052fc;
    void *primary;
    void *secondary;

    VecFx32Object_Init((u8 *)scene + 0x14);
    VecFx32Object_Init((u8 *)scene + 0x24);
    func_02091b6c((u8 *)scene + 0x4c);
    func_02091b6c((u8 *)scene + 0x68);
    func_02091b6c((u8 *)scene + 0x84);
    TitleCharacterResourceCollection_Init((u8 *)scene + 0xa0);
    FIELD(s32, scene, 0x10) = 0;

    primary = FIELD(void *, (u8 *)global + 0x2000, 0xea4);
    FIELD(void *, scene, 4) = primary;
    FIELD(u16, FIELD(void *, primary, 0x54), 0x24) |= 0x10;
    FIELD(u16, FIELD(void *, primary, 0xa8), 0x24) |= 0x10;

    secondary = FIELD(void *, (u8 *)global + 0x2000, 0xea8);
    FIELD(void *, scene, 8) = secondary;
    if (secondary != 0) {
        s16 type = FIELD(s16, secondary, 0xd6);
        if (type == 5 || type == 12 ||
            (FIELD(u32, secondary, 0x268) & 0x40000) != 0) {
            secondary = 0;
            FIELD(void *, scene, 8) = 0;
        } else {
            Type7Actor_EnterFlag40000State(secondary);
            typedef void (*SecondaryMethod)(void *, s32);
            SecondaryMethod method =
                FIELD(SecondaryMethod, FIELD(void *, secondary, 0), 0x54);
            method(secondary, 0);
        }
    }

    FIELD(s32, scene, 0x38) = 0;
    FIELD(s32, scene, 0x3c) = 0;
    FIELD(s32, scene, 0x40) = 0;
    FIELD(s32, scene, 0x44) = -0x18;
    FIELD(void *, scene, 0) = GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14[0]);

    void *group = Heap_Alloc(0x134, data_ov033_021fdeb0, 4, gHeapContext);
    if (group != 0)
        group = func_ov033_021fce1c(group, FIELD(void *, scene, 0));
    FIELD(void *, scene, 0x48) = group;

    FIELD(s32, primary, 0x1c) = 0x2b0000;
    FIELD(s32, primary, 0x20) = 0x100000;
    func_02092814((u8 *)scene + 0xa0, 0x7007, primary);

    void *dialog = Heap_Alloc(0xec, data_ov033_021fdeb8, 4, gHeapContext);
    if (dialog != 0)
        dialog = TitleDialog_Init(dialog, data_020f4e14[0],
                               FIELD(void *, scene, 0xa0));
    FIELD(void *, scene, 0xc4) = dialog;
    func_ov033_021fd034(dialog, 0x10, 0x60, 0xe0, 0x40);
    FIELD(s32, dialog, 0xbc) = -2;
    FIELD(s32, dialog, 0xd0) = 0xd;
    FIELD(s32, dialog, 0xd4) = 0;
    func_ov033_021fd04c(scene, data_ov033_021fdd08[0],
                       data_ov033_021fdd08[1]);
    return scene;
}
