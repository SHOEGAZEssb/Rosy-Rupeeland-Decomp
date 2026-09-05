#include "tingle/types.h"

/* Overlay 36 final controller resources, scene objects, and timer setup. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov036_02205f48[];
extern const u8 data_ov036_02206160[];
extern const u8 data_ov036_022061a0[];
extern const u8 data_ov036_02206168[];
extern void *data_020f4e18;
/* The retail literal names the heap context itself, not its storage pointer. */
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_ov036_021fce00(void *controller, s32 argument);
extern void GraphicsResourceSetVariant_Init(void *resourceSet);
extern void func_ov036_021fe218(void *list);
extern void func_02091d08(void *timer);
extern void GraphicsResourceSetVariant_Load(void *resourceSet, void *archive,
                          s32 firstId, s32 secondId, s32 thirdId);
extern void Graphics3DResourceOwner_PrepareResources(void *owner, void *resourceSet);
extern void *GraphicsArchive_AcquireOwlvResource(void *archive, s32 id);
extern void *Graphics3DResourceOwner_CreateManager(void *owner);
extern void *GraphicsAnimationInstanceManager_CreateInstance(void *manager, void *resourceSet);
extern void func_ov036_021ff050(void *handle, s32 mode,
                                s32 x, s32 y, s32 z,
                                s32 byte5A, s32 flags);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *AlternateSpritePresentation_Init(void *object, void *handle);
extern void *func_ov036_02203850(void *object, void *resource);
extern void *func_ov036_021fcf34(void *object, void *resource,
                                 s32 mode, s32 type);
extern void PresentationList_Append(void *list, void *object);
extern void Presentation_SetPosition(void *object, s32 x, s32 y, s32 z);
extern void PresentationScalar_SetImmediate(void *field, s32 value);
extern void func_ov036_021fe9fc(void *record, s32 x, s32 y, s32 z);
extern void func_ov036_021fea04(void *record, s32 x, s32 y, s32 z);
extern void func_020b0300(s32, s32, s32, s32, s32);
extern void TitlePalette_SetMainBackdrop(s32 value);
extern void func_02091d24(void *timer, s32 first, s32 second,
                          s32 third, s32 fourth);
#ifdef __cplusplus
}
#endif

/*
 * Constructs the final recovered overlay-36 controller. Common argument +4
 * selects one of three +0xCC resource triples and archive objects:
 * 0x66 -> IDs 0x60F6..F8/item 0x500A, 0x69 -> 0x60F9..FB/0x500B, and
 * 0x6C -> 0x60FC..FE/0x500C. Resource +0xDC always uses IDs 0x6006..08.
 * Owner registers +0xDC and supplies manager +0xE8.
 *
 * A +0xDC handle (byte 2, flags 0x42) backs child +0xF8 at
 * (0,-0x500,-0x400). A +0xCC handle with flags 0x44 backs child +0xD8 at
 * (0,0xC00,0x1800), scale 0x666. Both enter list +0xFC. A 0x15C-byte
 * three-child object at +0xF0 uses archive item +0xEC and is positioned at
 * X=0x1000. A 0xC4 render object at +0xF4 uses mode 3/type 0xE, position
 * (0,0x300,0x800), and +0x98 bits 0/1. Controller transform +0xC starts at
 * (0,0x1400,0x2800). Common rendering is initialized and timer +0x11C is
 * configured with (0,0,1,1). Returns controller; archive/resource, manager,
 * heap, lists, transforms, renderer, and timer state change.
 */
extern "C" void *func_ov036_02203db0(void *controller, void *owner,
                                      s32 argument)
{
    func_ov036_021fce00(controller, argument);
    FIELD(const void *, controller, 0) = data_ov036_02205f48;
    GraphicsResourceSetVariant_Init((u8 *)controller + 0xdc);
    func_ov036_021fe218((u8 *)controller + 0xfc);
    func_ov036_021fe218((u8 *)controller + 0x10c);
    func_02091d08((u8 *)controller + 0x11c);
    GraphicsResourceSetVariant_Load((u8 *)controller + 0xdc, data_020f4e18,
                  0x6006, 0x6007, 0x6008);
    Graphics3DResourceOwner_PrepareResources(owner, (u8 *)controller + 0xdc);

    s32 lastId;
    s32 archiveId;
    if (FIELD(s32, controller, 4) == 0x66) {
        lastId = 0x60f8;
        archiveId = 0x500a;
    } else if (FIELD(s32, controller, 4) == 0x69) {
        lastId = 0x60fb;
        archiveId = 0x500b;
    } else {
        lastId = 0x60fe;
        archiveId = 0x500c;
    }
    GraphicsResourceSetVariant_Load((u8 *)controller + 0xcc, data_020f4e18,
                  lastId - 2, lastId - 1, lastId);
    FIELD(void *, controller, 0xec) =
        GraphicsArchive_AcquireOwlvResource(data_020f4e18, archiveId);

    FIELD(void *, controller, 0xe8) = Graphics3DResourceOwner_CreateManager(owner);
    void *handle = GraphicsAnimationInstanceManager_CreateInstance(FIELD(void *, controller, 0xe8),
                                  (u8 *)controller + 0xdc);
    func_ov036_021ff050(handle, 0, 0, 0, 0, 2, 0x42);
    void *child = Heap_Alloc(0xa0, data_ov036_02206160, 4, gHeapContext);
    if (child != 0)
        child = AlternateSpritePresentation_Init(child, handle);
    FIELD(void *, controller, 0xf8) = child;
    PresentationList_Append((u8 *)controller + 0xfc, child);
    Presentation_SetPosition(child, 0, -0x500, -0x400);

    handle = GraphicsAnimationInstanceManager_CreateInstance(FIELD(void *, controller, 0xe8),
                            (u8 *)controller + 0xcc);
    FIELD(u16, handle, 0x50) |= 0x44;
    child = Heap_Alloc(0xa0, data_ov036_02206160, 4, gHeapContext);
    if (child != 0)
        child = AlternateSpritePresentation_Init(child, handle);
    FIELD(void *, controller, 0xd8) = child;
    PresentationList_Append((u8 *)controller + 0xfc, child);
    Presentation_SetPosition(child, 0, 0xc00, 0x1800);
    PresentationScalar_SetImmediate((u8 *)child + 0x6c, 0x666);

    void *triple = Heap_Alloc(0x15c, data_ov036_022061a0, 4, gHeapContext);
    if (triple != 0)
        triple = func_ov036_02203850(
            triple, FIELD(void *, controller, 0xec));
    FIELD(void *, controller, 0xf0) = triple;
    Presentation_SetPosition(triple, 0x1000, 0, 0);

    void *renderObject =
        Heap_Alloc(0xc4, data_ov036_02206168, 4, gHeapContext);
    if (renderObject != 0)
        renderObject = func_ov036_021fcf34(
            renderObject, FIELD(void *, controller, 0xec), 3, 0xe);
    FIELD(void *, controller, 0xf4) = renderObject;
    Presentation_SetPosition(renderObject, 0, 0x300, 0x800);
    FIELD(u16, renderObject, 0x98) |= 2;
    FIELD(u16, renderObject, 0x98) |= 1;

    func_ov036_021fe9fc((u8 *)controller + 0xc, 0, 0x1400, 0x2800);
    func_ov036_021fea04((u8 *)controller + 0xc, 0, 0, 0);
    func_020b0300(0, 0x1f, 0x7fff, 0x3f, 0);
    TitlePalette_SetMainBackdrop(0);
    func_02091d24((u8 *)controller + 0x11c, 0, 0, 1, 1);
    return controller;
}
