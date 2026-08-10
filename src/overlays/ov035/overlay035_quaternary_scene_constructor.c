#include "tingle/types.h"

/* Overlay 35 quaternary scene construction and mixed sprite/model assembly. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e18[];
extern const u8 data_ov035_02203c78[];
extern const u8 data_ov035_02203d20[];
extern const u8 data_ov035_02203d48[];
extern const u8 data_ov035_02203d58[];
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_ov035_021fce00(void *object, void *argument);
extern void func_020720c0(void *state);
extern void Graphics3DLightSet_Init(void *records);
extern void func_ov035_021fdce8(void *collection);
extern void func_020720e8(void *state, void *resourceContext, s32 first,
                         s32 second, s32 third);
extern void func_020779ac(void *owner, void *resource);
extern void *func_02071adc(void *resourceContext, s32 resourceId);
extern void *func_02077624(void *owner);
extern void *func_02077308(void *resourceSet, void *resource);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *func_020955d8(void *allocation, void *spriteRecord);
extern void func_02095274(void *collection, void *object);
extern void func_02094bbc(void *object, s32 x, s32 y, s32 z);
extern void *func_ov035_021fcf34(void *object, void *resource, s32 index,
                                s32 entry);
extern void func_020948d4(void *field, s32 value);
extern void *func_02094ad4(void *object);
extern void func_020948e4(void *field, s32 mode, s32 value);
extern void func_ov035_021fdd70(void *record, s32 x, s32 y, s32 z);
extern void func_ov035_021fdd78(void *record, s32 x, s32 y, s32 z);
extern void func_ov035_021ffec4(void *records, s32 index, s32 value8,
                               s32 valuec, s32 value10, s32 red, s32 green,
                               s32 blue);
extern void func_020b0300(s32 first, s32 second, s32 third, s32 fourth,
                         s32 fifth);
extern void func_02092850(s32 value);
#ifdef __cplusplus
}
#endif

/* Loads a consecutive three-ID resource group and registers it with owner. */
static void load_group(void *scene, s32 offset, s32 finalId,
                       void *resourceOwner)
{
    void *state = (u8 *)scene + offset;
    func_020720e8(state, data_020f4e18[0],
                  finalId - 2, finalId - 1, finalId);
    func_020779ac(resourceOwner, state);
}

/*
 * Creates one sprite from the requested resource state. The record flags are
 * ORed rather than replaced because func_02077308 supplies persistent flags.
 * The allocation is attached even when allocation or construction returns
 * null, matching the original scene-assembly control flow.
 */
static void *create_sprite(void *scene, s32 resourceOffset, u16 flags,
                           u8 value5a, s32 z)
{
    void *record = func_02077308(FIELD(void *, scene, 0x104),
                                  (u8 *)scene + resourceOffset);
    FIELD(u16, record, 0x50) |= flags;
    if (value5a != 0)
        FIELD(u8, record, 0x5a) = value5a;
    void *object = Heap_Alloc(0xa0, data_ov035_02203d20, 4, gHeapContext);
    if (object != 0)
        object = func_020955d8(object, record);
    func_02095274((u8 *)scene + 0x160, object);
    if (z != 0)
        func_02094bbc(object, 0, 0, z);
    return object;
}

/*
 * Creates one 0xC4-byte render object from resource +0x100, attaches it to
 * collection +0x170, positions it on the Y axis, and sets field +0x6C to
 * 0x800 through the SDK tween/value helper. Returns the resulting object.
 */
static void *create_model(void *scene, s32 index, s32 y)
{
    void *object = Heap_Alloc(0xc4, data_ov035_02203d48, 4, gHeapContext);
    if (object != 0)
        object = func_ov035_021fcf34(object, FIELD(void *, scene, 0x100),
                                    index, 0x17);
    func_02095274((u8 *)scene + 0x170, object);
    func_02094bbc(object, 0, y, 0);
    func_020948d4((u8 *)object + 0x6c, 0x800);
    return object;
}

