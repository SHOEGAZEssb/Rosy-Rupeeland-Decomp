#include "tingle/types.h"

/* Overlay 36 orbit-controller resources, manager handles, and child construction. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov036_02206060[];
extern const u8 data_ov036_02206160[];
extern const u8 data_ov036_02206170[];
extern void *data_020f4e18;
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_ov036_021fce00(void *controller, void *argument);
extern void GraphicsResourceSetVariant_Init(void *resourceSet);
extern void func_ov036_021fe218(void *list);
extern void func_02091d08(void *state);
extern void GraphicsResourceSetVariant_Load(void *resourceSet, void *archive,
                          s32 firstId, s32 secondId, s32 thirdId);
extern void Graphics3DResourceOwner_PrepareResources(void *owner, void *resourceSet);
extern void *Graphics3DResourceOwner_CreateManager(void *owner);
extern void func_ov036_021fe9fc(void *record, s32 x, s32 y, s32 z);
extern void func_ov036_021fea04(void *record, s32 x, s32 y, s32 z);
extern void *GraphicsAnimationInstanceManager_CreateInstance(void *manager, void *resourceSet);
extern void func_ov036_021ff050(void *handle, s32 mode,
                                s32 x, s32 y, s32 z,
                                s32 byte5A, s32 flags);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *AlternateSpritePresentation_Init(void *object, void *handle);
extern void PresentationList_Append(void *list, void *object);
extern void PresentationScalar_SetImmediate(void *field, s32 value);
extern void *func_ov036_021fffa4(void *object, void *owner);
extern void Presentation_SetPosition(void *object, s32 x, s32 y, s32 z);
#ifdef __cplusplus
}
#endif

/*
 * Constructs an orbit controller. argument becomes common key +4; owner gets
 * archive triples 0x6003..05 (+0xE8), 0x6039..3B (+0xDC), 0x605A..5C (+0xF4),
 * and 0x60C3..C5 (inherited +0xCC). Manager +0x100 creates one handle-backed
 * child +0x104 from +0xE8, five children +0x108..+0x118 from +0xF4 with handle
 * bytes 3..7, and child +0xD8 from +0xCC; all enter list +0x11C and use scale
 * 0xCCD. A secondary resource object +0x144 also enters that list at Z=-0x600.
 * Vector block +0xC is (0,0,0x2000)/(0,0,0), and state +0x12C is initialized.
 * Returns controller; archive/resource ownership, manager, heap, handles, list,
 * transforms, and controller state change. Later uses preserve the original
 * assumption that the allocations succeed.
 */
extern "C" void *func_ov036_0220059c(void *controller, void *owner,
                                      void *argument)
{
    func_ov036_021fce00(controller, argument);
    FIELD(const void *, controller, 0) = data_ov036_02206060;
    GraphicsResourceSetVariant_Init((u8 *)controller + 0xdc);
    GraphicsResourceSetVariant_Init((u8 *)controller + 0xe8);
    GraphicsResourceSetVariant_Init((u8 *)controller + 0xf4);
    func_ov036_021fe218((u8 *)controller + 0x11c);
    func_02091d08((u8 *)controller + 0x12c);

    GraphicsResourceSetVariant_Load((u8 *)controller + 0xe8, data_020f4e18,
                  0x6003, 0x6004, 0x6005);
    Graphics3DResourceOwner_PrepareResources(owner, (u8 *)controller + 0xe8);
    GraphicsResourceSetVariant_Load((u8 *)controller + 0xdc, data_020f4e18,
                  0x6039, 0x603a, 0x603b);
    Graphics3DResourceOwner_PrepareResources(owner, (u8 *)controller + 0xdc);
    GraphicsResourceSetVariant_Load((u8 *)controller + 0xf4, data_020f4e18,
                  0x605a, 0x605b, 0x605c);
    Graphics3DResourceOwner_PrepareResources(owner, (u8 *)controller + 0xf4);
    FIELD(void *, controller, 0x100) = Graphics3DResourceOwner_CreateManager(owner);
    GraphicsResourceSetVariant_Load((u8 *)controller + 0xcc, data_020f4e18,
                  0x60c3, 0x60c4, 0x60c5);
    Graphics3DResourceOwner_PrepareResources(owner, (u8 *)controller + 0xcc);
    func_ov036_021fe9fc((u8 *)controller + 0xc, 0, 0, 0x2000);
    func_ov036_021fea04((u8 *)controller + 0xc, 0, 0, 0);

    void *handle = GraphicsAnimationInstanceManager_CreateInstance(FIELD(void *, controller, 0x100),
                                  (u8 *)controller + 0xe8);
    func_ov036_021ff050(handle, 0, 0, 0, 0, 2, 0x46);
    void *child = Heap_Alloc(0xa0, data_ov036_02206160, 4, gHeapContext);
    if (child != 0)
        child = AlternateSpritePresentation_Init(child, handle);
    FIELD(void *, controller, 0x104) = child;
    PresentationList_Append((u8 *)controller + 0x11c, child);
    PresentationScalar_SetImmediate((u8 *)child + 0x6c, 0xccd);

    for (s32 i = 0; i < 5; ++i) {
        handle = GraphicsAnimationInstanceManager_CreateInstance(FIELD(void *, controller, 0x100),
                               (u8 *)controller + 0xf4);
        func_ov036_021ff050(handle, 0, 0, 0, 0, i + 3, 0x46);
        child = Heap_Alloc(0xa0, data_ov036_02206160, 4, gHeapContext);
        if (child != 0)
            child = AlternateSpritePresentation_Init(child, handle);
        FIELD(void *, controller, 0x108 + i * 4) = child;
        PresentationList_Append((u8 *)controller + 0x11c, child);
        PresentationScalar_SetImmediate((u8 *)child + 0x6c, 0xccd);
    }

    child = Heap_Alloc(0xa0, data_ov036_02206170, 4, gHeapContext);
    if (child != 0)
        child = func_ov036_021fffa4(child, owner);
    FIELD(void *, controller, 0x144) = child;
    PresentationList_Append((u8 *)controller + 0x11c, child);
    Presentation_SetPosition(child, 0, 0, -0x600);

    handle = GraphicsAnimationInstanceManager_CreateInstance(FIELD(void *, controller, 0x100),
                            (u8 *)controller + 0xcc);
    func_ov036_021ff050(handle, 0, 0, 0, 0, 1, 0x46);
    FIELD(u8, handle, 0x5b) = 1;
    child = Heap_Alloc(0xa0, data_ov036_02206160, 4, gHeapContext);
    if (child != 0)
        child = AlternateSpritePresentation_Init(child, handle);
    FIELD(void *, controller, 0xd8) = child;
    PresentationList_Append((u8 *)controller + 0x11c, child);
    Presentation_SetPosition(child, 0, 0xba0, 0);
    PresentationScalar_SetImmediate((u8 *)child + 0x6c, 0xccd);
    return controller;
}
