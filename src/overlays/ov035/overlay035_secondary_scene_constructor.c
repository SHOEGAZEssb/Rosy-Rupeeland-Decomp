#include "tingle/types.h"

/* Overlay 35 secondary scene construction and layered object assembly. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e18[];
extern const u8 data_ov035_02203d04[];
extern const u8 data_ov035_02203d20[];
extern const u8 data_ov035_02203d38[];
extern const u8 data_ov035_02203d40[];
extern const u8 data_ov035_02203d48[];
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_ov035_021fce00(void *object, void *argument);
extern void func_020720c0(void *state);
extern void func_ov035_021fdce8(void *record);
extern void func_020720e8(void *state, void *resourceContext, s32 first,
                         s32 second, s32 third);
extern void Graphics3DResourceOwner_PrepareResources(void *owner, void *resource);
extern void *func_02071adc(void *resourceContext, s32 resourceId);
extern void *Graphics3DResourceOwner_CreateManager(void *owner);
extern void *func_02077308(void *resourceSet, void *resource);
extern void func_ov035_021fdd28(void *record, s32 identifier, s32 value20,
                               s32 value24, s32 value28, u8 value5a,
                               u16 flags);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *func_020955d8(void *allocation, void *spriteRecord);
extern void func_02095274(void *collection, void *object);
extern void func_02094bbc(void *object, s32 x, s32 y, s32 z);
extern void *func_ov035_021fe5ec(void *object, s32 argument);
extern void *func_ov035_021fe8e4(void *object, s32 argument);
extern void func_020948d4(void *field, s32 value);
extern void *func_ov035_021fcf34(void *object, void *resource,
                                s32 resourceIndex, s32 entry);
extern void func_ov035_021fdd70(void *record, s32 x, s32 y, s32 z);
extern void func_ov035_021fdd78(void *record, s32 x, s32 y, s32 z);
extern void func_020b0300(s32 first, s32 second, s32 third, s32 fourth,
                         s32 fifth);
extern void func_02092850(s32 value);
#ifdef __cplusplus
}
#endif

/* Allocates and initializes a shared 0xA0-byte sprite object. */
static void *create_sprite(void *record)
{
    void *object = Heap_Alloc(0xa0, data_ov035_02203d20, 4, gHeapContext);
    if (object != 0)
        object = func_020955d8(object, record);
    return object;
}

/*
 * Constructs the secondary overlay-35 scene. It initializes the controller
 * base and resource states +0xCC/+0xDC/+0xE8; base field +4 variants 0xC9,
 * 0xCC, and 0xCF select the final IDs of the latter two groups. Three sprite
 * objects are created at +0xFC/+0x100/+0xD8, two transition wrappers at +0x13C
 * and +0x140, and two render objects using resource 0x5009 at +0x104/+0x108.
 * The objects are attached to collections +0x10C/+0x11C, positioned, and the
 * second render object starts with flag bits 0 and 1 set. Scene vectors and
 * global GX color state are initialized. Returns the scene; heap, resource,
 * renderer, and direct GX state change, preserving null propagation on failed
 * allocations.
 */