/*
 * Constructs the quaternary overlay-35 scene. It initializes resource states
 * +0xDC/+0xE8/+0xF4, embedded records +0x120, and collections +0x160/+0x170.
 * Base field +4 values 0x12C, 0x12F, and 0x132 select the +0xCC resource group
 * and the first model index; unknown values follow the 0x12C/default branch.
 * Three sprites, three render objects, and one generic animated object are
 * allocated and attached. It also initializes scene vectors, the first color
 * record, and global GX state. Returns scene; resource, heap, renderer, and GX
 * state are observably changed. Null allocations deliberately propagate into
 * later attachment/setup calls as in the original binary.
 */
extern "C" void *func_ov035_021fff38(void *scene, void *resourceOwner,
                                      void *baseArgument)
{
    func_ov035_021fce00(scene, baseArgument);
    FIELD(const void *, scene, 0) = data_ov035_02203c78;
    func_020720c0((u8 *)scene + 0xdc);
    func_020720c0((u8 *)scene + 0xe8);
    func_020720c0((u8 *)scene + 0xf4);
    Graphics3DLightSet_Init((u8 *)scene + 0x120);
    func_ov035_021fdce8((u8 *)scene + 0x160);
    func_ov035_021fdce8((u8 *)scene + 0x170);
    FIELD(s32, scene, 0xc0) = 1;

    load_group(scene, 0xdc, 0x6044, resourceOwner);
    load_group(scene, 0xe8, 0x6047, resourceOwner);

    s32 modelIndex;
    s32 finalId;
    switch (FIELD(s32, scene, 4)) {
    case 0x12f:
        finalId = 0x60e9;
        modelIndex = 2;
        break;
    case 0x132:
        finalId = 0x60ec;
        modelIndex = 3;
        break;
    case 0x12c:
    default:
        finalId = 0x60e6;
        modelIndex = 4;
        break;
    }
    load_group(scene, 0xcc, finalId, resourceOwner);
    load_group(scene, 0xf4, 0x6041, resourceOwner);

    FIELD(void *, scene, 0x100) = func_02071adc(data_020f4e18[0], 0x500e);
    FIELD(void *, scene, 0x104) = func_02077624(resourceOwner);
    FIELD(void *, scene, 0x108) = create_sprite(scene, 0xdc, 0x42, 0, -0x300);
    FIELD(void *, scene, 0x10c) = create_sprite(scene, 0xf4, 0x42, 0, -0x400);
    FIELD(void *, scene, 0xd8) = create_sprite(scene, 0xcc, 0x46, 2, 0);

    FIELD(void *, scene, 0x114) = create_model(scene, modelIndex, 0x1000);
    FIELD(void *, scene, 0x118) = create_model(scene, 0, 0x1000);
    FIELD(void *, scene, 0x11c) = create_model(scene, 1, -0x1000);

    void *animated = Heap_Alloc(0x9c, data_ov035_02203d58, 4, gHeapContext);
    if (animated != 0)
        animated = func_02094ad4(animated);
    FIELD(void *, scene, 0x110) = animated;
    func_02095274((u8 *)scene + 0x160, animated);
    func_02094bbc(animated, 0, 0, 0x1c00);
    func_020948e4((u8 *)animated + 0x2c, 2, 0x2800);
    FIELD(s32, animated, 0x7c) = 0xf0;
    FIELD(s32, animated, 0x80) = 0;

    func_ov035_021fdd70((u8 *)scene + 0x0c, 0, 0, 0x1800);
    func_ov035_021fdd78((u8 *)scene + 0x0c, 0, 0, 0);
    func_ov035_021ffec4((u8 *)scene + 0x120, 0, 0x800, 0, -0x1000,
                        0x1f, 0x1f, 0x1f);
    func_020b0300(0, 0x1f, 0x7fff, 0x3f, 0);
    func_02092850(0);
    return scene;
}
