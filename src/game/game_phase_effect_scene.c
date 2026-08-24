#include "tingle/game_phase_effect_scene.h"
#include "tingle/graphics_sprite_create.h"
#include "tingle/graphics_sprite_group.h"
#include "tingle/game_phase_runtime.h"
#include "tingle/heap.h"

/* Build and run the sprite effects used by several phase-change modes. */

#ifdef __cplusplus
extern "C" {
#endif
extern const GamePhaseEffectUpdateMethod data_020cdc1c[];
extern const u8 gGamePhaseEffectAnimationResourceAllocationTag[];
extern GamePhaseRuntime *gGamePhaseRuntime;
extern void *gSoundContext;
extern GraphicsSpriteGroup *ActorCollection_GetSpriteGroup(void);
extern void Sound_Play(void *context, s32 bank, s32 soundId, s32 parameter);
#ifdef __cplusplus
}
#endif

typedef s32 (*EffectUpdate)(GamePhaseEffectScene *self);

/* Allocate and initialize the three-entry animation resource tuple. */
static AnimationResource *createResources(void *resource1, void *resource2)
{
    AnimationResource *result = (AnimationResource *)Heap_Alloc(
        0x10, (const char *)gGamePhaseEffectAnimationResourceAllocationTag, 4,
        &gHeapContext);
    if (result != 0)
        AnimationResource_Init(result, (void *)0x1001, resource1, resource2);
    return result;
}

/*
 * Initialize the effect for mode 1, 2, or 4. Those modes select distinct
 * animation-resource IDs, sprite animations, and callback descriptors. The
 * sprite inherits the current phase actor's position. Other modes retain a
 * default callback descriptor; callers are only confirmed to request 1/2/4.
 */
GamePhaseEffectScene *GamePhaseEffectScene_Init(GamePhaseEffectScene *self, s32 mode)
{
    u8 *runtime = (u8 *)gGamePhaseRuntime;
    GraphicsSpriteState *source;
    GraphicsSpriteGroup *group;

    Scene_Init(&self->base);
    self->base.vtable = &gGamePhaseEffectSceneVTable;
    self->riseFrameCounter = 0;
    source = *(GraphicsSpriteState **)(*(u8 **)(runtime + 0x2ea4) + 0x54);

    switch (mode) {
    case 1:
        self->animationResource = createResources((void *)0x100b, (void *)0x100c);
        GamePhaseRuntime_GetActorCollection(gGamePhaseRuntime, 1);
        group = ActorCollection_GetSpriteGroup();
        self->sprite = GraphicsSpriteState_Create(group,
            (const GraphicsSpriteResourceDescriptor *)self->animationResource,
            0x24, source->oamPriority, source->sortOrder, 4, 2);
        self->updateMethod = gGamePhaseEffectUpdateMethods[0];
        break;
    case 2:
        self->animationResource = createResources((void *)0x101b, (void *)0x101c);
        GamePhaseRuntime_GetActorCollection(gGamePhaseRuntime, 1);
        group = ActorCollection_GetSpriteGroup();
        self->sprite = GraphicsSpriteState_Create(group,
            (const GraphicsSpriteResourceDescriptor *)self->animationResource,
            0x35, source->oamPriority, source->sortOrder, 4, 2);
        self->updateMethod = gGamePhaseEffectUpdateMethods[1];
        break;
    case 4:
        self->animationResource = createResources((void *)0x1003, (void *)0x1004);
        GamePhaseRuntime_GetActorCollection(gGamePhaseRuntime, 1);
        group = ActorCollection_GetSpriteGroup();
        self->sprite = GraphicsSpriteState_Create(group,
            (const GraphicsSpriteResourceDescriptor *)self->animationResource,
            0x16, source->oamPriority, source->sortOrder, 4, 2);
        self->updateMethod = gGamePhaseEffectUpdateMethods[3];
        break;
    default:
        self->updateMethod = data_020cdc1c[0];
        break;
    }

    self->sprite->screenX = source->screenX;
    self->sprite->screenY = source->screenY;
    return self;
}

