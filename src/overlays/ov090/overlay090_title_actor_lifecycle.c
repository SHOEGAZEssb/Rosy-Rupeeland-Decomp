#include "tingle/animation_resource.h"
#include "tingle/game_phase_runtime.h"
#include "tingle/game_work.h"
#include "tingle/graphics_sprite_group.h"
#include "tingle/graphics_sprite_renderer.h"
#include "tingle/heap.h"
#include "tingle/vec_fx32.h"

/*
 * Phase-90 title actor construction, logo/copyright sprite creation, and
 * teardown. This is the retail actor reached by overlay 225's phase request.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef void (*ActorModeMethod)(void *self, s32 mode);

#ifdef __cplusplus
extern "C" {
#endif
extern GamePhaseRuntime *data_021052fc;
extern u8 data_020f4e14[];
extern void *gDebugFont;
extern const char data_ov090_0221cc00[];
extern u8 data_ov090_0221cb10[];

extern void *func_0204d520(void *self);
extern void func_0204d3d8(void);
extern void *func_0204d570(void *self);
extern void *Actor_GetCollection(void *actor);
extern GraphicsSpriteGroup *ActorCollection_GetSpriteOwner(void *collection);
extern void GXx_SetMasterBrightness_(volatile u16 *reg, s32 brightness);
extern void func_ov090_0221ad64(void *self, s32 first, s32 second, s32 third);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the title controller, bind its three retail title actors, disable
 * their normal update bit, set the phase flags, and begin with both NDS engines
 * at white master brightness. Returns `self`.
 */
extern "C" void *func_ov090_022177e0(void *self)
{
    s32 found = 0;
    s32 index = 0;
    void *primary;

    func_0204d520(self);
    FIELD(void *, self, 0x000) = data_ov090_0221cb10;
    FIELD(u8, self, 0x1ec) = 0;
    FIELD(u8, self, 0x1ed) = 0;
    FIELD(u8, self, 0x1ee) = 0;
    FIELD(u8, self, 0x1ef) = 0;
    FIELD(u16, self, 0x1f0) = 0;
    FIELD(u16, self, 0x1f2) = 0xd2;
    FIELD(void *, self, 0x200) = 0;
    FIELD(void *, self, 0x204) = 0;
    FIELD(void *, self, 0x208) = 0;
    VecFx32Object_Init((VecFx32Object *)((u8 *)self + 0x20c));
    FIELD(void *, self, 0x21c) = 0;
    FIELD(u16, self, 0x220) = 2000;
    FIELD(u8, self, 0x222) = 0;
    FIELD(u8, self, 0x223) = 0;
    VecFx32Object_Init((VecFx32Object *)((u8 *)self + 0x224));
    FIELD(u16, self, 0x234) = 0;
    FIELD(u16, self, 0x236) = 300;
    FIELD(u16, self, 0x238) = 2000;
    FIELD(u16, self, 0x23a) = 2000;
    FIELD(void *, self, 0x23c) = 0;
    FIELD(void *, self, 0x240) = 0;
    FIELD(u16, self, 0x244) = 0x7f;
    FIELD(u8, self, 0x246) = 0;
    FIELD(u8, self, 0x247) = 0;

    while (index < FIELD(s32, GamePhaseRuntime_GetActorCollection(data_021052fc, 1), 0x2e74)
           && found < 3) {
        void *actor = FIELD(void *, GamePhaseRuntime_GetActorCollection(data_021052fc, 1),
                            index * 4);
        if (actor != 0 && FIELD(u8, actor, 0x4d) == 2
            && FIELD(s8, actor, 0x27e) == 0x12
            && (FIELD(s8, actor, 0x2e4) & 0xf) == 0) {
            FIELD(void *, self, 0x1f4 + found * 4) = actor;
            found++;
        }
        index++;
    }

    primary = FIELD(void *, data_021052fc, 0x2ea4);
    FIELD(u32, primary, 0xd0) |= 0x40000;
    if (FIELD(void *, data_021052fc, 0x2ea8) != 0)
        FIELD(u32, FIELD(void *, data_021052fc, 0x2ea8), 0xd0) |= 0x40000;
    FIELD(u32, primary, 0x230) &= ~4;
    ((ActorModeMethod)FIELD(void *, FIELD(void *, primary, 0), 0x54))(primary, 0);
    FIELD(u32, primary, 0x230) |= 0x20;

    GameWork_SetFlag(gGameWork, 0x403);
    GameWork_ClearFlag(gGameWork, 0x3ec);
    for (index = 0; index < 3; index++) {
        void *actor = FIELD(void *, self, 0x1f4 + index * 4);
        FIELD(u16, actor, 0x2f2) &= ~2;
        FIELD(void *, actor, 0x2f8) = self;
    }
    GameWork_SetFlag(gGameWork, 0x386);
    GXx_SetMasterBrightness_((volatile u16 *)0x0400006c, 16);
    GXx_SetMasterBrightness_((volatile u16 *)0x0400106c, 16);
    return self;
}

