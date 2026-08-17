#include "tingle/types.h"

/* Overlay 31 central animated-effect object construction and ownership teardown. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov031_021fe758[];
extern const u8 data_ov031_021fe788[];
extern void *gDebugFont;
extern void *gGameWork;
extern void *data_020f4e18[];
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void SceneInputBase_Init(void *);
extern void AnimationResourceState_InitEmbedded(void *);
extern void Presentation_InitVariant(void *);
extern u32 genrand_int32(void);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern void func_02071ee0(void *, void *, s32, s32, s32);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void func_02073e48(void *, s32, s32, s32, s32, s32, s32);
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern void Heap_Free(void *);
extern void *SpritePresentation_Init(void *, void *);
extern void Presentation_SetPosition(void *, s32, s32, s32);
extern void SpritePresentation_SyncPosition(void *);
extern void *func_ov031_021fd1c0(void *);
extern void GraphicsSpriteGroup_Destroy(void *);
extern void func_ov031_021fd254(void *);
extern void AnimationResourceState_Destroy(void *);
#ifdef __cplusplus
}
#endif

typedef void (*Overlay031Destructor)(void *);

/* Invokes vtable slot 1 on a non-null owned polymorphic object. */
static void destroy_owned_object(void *object)
{
    if (object != 0) {
        void **vtable = FIELD(void **, object, 0);
        ((Overlay031Destructor)vtable[1])(object);
    }
}

/* Shared cleanup used by both recovered destructor variants. */
static void teardown_effect(void *effect)
{
    FIELD(const void *, effect, 0) = data_ov031_021fe758;
    destroy_owned_object(FIELD(void *, effect, 0x70));
    for (s32 i = 0; i < 16; ++i) {
        void *motion = FIELD(void *, effect, 0x74 + i * 4);
        if (motion != 0) {
            func_ov031_021fd1c0(motion);
            Heap_Free(motion);
        }
    }
    GraphicsSpriteGroup_Destroy(FIELD(void *, effect, 0x54));
    GraphicsSpriteGroup_Destroy(FIELD(void *, effect, 0x58));
    func_ov031_021fd254((u8 *)effect + 0xb4);
    AnimationResourceState_Destroy((u8 *)effect + 0x5c);
}

/*
 * Constructs the 0x154-byte animated effect in caller-provided `effect`. It
 * initializes its base/vtable, resource set +0x5C, animation state +0xB4, random
 * seed +0x150, and two debug-font renderers +0x54/+0x58. It loads resource IDs
 * 0x23AE..0x23B0; reads GameWork halfword +0x1CE into mode +0x6C; creates the
 * fixed sprites at (160,72), (160,128), (209,17), and conditionally (160,72);
 * allocates a 0xA0-byte composite +0x70 around another sprite, positions its
 * internal sprite at (160,18), chooses target Y 0x70000 or 0x12000 by mode, starts
 * it, and clears sixteen trajectory pointers +0x74..+0xB0. Returns `effect`;
 * heap, resource, renderer, sprite, composite, and PRNG state change.
 */
extern "C" void *func_ov031_021fd258(void *effect)
{
    SceneInputBase_Init(effect);
    FIELD(const void *, effect, 0) = data_ov031_021fe758;
    AnimationResourceState_InitEmbedded((u8 *)effect + 0x5c);
    Presentation_InitVariant((u8 *)effect + 0xb4);
    FIELD(u32, effect, 0x150) = 0;
    FIELD(u32, effect, 0x150) = genrand_int32();
    FIELD(void *, effect, 0x54) = GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);
    FIELD(void *, effect, 0x58) = GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);
    func_02071ee0((u8 *)effect + 0x5c, data_020f4e18[0],
                  0x23ae, 0x23af, 0x23b0);
    FIELD(s32, effect, 0x6c) = FIELD(s16, gGameWork, 0x1ce);

    void *sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, effect, 0x54),
                                  (u8 *)effect + 0x5c, 1);
    func_02073e48(sprite, 0, 0xa0, 0x48, 3, 0x2000, 0);
    sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, effect, 0x58),
                           (u8 *)effect + 0x5c, 1);
    func_02073e48(sprite, 2, 0xa0, 0x80, 3, 0, 0);
    sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, effect, 0x58),
                           (u8 *)effect + 0x5c, 1);
    func_02073e48(sprite, 0, 0xd1, 0x11, 3, 0, 0);
    if (FIELD(s32, effect, 0x6c) == 0) {
        sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, effect, 0x58),
                               (u8 *)effect + 0x5c, 1);
        func_02073e48(sprite, 8, 0xa0, 0x48, 3, 0x1800, 0);
    }
    FIELD(s32, effect, 0x68) = 0;
    void *composite = Heap_Alloc(0xa0, data_ov031_021fe788, 4, gHeapContext);
    if (composite != 0) {
        sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, effect, 0x54),
                               (u8 *)effect + 0x5c, 1);
        composite = SpritePresentation_Init(composite, sprite);
    }
    FIELD(void *, effect, 0x70) = composite;
    func_02073e48(FIELD(void *, composite, 0x9c), 1, 0xa0, 0x12,
                  3, 0x1000, 0);
    Presentation_SetPosition(composite, 0xa0000,
                  FIELD(s32, effect, 0x6c) == 0 ? 0x70000 : 0x12000, 0);
    SpritePresentation_SyncPosition(composite);
    for (s32 i = 0; i < 16; ++i)
        FIELD(void *, effect, 0x74 + i * 4) = 0;
    return effect;
}

/*
 * Tears down all owned composite, trajectory, renderer, animation, and resource
 * children but preserves `effect` storage. Returns `effect`; heap children and
 * graphics/resource SDK state are released.
 */
extern "C" void *func_ov031_021fd4b0(void *effect)
{
    teardown_effect(effect);
    return effect;
}

/*
 * Performs the same cleanup as 0x021FD4B0, then frees `effect` itself. Returns
 * the original pointer value after freeing it; callers must not dereference it.
 */
extern "C" void *func_ov031_021fd534(void *effect)
{
    teardown_effect(effect);
    Heap_Free(effect);
    return effect;
}
