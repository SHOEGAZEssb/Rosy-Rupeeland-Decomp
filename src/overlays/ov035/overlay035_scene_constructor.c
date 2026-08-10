#include "tingle/types.h"

/* Overlay 35 scene-owner construction and graphics-object assembly. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e18[];
extern const u8 data_ov035_02203b98[];
extern const u8 data_ov035_02203d20[];
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_ov035_021fce00(void *object, void *argument);
extern void func_020720c0(void *state);
extern void func_ov035_021fdce8(void *record);
extern void func_02091b6c(void *state);
extern void func_02091d08(void *state);
extern void func_020720e8(void *state, void *resourceContext, s32 first,
                         s32 second, s32 third);
extern void Graphics3DResourceOwner_PrepareResources(void *owner, void *resource);
extern void *Graphics3DResourceOwner_CreateManager(void *owner);
extern void *GraphicsAnimationInstanceManager_CreateInstance(void *resourceSet, void *resource);
extern void func_ov035_021fdd28(void *record, s32 identifier, s32 value20,
                               s32 value24, s32 value28, u8 value5a,
                               u16 flags);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *func_020955d8(void *allocation, void *spriteRecord);
extern void func_02095274(void *collection, void *object);
extern void func_02094bbc(void *object, s32 x, s32 y, s32 z);
extern void func_020948d4(void *field, s32 value);
extern void func_ov035_021fdd70(void *record, s32 x, s32 y, s32 z);
extern void func_ov035_021fdd78(void *record, s32 x, s32 y, s32 z);
extern void func_020b0300(s32 first, s32 second, s32 third, s32 fourth,
                         s32 fifth);
extern void func_02092850(s32 value);
extern void func_02091d24(void *state, s32 first, s32 second, s32 third,
                         s32 fourth);
#ifdef __cplusplus
}
#endif

/*
 * Constructs the overlay-35 scene owner. It initializes the input-controller
 * base with the base argument, retains the resource owner while loading groups
 * into +0xCC/+0xDC/+0xE8/+0xF4, and selects the +0xCC/+0xE8 resource IDs from
 * base field +4 values 0xC8, 0xCB, or 0xCE. Three sprite records are resolved;
 * corresponding 0xA0-byte animated objects are allocated at +0x104/+0x108/
 * +0xD8, attached to collection +0x10C, and positioned. It also initializes
 * vectors +0x0C, global GX color state, and controller +0x138. Returns the
 * owner. Heap, resource, renderer, and direct GX state change; allocation
 * failures are passed onward as in the binary.
 */
extern "C" void *func_ov035_021fdd88(void *owner, void *resourceOwner,
                                      void *baseArgument)
{
    func_ov035_021fce00(owner, baseArgument);
    FIELD(const void *, owner, 0) = data_ov035_02203b98;
    func_020720c0((u8 *)owner + 0xdc);
    func_020720c0((u8 *)owner + 0xe8);
    func_020720c0((u8 *)owner + 0xf4);
    func_ov035_021fdce8((u8 *)owner + 0x10c);
    func_02091b6c((u8 *)owner + 0x11c);
    func_02091d08((u8 *)owner + 0x138);

    func_020720e8((u8 *)owner + 0xdc, data_020f4e18[0],
                  0x603c, 0x603d, 0x603e);
    Graphics3DResourceOwner_PrepareResources(resourceOwner, (u8 *)owner + 0xdc);

    s32 variant = FIELD(s32, owner, 4);
    s32 resourceE8 = variant == 0xcb ? 0x6069 :
                     variant == 0xce ? 0x606a : 0x6068;
    s32 resourceCC = variant == 0xcb ? 0x60e0 :
                     variant == 0xce ? 0x60e3 : 0x60dd;
    func_020720e8((u8 *)owner + 0xe8, data_020f4e18[0],
                  0x6066, 0x6067, resourceE8);
    func_020720e8((u8 *)owner + 0xcc, data_020f4e18[0],
                  resourceCC - 2, resourceCC - 1, resourceCC);
    Graphics3DResourceOwner_PrepareResources(resourceOwner, (u8 *)owner + 0xe8);

    func_020720e8((u8 *)owner + 0xf4, data_020f4e18[0],
                  0x6084, 0x6085, 0x6086);
    Graphics3DResourceOwner_PrepareResources(resourceOwner, (u8 *)owner + 0xf4);
    FIELD(void *, owner, 0x100) = Graphics3DResourceOwner_CreateManager(resourceOwner);

    void *record = GraphicsAnimationInstanceManager_CreateInstance(FIELD(void *, owner, 0x100),
                                  (u8 *)owner + 0xdc);
    func_ov035_021fdd28(record, 0, 0, 0, 0, 7, 0x42);
    void *object = Heap_Alloc(0xa0, data_ov035_02203d20, 4, gHeapContext);
    if (object != 0)
        object = func_020955d8(object, record);
    FIELD(void *, owner, 0x104) = object;
    func_02095274((u8 *)owner + 0x10c, object);
    func_02094bbc(object, 0, 0x1600, 0);

    record = GraphicsAnimationInstanceManager_CreateInstance(FIELD(void *, owner, 0x100),
                           (u8 *)owner + 0xe8);
    func_ov035_021fdd28(record, 0, 0, 0, 0, 8, 0x42);
    object = Heap_Alloc(0xa0, data_ov035_02203d20, 4, gHeapContext);
    if (object != 0)
        object = func_020955d8(object, record);
    FIELD(void *, owner, 0x108) = object;
    func_02095274((u8 *)owner + 0x10c, object);
    func_02094bbc(object, 0, 0, 0);

    record = GraphicsAnimationInstanceManager_CreateInstance(FIELD(void *, owner, 0x100),
                           (u8 *)owner + 0xcc);
    FIELD(u16, record, 0x50) |= 0x44;
    FIELD(u8, record, 0x5b) = 1;
    object = Heap_Alloc(0xa0, data_ov035_02203d20, 4, gHeapContext);
    if (object != 0)
        object = func_020955d8(object, record);
    FIELD(void *, owner, 0xd8) = object;
    func_02095274((u8 *)owner + 0x10c, object);
    func_02094bbc(object, 0, 0x0c00, 0);
    func_020948d4((u8 *)object + 0x6c, 0x0e66);

    func_ov035_021fdd70((u8 *)owner + 0x0c, 0, 0x1400, 0x2800);
    func_ov035_021fdd78((u8 *)owner + 0x0c, 0, 0, 0);
    func_020b0300(0x7fff, 0x1f, 0x7fff, 0x3f, 0);
    func_02092850(0x7fff);
    func_02091d24((u8 *)owner + 0x138, 0, 0, 1, 1);
    return owner;
}