/*
 * Run base title setup, load the logo and copyright animation resources, and
 * create their sprite states in the actor collection. The primary logo is
 * placed at (49,178), uses animation 6, and both sprites start hidden.
 */
extern "C" void func_ov090_02217a3c(void *self)
{
    AnimationResource *resource;
    GraphicsSpriteState *sprite;

    func_0204d3d8();
    func_ov090_0221ad64(self, 0x1026, 0x1027, 0x1028);

    resource = (AnimationResource *)Heap_Alloc(0x10, data_ov090_0221cc00, 4,
                                               &gHeapContext);
    if (resource != 0)
        resource = AnimationResource_Init(resource, (void *)0x138a,
                                          (void *)0x1078, (void *)0x138b);
    FIELD(AnimationResource *, self, 0x240) = resource;
    sprite = GraphicsSpriteGroup_CreateState(
        ActorCollection_GetSpriteOwner(Actor_GetCollection(self)),
        resource->entries[0], resource->entries[1], resource->entries[2], 1);
    FIELD(GraphicsSpriteState *, self, 0x23c) = sprite;
    sprite->screenX = 0x31;
    sprite->screenY = 0xb2;
    sprite->field_3a = 0;
    sprite->flags |= 0x12;
    GraphicsSpriteState_SetAnimationIndex(sprite, 6);

    resource = (AnimationResource *)Heap_Alloc(0x10, data_ov090_0221cc00, 4,
                                               &gHeapContext);
    if (resource != 0)
        resource = AnimationResource_Init(resource, (void *)0x1390,
                                          (void *)0x1078, (void *)0x1391);
    FIELD(AnimationResource *, self, 0x24c) = resource;
    sprite = GraphicsSpriteGroup_CreateState(
        ActorCollection_GetSpriteOwner(Actor_GetCollection(self)),
        resource->entries[0], resource->entries[1], resource->entries[2], 2);
    FIELD(GraphicsSpriteState *, self, 0x248) = sprite;
    sprite->field_3a = 0;
    sprite->flags |= 0x12;
}

/* Release a nullable animation resource through its retail deleting destructor. */
static void ReleaseAnimationResource(AnimationResource *resource)
{
    if (resource != 0)
        resource->vtable->destroyAndFree(resource);
}

/*
 * Release title sprite states and animation resources, restore debug text-grid
 * state, destroy embedded vectors, invoke the actor base destructor, and return
 * `self`. This non-deleting destructor does not free the actor allocation.
 */
extern "C" void *func_ov090_02217b70(void *self)
{
    FIELD(void *, self, 0) = data_ov090_0221cb10;
    GraphicsSpriteGroup_ReleaseIndexedEntries(
        ActorCollection_GetSpriteOwner(Actor_GetCollection(self)));
    if (FIELD(GraphicsSpriteState *, self, 0x200) != 0)
        GraphicsSpriteState_ReleaseFromGroup(FIELD(GraphicsSpriteState *, self, 0x200));
    if (FIELD(GraphicsSpriteState *, self, 0x23c) != 0)
        GraphicsSpriteState_ReleaseFromGroup(FIELD(GraphicsSpriteState *, self, 0x23c));
    if (FIELD(GraphicsSpriteState *, self, 0x248) != 0)
        GraphicsSpriteState_ReleaseFromGroup(FIELD(GraphicsSpriteState *, self, 0x248));
    ReleaseAnimationResource(FIELD(AnimationResource *, self, 0x240));
    ReleaseAnimationResource(FIELD(AnimationResource *, self, 0x204));
    ReleaseAnimationResource(FIELD(AnimationResource *, self, 0x208));
    ReleaseAnimationResource(FIELD(AnimationResource *, self, 0x24c));
    FIELD(s32, gDebugFont, 0x38) = 1;
    GraphicsSpriteRenderer_SetTextGridPosition(
        FIELD(GraphicsSpriteRenderer *, data_020f4e14, 0), 0, 0);
    VecFx32Object_Destroy((VecFx32Object *)((u8 *)self + 0x224));
    VecFx32Object_Destroy((VecFx32Object *)((u8 *)self + 0x20c));
    func_0204d570(self);
    return self;
}

/*
 * Deleting title-actor destructor. It performs the complete non-deleting
 * teardown, frees the allocation through the game heap, and returns `self`.
 */
extern "C" void *func_ov090_02217c6c(void *self)
{
    func_ov090_02217b70(self);
    Heap_Free(self);
    return self;
}
