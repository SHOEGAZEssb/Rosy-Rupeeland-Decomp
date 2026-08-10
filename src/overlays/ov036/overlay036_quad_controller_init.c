#include "tingle/types.h"

/* Overlay 36 four-record controller resources, geometry, and primary child. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov036_02205fb8[];
extern const u8 data_ov036_02206160[];
extern const u8 data_ov036_022056c8[];
extern void *data_020f4e18;
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_ov036_021fce00(void *controller, s32 argument);
extern void GraphicsResourceSetVariant_Init(void *resourceSet);
extern void func_ov036_021fe218(void *list);
extern void Graphics3DLightSet_Init(void *records);
extern void GraphicsResourceSetVariant_Load(void *resourceSet, void *archive,
                          s32 firstId, s32 secondId, s32 thirdId);
extern void Graphics3DResourceOwner_PrepareResources(void *owner, void *resourceSet);
extern void *func_02071adc(void *archive, s32 id);
extern void *Graphics3DResourceOwner_CreateManager(void *owner);
extern void func_ov036_021fe9fc(void *record, s32 x, s32 y, s32 z);
extern void func_ov036_021fea04(void *record, s32 x, s32 y, s32 z);
extern void func_ov036_0220213c(void *records, s32 index,
                                s32 value0, s32 value4, s32 value8,
                                s32 red, s32 green, s32 blue);
extern void *GraphicsAnimationInstanceManager_CreateInstance(void *manager, void *resourceSet);
extern void func_ov036_021ff050(void *handle, s32 mode,
                                s32 x, s32 y, s32 z,
                                s32 byte5A, s32 flags);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *func_020955d8(void *object, void *handle);
extern void func_02095274(void *list, void *object);
extern void func_02094cf0(void *object, const void *data, s32 mode);
extern void func_020b0300(s32, s32, s32, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Constructs a four-record controller. argument becomes the common base key,
 * while owner registers resource sets +0xDC, +0xE8, and inherited +0xCC.
 * +0xDC always loads IDs 0x600C..0x600E. argument values 0x64/default, 0x67,
 * and 0x6A select confirmed +0xE8 ID triples (0x607F,0x6080/82/83,0x6081)
 * and +0xCC triples 0x60ED..EF, 0x60F0..F2, or 0x60F3..F5. Resource 0x500D
 * is retained at +0xF4 and owner's manager at +0xF8.
 *
 * Transform +0xC is initialized at Z=0x2980. Four records at +0x11C receive
 * recovered corner vectors with Z=-0x1000 and red, green, blue, and white
 * 5-bit colors. A handle from +0xCC (byte 1, flags 0x46) backs a 0xA0 child at
 * +0xD8; it enters list +0xFC and receives data_ov036_022056c8 in mode one.
 * Common rendering is initialized with (0x7FFF,0x1F,0x7FFF,0x3F,0), and
 * +0x15C is cleared. Returns controller; archive/resource, manager, heap,
 * list, transform, and renderer state change.
 */
extern "C" void *func_ov036_022021b0(void *controller, void *owner,
                                      s32 argument)
{
    func_ov036_021fce00(controller, argument);
    FIELD(const void *, controller, 0) = data_ov036_02205fb8;
    GraphicsResourceSetVariant_Init((u8 *)controller + 0xdc);
    GraphicsResourceSetVariant_Init((u8 *)controller + 0xe8);
    func_ov036_021fe218((u8 *)controller + 0xfc);
    func_ov036_021fe218((u8 *)controller + 0x10c);
    Graphics3DLightSet_Init((u8 *)controller + 0x11c);

    GraphicsResourceSetVariant_Load((u8 *)controller + 0xdc, data_020f4e18,
                  0x600c, 0x600d, 0x600e);
    Graphics3DResourceOwner_PrepareResources(owner, (u8 *)controller + 0xdc);

    s32 middleId;
    s32 ccLastId;
    if (argument == 0x67) {
        middleId = 0x6082;
        ccLastId = 0x60f2;
    } else if (argument == 0x6a) {
        middleId = 0x6083;
        ccLastId = 0x60f5;
    } else {
        middleId = 0x6080;
        ccLastId = 0x60ef;
    }
    GraphicsResourceSetVariant_Load((u8 *)controller + 0xe8, data_020f4e18,
                  0x607f, middleId, 0x6081);
    GraphicsResourceSetVariant_Load((u8 *)controller + 0xcc, data_020f4e18,
                  ccLastId - 2, ccLastId - 1, ccLastId);
    Graphics3DResourceOwner_PrepareResources(owner, (u8 *)controller + 0xe8);
    Graphics3DResourceOwner_PrepareResources(owner, (u8 *)controller + 0xcc);

    FIELD(void *, controller, 0xf4) = func_02071adc(data_020f4e18, 0x500d);
    FIELD(void *, controller, 0xf8) = Graphics3DResourceOwner_CreateManager(owner);
    func_ov036_021fe9fc((u8 *)controller + 0xc, 0, 0, 0x2980);
    func_ov036_021fea04((u8 *)controller + 0xc, 0, 0, 0);
    func_ov036_0220213c((u8 *)controller + 0x11c, 0,
                        0, -0x1000, -0x1000, 0x1f, 0, 0);
    func_ov036_0220213c((u8 *)controller + 0x11c, 1,
                        0x1000, -0x1000, -0x1000, 0, 0x1f, 0);
    func_ov036_0220213c((u8 *)controller + 0x11c, 2,
                        0x1000, 0x1000, -0x1000, 0, 0, 0x1f);
    func_ov036_0220213c((u8 *)controller + 0x11c, 3,
                        0, 0, -0x1000, 0x1f, 0x1f, 0x1f);

    void *handle = GraphicsAnimationInstanceManager_CreateInstance(FIELD(void *, controller, 0xf8),
                                  (u8 *)controller + 0xcc);
    func_ov036_021ff050(handle, 0, 0, 0, 0, 1, 0x46);
    void *child = Heap_Alloc(0xa0, data_ov036_02206160, 4, gHeapContext);
    if (child != 0)
        child = func_020955d8(child, handle);
    FIELD(void *, controller, 0xd8) = child;
    func_02095274((u8 *)controller + 0xfc, child);
    func_02094cf0(child, data_ov036_022056c8, 1);
    func_020b0300(0x7fff, 0x1f, 0x7fff, 0x3f, 0);
    FIELD(s32, controller, 0x15c) = 0;
    return controller;
}
