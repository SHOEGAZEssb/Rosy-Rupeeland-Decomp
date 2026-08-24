#include "tingle/game_phase_effect_scene.h"
#include "tingle/graphics_sprite_create.h"
#include "tingle/graphics_sprite_group.h"
#include "tingle/heap.h"

/* Build and run the sprite effects used by several phase-change modes. */

#ifdef __cplusplus
extern "C" {
#endif
extern SceneVTable data_020d5400;
extern const u32 data_020d53b8[];
extern const u32 data_020cdc1c[];
extern const u8 data_020d542c[];
extern void *data_021052fc;
extern void *gSoundContext;
extern void *GamePhaseRuntime_GetActorCollection(void *runtime, s32 index);
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
        0x10, (const char *)data_020d542c, 4, &gHeapContext);
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
    u8 *runtime = (u8 *)data_021052fc;
    GraphicsSpriteState *source;
    GraphicsSpriteGroup *group;

    Scene_Init(&self->base);
    self->base.vtable = &data_020d5400;
    self->timer = 0;
    source = *(GraphicsSpriteState **)(*(u8 **)(runtime + 0x2ea4) + 0x54);

    switch (mode) {
    case 1:
        self->resources = createResources((void *)0x100b, (void *)0x100c);
        GamePhaseRuntime_GetActorCollection(runtime, 1);
        group = ActorCollection_GetSpriteGroup();
        self->sprite = GraphicsSpriteState_Create(group,
            (const GraphicsSpriteResourceDescriptor *)self->resources,
            0x24, source->field_3a, source->field_28, 4, 2);
        self->callbackWord = data_020d53b8[0];
        self->callbackThisAdjust = (s32)data_020d53b8[1];
        break;
    case 2:
        self->resources = createResources((void *)0x101b, (void *)0x101c);
        GamePhaseRuntime_GetActorCollection(runtime, 1);
        group = ActorCollection_GetSpriteGroup();
        self->sprite = GraphicsSpriteState_Create(group,
            (const GraphicsSpriteResourceDescriptor *)self->resources,
            0x35, source->field_3a, source->field_28, 4, 2);
        self->callbackWord = data_020d53b8[2];
        self->callbackThisAdjust = (s32)data_020d53b8[3];
        break;
    case 4:
        self->resources = createResources((void *)0x1003, (void *)0x1004);
        GamePhaseRuntime_GetActorCollection(runtime, 1);
        group = ActorCollection_GetSpriteGroup();
        self->sprite = GraphicsSpriteState_Create(group,
            (const GraphicsSpriteResourceDescriptor *)self->resources,
            0x16, source->field_3a, source->field_28, 4, 2);
        self->callbackWord = data_020d53b8[6];
        self->callbackThisAdjust = (s32)data_020d53b8[7];
        break;
    default:
        self->callbackWord = data_020cdc1c[0];
        self->callbackThisAdjust = (s32)data_020cdc1c[1];
        break;
    }

    self->sprite->field_2c = source->field_2c;
    self->sprite->field_2e = source->field_2e;
    return self;
}

/* Remove the sprite and owned resources, destroy the Scene, and return self. */
GamePhaseEffectScene *GamePhaseEffectScene_Destroy(GamePhaseEffectScene *self)
{
    self->base.vtable = &data_020d5400;
    GraphicsSpriteGroup_ReleaseState(self->sprite->group, self->sprite);
    if (self->resources != 0)
        self->resources->vtable->destroy(self->resources);
    Scene_Destroy(&self->base);
    return self;
}

/* Destroy the effect and then free its Scene allocation through the game heap. */
GamePhaseEffectScene *GamePhaseEffectScene_DestroyAndFree(GamePhaseEffectScene *self)
{
    self->base.vtable = &data_020d5400;
    GraphicsSpriteGroup_ReleaseState(self->sprite->group, self->sprite);
    if (self->resources != 0)
        self->resources->vtable->destroy(self->resources);
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
        (u8 *)self + (self->callbackThisAdjust >> 1));

    if (self->callbackThisAdjust & 1) {
        u8 *vtable = *(u8 **)adjusted;
        callback = *(EffectUpdate *)(vtable + self->callbackWord);
    } else {
        callback = (EffectUpdate)self->callbackWord;
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
            *(u8 **)((u8 *)data_021052fc + 0x2ea4) + 0x54);
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
            *(u8 **)((u8 *)data_021052fc + 0x2ea4) + 0x54);
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
        self->timer++;
        if (self->timer > 90)
            return 1;
        source = *(GraphicsSpriteState **)(
            *(u8 **)((u8 *)data_021052fc + 0x2ea4) + 0x54);
        self->sprite->field_2e = (s16)(source->field_2e - self->timer / 2);
    }
    return 0;
}