extern "C" void *func_ov035_021feb7c(void *scene, void *resourceOwner,
                                      void *baseArgument)
{
    func_ov035_021fce00(scene, baseArgument);
    FIELD(const void *, scene, 0) = data_ov035_02203d04;
    func_020720c0((u8 *)scene + 0xdc);
    func_020720c0((u8 *)scene + 0xe8);
    func_ov035_021fdce8((u8 *)scene + 0x10c);
    func_ov035_021fdce8((u8 *)scene + 0x11c);
    func_ov035_021fdce8((u8 *)scene + 0x12c);

    func_020720e8((u8 *)scene + 0xdc, data_020f4e18[0],
                  0x6015, 0x6016, 0x6017);
    Graphics3DResourceOwner_PrepareResources(resourceOwner, (u8 *)scene + 0xdc);
    s32 variant = FIELD(s32, scene, 4);
    s32 resourceE8 = variant == 0xcc ? 0x6073 :
                     variant == 0xcf ? 0x6074 : 0x6072;
    s32 resourceCC = variant == 0xcc ? 0x610d :
                     variant == 0xcf ? 0x6110 : 0x610a;
    func_020720e8((u8 *)scene + 0xe8, data_020f4e18[0],
                  0x6070, 0x6071, resourceE8);
    func_020720e8((u8 *)scene + 0xcc, data_020f4e18[0],
                  resourceCC - 2, resourceCC - 1, resourceCC);
    Graphics3DResourceOwner_PrepareResources(resourceOwner, (u8 *)scene + 0xe8);
    Graphics3DResourceOwner_PrepareResources(resourceOwner, (u8 *)scene + 0xcc);

    FIELD(void *, scene, 0xf4) = func_02071adc(data_020f4e18[0], 0x5009);
    FIELD(void *, scene, 0xf8) = Graphics3DResourceOwner_CreateManager(resourceOwner);
    void *record = func_02077308(FIELD(void *, scene, 0xf8),
                                  (u8 *)scene + 0xdc);
    func_ov035_021fdd28(record, 0, 0, 0, 0, 7, 0x42);
    FIELD(void *, scene, 0xfc) = create_sprite(record);
    func_02095274((u8 *)scene + 0x10c, FIELD(void *, scene, 0xfc));

    record = func_02077308(FIELD(void *, scene, 0xf8), (u8 *)scene + 0xe8);
    func_ov035_021fdd28(record, 0, 0, 0, 0, 8, 0x42);
    FIELD(void *, scene, 0x100) = create_sprite(record);
    func_02095274((u8 *)scene + 0x10c, FIELD(void *, scene, 0x100));

    record = func_02077308(FIELD(void *, scene, 0xf8), (u8 *)scene + 0xcc);
    func_ov035_021fdd28(record, 0, 0, 0, 0, 8, 0x42);
    FIELD(void *, scene, 0xd8) = create_sprite(record);
    func_02095274((u8 *)scene + 0x10c, FIELD(void *, scene, 0xd8));
    func_02094bbc(FIELD(void *, scene, 0xd8), 0, 0xe00, 0);

    void *object = Heap_Alloc(0xa0, data_ov035_02203d38, 4, gHeapContext);
    if (object != 0)
        object = func_ov035_021fe5ec(object, (s32)resourceOwner);
    FIELD(void *, scene, 0x13c) = object;
    func_02095274((u8 *)scene + 0x10c, object);
    func_02094bbc(object, 0, 0, -0x600);
    func_020948d4((u8 *)object + 0x6c, 0x12e1);

    object = Heap_Alloc(0xa0, data_ov035_02203d40, 4, gHeapContext);
    if (object != 0)
        object = func_ov035_021fe8e4(object, (s32)resourceOwner);
    FIELD(void *, scene, 0x140) = object;
    func_02095274((u8 *)scene + 0x10c, object);
    func_02094bbc(object, 0, -0x800, -0x600);

    object = Heap_Alloc(0xc4, data_ov035_02203d48, 4, gHeapContext);
    if (object != 0)
        object = func_ov035_021fcf34(object, FIELD(void *, scene, 0xf4),
                                    0, 0x15);
    FIELD(void *, scene, 0x104) = object;
    func_02095274((u8 *)scene + 0x11c, object);
    object = Heap_Alloc(0xc4, data_ov035_02203d48, 4, gHeapContext);
    if (object != 0)
        object = func_ov035_021fcf34(object, FIELD(void *, scene, 0xf4),
                                    1, 9);
    FIELD(void *, scene, 0x108) = object;
    func_02095274((u8 *)scene + 0x11c, object);
    FIELD(u16, object, 0x98) |= 2;
    FIELD(u16, object, 0x98) |= 1;

    func_ov035_021fdd70((u8 *)scene + 0x0c, 0, 0x1400, 0x2800);
    func_ov035_021fdd78((u8 *)scene + 0x0c, 0, 0, 0);
    func_020b0300(0, 0x1f, 0x7fff, 0x3f, 0);
    func_02092850(0);
    return scene;
}
