#include "tingle/types.h"

/* Overlay 35 quinary scene construction, sprite resources, and list setup. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e18[];
extern const u8 data_ov035_02203c24[];
extern const u8 data_ov035_02203d20[];
extern const u8 data_ov035_02203d60[];
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_ov035_021fce00(void *object, void *argument);
extern void GraphicsResourceSetVariant_Init(void *state);
extern void func_ov035_021fdce8(void *collection);
extern void func_02091b6c(void *state);
extern void func_02091d08(void *state);
extern void GraphicsResourceSetVariant_Load(void *state, void *resourceContext, s32 first,
                         s32 second, s32 third);
extern void Graphics3DResourceOwner_PrepareResources(void *owner, void *resource);
extern void *GraphicsArchive_AcquireOwlvResource(void *resourceContext, s32 resourceId);
extern void *Graphics3DResourceOwner_CreateManager(void *owner);
extern void *GraphicsAnimationInstanceManager_CreateInstance(void *resourceSet, void *resource);
extern void func_ov035_021fdd28(void *record, s32 identifier, s32 value20,
                               s32 value24, s32 value28, u8 value5a,
                               u16 flags);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *AlternateSpritePresentation_Init(void *allocation, void *spriteRecord);
extern void PresentationList_Append(void *collection, void *object);
extern void PresentationScalar_SetImmediate(void *field, s32 value);
extern void *func_ov035_021fd4b4(void *list, s32 argument);
extern void func_ov035_021fdd70(void *record, s32 x, s32 y, s32 z);
extern void func_ov035_021fdd78(void *record, s32 x, s32 y, s32 z);
extern void func_020b0374(s32 first, s32 second, s32 third, s32 fourth);
extern void func_020b0300(s32 first, s32 second, s32 third, s32 fourth,
                         s32 fifth);
extern void TitlePalette_SetMainBackdrop(s32 value);
extern void func_02091d24(void *state, s32 first, s32 second, s32 third,
                         s32 fourth);
extern void func_02091b98(void *state, s32 value);
#ifdef __cplusplus
}
#endif

/* Loads the supplied three resource IDs into state and registers it with owner. */
static void load_group(void *state, s32 first, s32 second, s32 third,
                       void *resourceOwner)
{
    GraphicsResourceSetVariant_Load(state, data_020f4e18[0], first, second, third);
    Graphics3DResourceOwner_PrepareResources(resourceOwner, state);
}

/*
 * Configures and allocates one sprite, then attaches it to collection +0x108.
 * Returns the constructed object, including null when allocation fails.
 */
static void *create_sprite(void *scene, s32 resourceOffset, s32 identifier,
                           u8 value5a, u16 flags)
{
    void *record = GraphicsAnimationInstanceManager_CreateInstance(FIELD(void *, scene, 0xf8),
                                  (u8 *)scene + resourceOffset);
    func_ov035_021fdd28(record, identifier, 0, 0, 0, value5a, flags);
    void *object = Heap_Alloc(0xa0, data_ov035_02203d20, 4, gHeapContext);
    if (object != 0)
        object = AlternateSpritePresentation_Init(object, record);
    PresentationList_Append((u8 *)scene + 0x108, object);
    return object;
}

/*
 * Constructs the quinary overlay-35 scene. It initializes resource states
 * +0xDC/+0xE8, three collections +0x108/+0x118/+0x128, animation/controller
 * states +0x138/+0x154, and a small primitive list at +0x170. Base field +4
 * variants 0x12D, 0x130, and 0x133 select distinct +0xE8/+0xCC resource ID
 * triples; unknown variants take the 0x12D/default path. Four sprites are
 * created at +0xFC/+0x100/+0x104/+0xD8. It also configures scene vectors,
 * fades, GX state, and directly clears hardware register 0x04000358. Returns
 * scene; heap, resource, renderer, display, controller, and hardware state
 * change. Failed allocations intentionally propagate to later setup calls.
 */
extern "C" void *func_ov035_022008d0(void *scene, void *resourceOwner,
                                      void *baseArgument)
{
    func_ov035_021fce00(scene, baseArgument);
    FIELD(const void *, scene, 0) = data_ov035_02203c24;
    GraphicsResourceSetVariant_Init((u8 *)scene + 0xdc);
    GraphicsResourceSetVariant_Init((u8 *)scene + 0xe8);
    func_ov035_021fdce8((u8 *)scene + 0x108);
    func_ov035_021fdce8((u8 *)scene + 0x118);
    func_ov035_021fdce8((u8 *)scene + 0x128);
    func_02091b6c((u8 *)scene + 0x138);
    func_02091d08((u8 *)scene + 0x154);

    load_group((u8 *)scene + 0xdc, 0x6018, 0x6019, 0x601a,
               resourceOwner);
    switch (FIELD(s32, scene, 4)) {
    case 0x130:
        load_group((u8 *)scene + 0xe8, 0x607a, 0x607d, 0x607c,
                   resourceOwner);
        load_group((u8 *)scene + 0xcc, 0x6102, 0x6103, 0x6104,
                   resourceOwner);
        break;
    case 0x133:
        load_group((u8 *)scene + 0xe8, 0x607a, 0x607e, 0x607c,
                   resourceOwner);
        load_group((u8 *)scene + 0xcc, 0x6105, 0x6106, 0x6107,
                   resourceOwner);
        break;
    case 0x12d:
    default:
        load_group((u8 *)scene + 0xe8, 0x607a, 0x607b, 0x607c,
                   resourceOwner);
        load_group((u8 *)scene + 0xcc, 0x60ff, 0x6100, 0x6101,
                   resourceOwner);
        break;
    }

    FIELD(void *, scene, 0xf4) = GraphicsArchive_AcquireOwlvResource(data_020f4e18[0], 0x500f);
    FIELD(void *, scene, 0xf8) = Graphics3DResourceOwner_CreateManager(resourceOwner);
    FIELD(void *, scene, 0xfc) = create_sprite(scene, 0xdc, 0, 7, 0x46);
    FIELD(void *, scene, 0x100) = create_sprite(scene, 0xe8, 0, 10, 0x42);
    FIELD(void *, scene, 0x104) = create_sprite(scene, 0xe8, 2, 10, 0x41);
    FIELD(void *, scene, 0xd8) = create_sprite(scene, 0xcc, 0, 12, 0x42);
    PresentationScalar_SetImmediate((u8 *)FIELD(void *, scene, 0xd8) + 0x6c, 0xccd);

    void *list = Heap_Alloc(0x18, data_ov035_02203d60, 4, gHeapContext);
    if (list != 0)
        list = func_ov035_021fd4b4(list, 0x10);
    FIELD(void *, scene, 0x170) = list;
    FIELD(u16, list, 0x14) = 0x7fff;
    FIELD(s32, list, 0x0c) = 0x180;
    FIELD(void *, scene, 0x174) = 0;

    func_ov035_021fdd70((u8 *)scene + 0x0c, 0, 0, 0x2800);
    func_ov035_021fdd78((u8 *)scene + 0x0c, 0, 0, 0);
    func_020b0374(1, 0, 4, 0x7400);
    *(volatile u32 *)0x04000358 = 0;
    func_020b0300(0, 0x1f, 0x7fff, 0x3f, 0);
    TitlePalette_SetMainBackdrop(0);
    func_02091d24((u8 *)scene + 0x154, 0, 0, 5, 1);
    func_02091b98((u8 *)scene + 0xa4, 10);
    FIELD(s32, scene, 0x16c) = 5;
    return scene;
}
