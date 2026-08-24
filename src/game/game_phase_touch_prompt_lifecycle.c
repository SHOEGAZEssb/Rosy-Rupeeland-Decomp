#include "tingle/game_phase_touch_prompt.h"
#include "tingle/frame_task.h"
#include "tingle/heap.h"

/* Construct and destroy the phase-owned, resource-backed touch prompt actor. */

#ifdef __cplusplus
extern "C" {
#endif
extern const void *data_020d5604;
extern const char gGamePhaseTouchPromptActorAllocationTag[];
extern void *data_020f4e14;
extern void *data_020f4e18;
extern void AnimationResourceState_InitEmbedded(void *state);
extern void AnimationResourceState_Destroy(void *state);
extern void func_02071ee0(void *state, void *manager, void *resource0,
                          void *resource1, void *resource2);
extern void *SpritePresentation_Init(void *self, GraphicsSpriteState *sprite);
extern void Presentation_SetPosition(void *actor, s32 x, s32 y, s32 z);
extern void SpritePresentation_SyncPosition(void *actor);
extern void SpritePresentation_SetAnimation(void *actor, s32 animation);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the recovered list-like base, retain owner, bind resources
 * 0x3298-0x329a, create a sprite group and 0xa0-byte prompt actor, position it
 * at (0xf4000, 0xd4000, 0), select animation zero, and set bit 1 in the
 * actor's sprite-state flags at offset 0x24. Returns self. The resource and
 * sprite helpers mutate their global managers and the game heap.
 */
GamePhaseTouchPrompt *GamePhaseTouchPrompt_Init(GamePhaseTouchPrompt *self, void *owner)
{
    void *allocation;
    GraphicsSpriteState *sprite;
    void *spriteState;

    FrameTask_Construct((FrameTask *)self);
    self->vtable = data_020d5604;
    self->owner = owner;
    AnimationResourceState_InitEmbedded(&self->resources);
    self->enabled = 1;
    self->state = 3;
    self->savedState = 3;
    self->timer = 0;
    self->spriteGroup = GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
    func_02071ee0(&self->resources, data_020f4e18,
                  (void *)0x3298, (void *)0x3299, (void *)0x329a);
    allocation = Heap_Alloc(0xa0, gGamePhaseTouchPromptActorAllocationTag, 4, &gHeapContext);
    if (allocation) {
        sprite = GraphicsSpriteGroup_CreateStateFromSource(self->spriteGroup,
                               &self->resources, 2);
        allocation = SpritePresentation_Init(allocation, sprite);
    }
    self->actor = allocation;
    Presentation_SetPosition(allocation, 0xf4000, 0xd4000, 0);
    SpritePresentation_SyncPosition(self->actor);
    SpritePresentation_SetAnimation(self->actor, 0);
    spriteState = *(void **)((u8 *)self->actor + 0x9c);
    *(u16 *)((u8 *)spriteState + 0x24) |= 2;
    return self;
}

/*
 * Invoke actor's deleting virtual hook when present, release the sprite
 * group and resource binding, then run the recovered base destructor hook.
 * Returns self without freeing its storage.
 */
GamePhaseTouchPrompt *GamePhaseTouchPrompt_Destroy(GamePhaseTouchPrompt *self)
{
    self->vtable = data_020d5604;
    if (self->actor)
        ((void (*)(void *))(*(void ***)self->actor)[1])(self->actor);
    GraphicsSpriteGroup_Destroy(self->spriteGroup);
    AnimationResourceState_Destroy(&self->resources);
    FrameTask_DestroyBase((FrameTask *)self);
    return self;
}

/* Perform full prompt cleanup, free self, and return its former address. */
GamePhaseTouchPrompt *GamePhaseTouchPrompt_DestroyAndFree(GamePhaseTouchPrompt *self)
{
    GamePhaseTouchPrompt_Destroy(self);
    Heap_Free(self);
    return self;
}
