#include "tingle/types.h"

/* Overlay 35 tertiary scene construction and seven-sprite resource assembly. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e18[];
extern const u8 data_ov035_02203cb0[];
extern const u8 data_ov035_02203d20[];
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_ov035_021fce00(void *object, void *argument);
extern void GraphicsResourceSetVariant_Init(void *state);
extern void func_02091b6c(void *state);
extern void func_02091d08(void *state);
extern void func_ov035_021fdce8(void *record);
extern void GraphicsResourceSetVariant_Load(void *state, void *resourceContext, s32 first,
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

/* Loads one consecutive three-ID resource group and registers it with owner. */
static void load_group(void *scene, s32 offset, s32 finalId,
                       void *resourceOwner)
{
    void *state = (u8 *)scene + offset;
    GraphicsResourceSetVariant_Load(state, data_020f4e18[0],
                  finalId - 2, finalId - 1, finalId);
    Graphics3DResourceOwner_PrepareResources(resourceOwner, state);
}

/* Creates one configured sprite and attaches it to collection +0x174. */
static void *create_scene_sprite(void *scene, s32 resourceOffset,
                                 s32 identifier, u8 value5a, u16 flags)
{
    void *record = GraphicsAnimationInstanceManager_CreateInstance(FIELD(void *, scene, 0x124),
                                  (u8 *)scene + resourceOffset);
    func_ov035_021fdd28(record, identifier, 0, 0, 0, value5a, flags);
    void *object = Heap_Alloc(0xa0, data_ov035_02203d20, 4, gHeapContext);
    if (object != 0)
        object = func_020955d8(object, record);
    func_02095274((u8 *)scene + 0x174, object);
    return object;
}

/*
 * Constructs the tertiary overlay-35 scene. It initializes six resource states
 * +0xCC..+0x118, animation state +0x140, controller +0x15C, and collections
 * +0x174/+0x184. Base field +4 variants 0xCA/0xCD/0xD0 select final resource
 * IDs for +0xCC and +0xE8. Seven configured 0xA0-byte sprites are created at
 * +0x128/+0x12C/+0x130/+0x134/+0x138/+0x13C/+0xD8 and attached to +0x174.
 * Scene vectors, global GX color state, and controller timing are initialized.
 * Returns the scene; heap, resource, renderer, and direct GX state change while
 * preserving the binary's null propagation after failed allocations.
 */
extern "C" void *func_ov035_021ff478(void *scene, void *resourceOwner,
                                      void *baseArgument)
{
    func_ov035_021fce00(scene, baseArgument);
    FIELD(const void *, scene, 0) = data_ov035_02203cb0;
    GraphicsResourceSetVariant_Init((u8 *)scene + 0xdc);
    GraphicsResourceSetVariant_Init((u8 *)scene + 0xe8);
    GraphicsResourceSetVariant_Init((u8 *)scene + 0xf4);
    GraphicsResourceSetVariant_Init((u8 *)scene + 0x100);
    GraphicsResourceSetVariant_Init((u8 *)scene + 0x10c);
    GraphicsResourceSetVariant_Init((u8 *)scene + 0x118);
    func_02091b6c((u8 *)scene + 0x140);
    func_02091d08((u8 *)scene + 0x15c);
    func_ov035_021fdce8((u8 *)scene + 0x174);
    func_ov035_021fdce8((u8 *)scene + 0x184);

    load_group(scene, 0xdc, 0x600b, resourceOwner);
    s32 variant = FIELD(s32, scene, 4);
    s32 resourceE8 = variant == 0xcd ? 0x606e :
                     variant == 0xd0 ? 0x606f : 0x606d;
    s32 resourceCC = variant == 0xcd ? 0x6116 :
                     variant == 0xd0 ? 0x6119 : 0x6113;
    load_group(scene, 0xe8, resourceE8, resourceOwner);
    load_group(scene, 0xcc, resourceCC, resourceOwner);
    load_group(scene, 0xf4, 0x608c, resourceOwner);
    load_group(scene, 0x100, 0x6089, resourceOwner);
    load_group(scene, 0x10c, 0x608f, resourceOwner);
    load_group(scene, 0x118, 0x6092, resourceOwner);

    FIELD(void *, scene, 0x124) = Graphics3DResourceOwner_CreateManager(resourceOwner);
    FIELD(void *, scene, 0x128) =
        create_scene_sprite(scene, 0xdc, 0, 7, 0x42);
    FIELD(void *, scene, 0x12c) =
        create_scene_sprite(scene, 0xe8, 0, 0x0c, 0x42);
    FIELD(void *, scene, 0x130) =
        create_scene_sprite(scene, 0xf4, 0, 0x0c, 0x46);
    FIELD(void *, scene, 0x134) =
        create_scene_sprite(scene, 0x100, 1, 0x0c, 0x42);
    FIELD(void *, scene, 0x138) =
        create_scene_sprite(scene, 0x10c, 0, 0x0c, 0x42);
    FIELD(void *, scene, 0x13c) =
        create_scene_sprite(scene, 0x10c, 1, 0x0c, 0x42);
    FIELD(void *, scene, 0xd8) =
        create_scene_sprite(scene, 0xcc, 0, 0x0c, 0x42);

    func_ov035_021fdd70((u8 *)scene + 0x0c, 0, 0, 0x2800);
    func_ov035_021fdd78((u8 *)scene + 0x0c, 0, 0, 0);
    func_020b0300(0, 0x1f, 0x7fff, 0x3f, 0);
    func_02092850(0);
    func_02091d24((u8 *)scene + 0x15c, 0, 0, 1, 1);
    return scene;
}