/* Remove the sprite and owned resources, destroy the Scene, and return self. */
GamePhaseEffectScene *GamePhaseEffectScene_Destroy(GamePhaseEffectScene *self)
{
    self->base.vtable = &gGamePhaseEffectSceneVTable;
    GraphicsSpriteGroup_ReleaseState(self->sprite->group, self->sprite);
    if (self->animationResource != 0)
        self->animationResource->vtable->destroy(self->animationResource);
    Scene_Destroy(&self->base);
    return self;
}

/* Destroy the effect and then free its Scene allocation through the game heap. */
GamePhaseEffectScene *GamePhaseEffectScene_DestroyAndFree(GamePhaseEffectScene *self)
{
    self->base.vtable = &gGamePhaseEffectSceneVTable;
    GraphicsSpriteGroup_ReleaseState(self->sprite->group, self->sprite);
    if (self->animationResource != 0)
        self->animationResource->vtable->destroy(self->animationResource);
    Scene_Destroy(&self->base);
    Heap_Free(self);
    return self;
}

/*
 * Invoke the stored CodeWarrior pointer-to-member callback, update the sprite
 * group, and force main-engine window/blend control to 0xc0310010. Destroy the
 * Scene and return one when the callback reports completion, otherwise zero.
 */
s32 GamePhaseEffectScene_Update(GamePhaseEffectScene *self)
{
    EffectUpdate callback;
    GamePhaseEffectScene *adjusted = (GamePhaseEffectScene *)(
        (u8 *)self + (self->updateMethod.thisAdjustment >> 1));

    if (self->updateMethod.thisAdjustment & 1) {
        u8 *vtable = *(u8 **)adjusted;
        callback = *(EffectUpdate *)(
            vtable + self->updateMethod.functionOrVtableOffset);
    } else {
        callback = (EffectUpdate)self->updateMethod.functionOrVtableOffset;
    }

    {
        s32 complete = callback(adjusted);
        GraphicsSpriteGroup_AdvanceAnimations(self->sprite->group);
        *(volatile u32 *)0x04000064 = 0xc0310010;
        if (complete) {
            if (self != 0)
                self->base.vtable->destroyAndFree(&self->base);
            return 1;
        }
    }
    return 0;
}

/*
 * Hide the phase actor, reveal this sprite, and play sound 0x2d on entry.
 * Return one once the sprite sets flag bit 0, otherwise return zero.
 */
s32 GamePhaseEffectScene_WaitForAnimation(GamePhaseEffectScene *self)
{
    if (self->base.value08 == 0) {
        GraphicsSpriteState *source = *(GraphicsSpriteState **)(
            *(u8 **)((u8 *)gGamePhaseRuntime + 0x2ea4) + 0x54);
        self->base.value08++;
        source->flags |= 4;
        self->sprite->flags &= (u16)~4;
        Sound_Play(gSoundContext, 0, 0x2d, 0);
    }
    if (self->base.value08 == 1 && (self->sprite->flags & 1))
        return 1;
    return 0;
}

/*
 * Perform the same reveal/sound setup, switch completed animation to index
 * 0x17, then move the sprite upward for 91 frames. Returns one afterward.
 */
s32 GamePhaseEffectScene_RiseAfterAnimation(GamePhaseEffectScene *self)
{
    if (self->base.value08 == 0) {
        GraphicsSpriteState *source = *(GraphicsSpriteState **)(
            *(u8 **)((u8 *)gGamePhaseRuntime + 0x2ea4) + 0x54);
        self->base.value08++;
        source->flags |= 4;
        self->sprite->flags &= (u16)~4;
        Sound_Play(gSoundContext, 0, 0x2d, 0);
    }
    if (self->base.value08 == 1) {
        if (!(self->sprite->flags & 1))
            return 0;
        GraphicsSpriteState_SetAnimationIndex(self->sprite, 0x17);
        self->sprite->flags &= (u16)~1;
        self->sprite->flags |= 2;
        self->base.value08++;
    }
    if (self->base.value08 == 2) {
        GraphicsSpriteState *source;
        self->riseFrameCounter++;
        if (self->riseFrameCounter > 90)
            return 1;
        source = *(GraphicsSpriteState **)(
            *(u8 **)((u8 *)gGamePhaseRuntime + 0x2ea4) + 0x54);
        self->sprite->screenY =
            (s16)(source->screenY - self->riseFrameCounter / 2);
    }
    return 0;
}
