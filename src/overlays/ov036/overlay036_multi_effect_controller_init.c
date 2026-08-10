#include "tingle/types.h"

/* Overlay 36 multi-list effect controller and resource-backed child setup. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov036_022060ec[];
extern const u8 data_ov036_02206160[];
extern const u8 data_ov036_02206168[];
extern void *data_020f4e18;
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_ov036_021fce00(void *controller, void *argument);
extern void GraphicsResourceSetVariant_Init(void *resourceSet);
extern void func_ov036_021fe218(void *list);
extern void GraphicsResourceSetVariant_Load(void *resourceSet, void *archive,
                          s32 firstId, s32 secondId, s32 thirdId);
extern void Graphics3DResourceOwner_PrepareResources(void *owner, void *resourceSet);
extern void *func_02071adc(void *archive, s32 id);
extern void *Graphics3DResourceOwner_CreateManager(void *owner);
extern void *GraphicsAnimationInstanceManager_CreateInstance(void *manager, void *resourceSet);
extern void func_ov036_021ff050(void *handle, s32 mode,
                                s32 x, s32 y, s32 z,
                                s32 byte5A, s32 flags);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *func_020955d8(void *object, void *handle);
extern void func_02094bbc(void *object, s32 x, s32 y, s32 z);
extern void func_02095274(void *list, void *object);
extern void func_020948d4(void *field, s32 value);
extern void *func_ov036_021fcf34(void *object, void *resource,
                                 s32 variant, s32 mode);
extern void func_ov036_021fe9fc(void *record, s32 x, s32 y, s32 z);
extern void func_ov036_021fea04(void *record, s32 x, s32 y, s32 z);
extern void func_020b0300(s32, s32, s32, s32, s32);
extern void func_02092850(s32 value);
#ifdef __cplusplus
}
#endif

/*
 * Constructs a multi-effect controller. argument becomes common key +4 and
 * owner receives resource triples 0x6003..0x6005 at +0xDC and 0x60C0..0x60C2
 * at inherited +0xCC. Archive entries 0x5007/+0xF0 and 0x5008/+0xF4 are
 * retained, and manager +0xE8 is derived from owner. Two manager handles create
 * 0xA0-byte children at +0xEC/+0xD8 in list +0x108. Four 0xC4-byte render
 * primitives at +0xFC/+0xF8/+0x100/+0x104 enter list +0x118 with scale 0x800;
 * +0x100 starts hidden, and key 0x25A selects variant 1 for +0xFC instead of 0.
 * Lists +0x108/+0x118/+0x128 and vector block +0xC are initialized. Finally
 * common hardware helpers receive (0x1C80,31,0x7FFF,63,0) and 0x1C80. Returns
 * controller; heap, archive/resource ownership, lists, child objects, and
 * hardware state change. Allocation use follows the original success assumption.
 */
extern "C" void *func_ov036_021ff214(void *controller, void *owner,
                                      void *argument)
{
    func_ov036_021fce00(controller, argument);
    FIELD(const void *, controller, 0) = data_ov036_022060ec;
    GraphicsResourceSetVariant_Init((u8 *)controller + 0xdc);
    func_ov036_021fe218((u8 *)controller + 0x108);
    func_ov036_021fe218((u8 *)controller + 0x118);
    func_ov036_021fe218((u8 *)controller + 0x128);

    GraphicsResourceSetVariant_Load((u8 *)controller + 0xdc, data_020f4e18,
                  0x6003, 0x6004, 0x6005);
    Graphics3DResourceOwner_PrepareResources(owner, (u8 *)controller + 0xdc);
    GraphicsResourceSetVariant_Load((u8 *)controller + 0xcc, data_020f4e18,
                  0x60c0, 0x60c1, 0x60c2);
    Graphics3DResourceOwner_PrepareResources(owner, (u8 *)controller + 0xcc);
    FIELD(void *, controller, 0xf0) = func_02071adc(data_020f4e18, 0x5007);
    FIELD(void *, controller, 0xf4) = func_02071adc(data_020f4e18, 0x5008);

    void *manager = Graphics3DResourceOwner_CreateManager(owner);
    FIELD(void *, controller, 0xe8) = manager;
    void *handle = GraphicsAnimationInstanceManager_CreateInstance(manager, (u8 *)controller + 0xdc);
    func_ov036_021ff050(handle, 0, 0, 0, 0, 2, 0x46);
    void *child = Heap_Alloc(0xa0, data_ov036_02206160, 4, gHeapContext);
    if (child != 0)
        child = func_020955d8(child, handle);
    FIELD(void *, controller, 0xec) = child;
    func_02094bbc(child, 0, 0x1400, 0);
    func_02095274((u8 *)controller + 0x108, child);

    handle = GraphicsAnimationInstanceManager_CreateInstance(manager, (u8 *)controller + 0xcc);
    func_ov036_021ff050(handle, 0, 0, 0, 0, 1, 0x46);
    FIELD(u8, handle, 0x5b) = 1;
    child = Heap_Alloc(0xa0, data_ov036_02206160, 4, gHeapContext);
    if (child != 0)
        child = func_020955d8(child, handle);
    FIELD(void *, controller, 0xd8) = child;
    func_02095274((u8 *)controller + 0x108, child);
    func_02094bbc(child, 0, 0x300, 0);
    func_020948d4((u8 *)child + 0x6c, 0x4000);

    s32 variant = FIELD(s32, controller, 4) == 0x25a ? 1 : 0;
    void *primitive = Heap_Alloc(0xc4, data_ov036_02206168, 4, gHeapContext);
    if (primitive != 0)
        primitive = func_ov036_021fcf34(primitive,
                                        FIELD(void *, controller, 0xf4),
                                        variant, 8);
    FIELD(void *, controller, 0xfc) = primitive;
    func_02095274((u8 *)controller + 0x118, primitive);
    func_020948d4((u8 *)primitive + 0x6c, 0x800);

    primitive = Heap_Alloc(0xc4, data_ov036_02206168, 4, gHeapContext);
    if (primitive != 0)
        primitive = func_ov036_021fcf34(primitive,
                                        FIELD(void *, controller, 0xf0), 2, 8);
    FIELD(void *, controller, 0xf8) = primitive;
    func_02095274((u8 *)controller + 0x118, primitive);
    func_020948d4((u8 *)primitive + 0x6c, 0x800);

    primitive = Heap_Alloc(0xc4, data_ov036_02206168, 4, gHeapContext);
    if (primitive != 0)
        primitive = func_ov036_021fcf34(primitive,
                                        FIELD(void *, controller, 0xf0), 1, 8);
    FIELD(void *, controller, 0x100) = primitive;
    func_02095274((u8 *)controller + 0x118, primitive);
    func_020948d4((u8 *)primitive + 0x6c, 0x800);
    FIELD(u16, primitive, 0x98) |= 1;

    primitive = Heap_Alloc(0xc4, data_ov036_02206168, 4, gHeapContext);
    if (primitive != 0)
        primitive = func_ov036_021fcf34(primitive,
                                        FIELD(void *, controller, 0xf0), 3, 0);
    FIELD(void *, controller, 0x104) = primitive;
    func_02095274((u8 *)controller + 0x118, primitive);
    func_020948d4((u8 *)primitive + 0x6c, 0x800);

    func_ov036_021fe9fc((u8 *)controller + 0xc, 0, 0x3c00, 0x1400);
    func_ov036_021fea04((u8 *)controller + 0xc, 0, 0, 0);
    func_020b0300(0x1c80, 0x1f, 0x7fff, 0x3f, 0);
    func_02092850(0x1c80);
    return controller;
}
