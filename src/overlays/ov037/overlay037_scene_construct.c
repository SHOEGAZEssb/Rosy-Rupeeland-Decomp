#include "tingle/types.h"

/* Overlay 37 main scene construction, resource binding, and child-object population. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov037_021fedd0[];
extern const u8 data_ov037_021feeb0[];
extern const u8 data_ov037_021feeb8[];
extern void *data_020f4e18[];
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_ov037_021fce00(void *scene);
extern void GraphicsResourceSetVariant_Init(void *state);
extern void *func_ov037_021fd6d0(void *container);
extern void Graphics3DLightSet_Init(void *state);
extern void TitleInterpolatedValue_Init(void *timer);
extern void GraphicsResourceSetVariant_Load(void *slot, void *archive, s32 id0, s32 id1, s32 id2);
extern void Graphics3DResourceOwner_PrepareResources(void *owner, void *slot);
extern void *GraphicsArchive_AcquireOwlvResource(void *archive, s32 resourceId);
extern void *Graphics3DResourceOwner_CreateManager(void *owner);
extern void *GraphicsAnimationInstanceManager_CreateInstance(void *resourceOwner, void *slot);
extern void func_ov037_021fd710(void *actor, s32 mode, s32 x, s32 y,
                                s32 z, u8 parameter, u16 flags);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *func_ov037_021fd5ac(void *controller, void *argument, void *actor);
extern void PresentationList_Append(void *container, void *object);
extern void *AlternateSpritePresentation_Init(void *object, void *actor);
extern void *func_ov037_021fd22c(void *object, void *owner);
extern void *func_ov037_021fd1cc(void *object);
extern void func_ov037_021fd758(void *record, s32 a, s32 b, s32 c);
extern void func_ov037_021fd760(void *record, s32 a, s32 b, s32 c);
extern void func_ov037_021fd770(void *table, s32 index, s32 a, s32 b,
                                s32 c, u32 field0, u32 field1, u32 field2);
extern void func_020b0300(s32 a, s32 b, s32 c, s32 d, s32 e);
extern void TitlePalette_SetMainBackdrop(s32 mode);
#ifdef __cplusplus
}
#endif

static void initResourceSlot(void *scene, void *owner, u32 offset, s32 finalId)
{
    void *slot = (u8 *)scene + offset;
    GraphicsResourceSetVariant_Load(slot, data_020f4e18[0], finalId - 2, finalId - 1, finalId);
    Graphics3DResourceOwner_PrepareResources(owner, slot);
}

/*
 * Constructs the overlay's main scene around owner. It initializes the input
 * controller base, six embedded resource slots (+0xC8..+0x104), two child
 * containers, a four-entry record table, three timers, and six resource IDs
 * 0x6048..0x60BF. It then obtains actor handles, allocates five child objects
 * at +0x118..+0x128, registers them in +0x12C, initializes base transform and
 * slot 0, and establishes global geometry state. Returns scene; heap, archive,
 * actor, renderer, and global graphics state all change. Allocation failures
 * are retained as null and still passed to the recovered container registrar,
 * matching the original control flow.
 */
extern "C" void *func_ov037_021fd7e4(void *scene, void *owner)
{
    func_ov037_021fce00(scene);
    FIELD(const void *, scene, 0) = data_ov037_021fedd0;

    const u32 slotOffsets[6] = {0xc8, 0xd4, 0xe0, 0xec, 0xf8, 0x104};
    for (s32 i = 0; i < 6; ++i)
        GraphicsResourceSetVariant_Init((u8 *)scene + slotOffsets[i]);
    func_ov037_021fd6d0((u8 *)scene + 0x12c);
    func_ov037_021fd6d0((u8 *)scene + 0x13c);
    Graphics3DLightSet_Init((u8 *)scene + 0x14c);
    TitleInterpolatedValue_Init((u8 *)scene + 0x18c);
    TitleInterpolatedValue_Init((u8 *)scene + 0x1a8);
    TitleInterpolatedValue_Init((u8 *)scene + 0x1c4);

    initResourceSlot(scene, owner, 0xc8, 0x604a);
    initResourceSlot(scene, owner, 0xd4, 0x6050);
    initResourceSlot(scene, owner, 0xe0, 0x60bf);
    initResourceSlot(scene, owner, 0xec, 0x6056);
    initResourceSlot(scene, owner, 0xf8, 0x6059);
    initResourceSlot(scene, owner, 0x104, 0x604d);

    FIELD(void *, scene, 0x110) = GraphicsArchive_AcquireOwlvResource(data_020f4e18[0], 0x5010);
    void *resourceOwner = Graphics3DResourceOwner_CreateManager(owner);
    FIELD(void *, scene, 0x114) = resourceOwner;

    void *actor0 = GraphicsAnimationInstanceManager_CreateInstance(resourceOwner, (u8 *)scene + 0xc8);
    func_ov037_021fd710(actor0, 0, 0, 0, 0, 1, 0x42);
    void *actor1 = GraphicsAnimationInstanceManager_CreateInstance(resourceOwner, (u8 *)scene + 0x104);

    void *child = Heap_Alloc(0xb0, data_ov037_021feeb0, 4, gHeapContext);
    if (child != 0)
        child = func_ov037_021fd5ac(child, actor0, actor1);
    FIELD(void *, scene, 0x118) = child;
    PresentationList_Append((u8 *)scene + 0x12c, child);

    void *actor = GraphicsAnimationInstanceManager_CreateInstance(resourceOwner, (u8 *)scene + 0xd4);
    child = Heap_Alloc(0xa0, data_ov037_021feeb0, 4, gHeapContext);
    if (child != 0)
        child = AlternateSpritePresentation_Init(child, actor);
    FIELD(void *, scene, 0x11c) = child;
    PresentationList_Append((u8 *)scene + 0x12c, child);

    actor = GraphicsAnimationInstanceManager_CreateInstance(resourceOwner, (u8 *)scene + 0xe0);
    FIELD(u8, actor, 0x5a) = 4;
    FIELD(u16, actor, 0x4e) = 0x43ff;
    child = Heap_Alloc(0xa0, data_ov037_021feeb0, 4, gHeapContext);
    if (child != 0)
        child = AlternateSpritePresentation_Init(child, actor);
    FIELD(void *, scene, 0x120) = child;
    PresentationList_Append((u8 *)scene + 0x12c, child);

    child = Heap_Alloc(0xa0, data_ov037_021feeb8, 4, gHeapContext);
    if (child != 0)
        child = func_ov037_021fd22c(child, owner);
    FIELD(void *, scene, 0x124) = child;
    PresentationList_Append((u8 *)scene + 0x12c, child);

    child = Heap_Alloc(0x9c, data_ov037_021feeb8, 4, gHeapContext);
    if (child != 0)
        child = func_ov037_021fd1cc(child);
    FIELD(void *, scene, 0x128) = child;
    PresentationList_Append((u8 *)scene + 0x12c, child);

    func_ov037_021fd758((u8 *)scene + 8, 0, 0, 0x2800);
    func_ov037_021fd760((u8 *)scene + 8, 0, 0, 0);
    func_ov037_021fd770((u8 *)scene + 0x14c, 0, 0x800, 0,
                        -0x1000, 31, 31, 31);
    func_020b0300(0, 31, 0x7fff, 0x3f, 0);
    TitlePalette_SetMainBackdrop(0);
    return scene;
}
