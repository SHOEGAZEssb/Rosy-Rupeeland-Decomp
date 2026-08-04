#include "tingle/game_phase_touch_prompt.h"
#include "tingle/heap.h"

/* Construct and destroy the phase-owned, resource-backed touch prompt actor. */

#ifdef __cplusplus
extern "C" {
#endif
extern const void *data_020d5604;
extern const char data_020d5628[];
extern void *data_020f4e14;
extern void *data_020f4e18;
extern void *func_02006108(void *self);
extern void *func_02006138(void *self);
extern void func_02071ea4(void *state);
extern void func_02071eb8(void *state);
extern void func_02071ee0(void *state, void *manager, void *resource0,
                          void *resource1, void *resource2);
extern void *func_020953f4(void *self, GraphicsSpriteState *sprite);
extern void func_02094bbc(void *actor, s32 x, s32 y, s32 z);
extern void func_02095508(void *actor);
extern void func_020954c0(void *actor, s32 animation);
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
GamePhaseTouchPrompt *func_0201022c(GamePhaseTouchPrompt *self, void *owner)
{
    void *allocation;
    GraphicsSpriteState *sprite;
    void *spriteState;

    func_02006108(self);
    self->vtable = data_020d5604;
    self->owner_08 = owner;
    func_02071ea4(&self->resources_0c);
    self->enabled_20 = 1;
    self->state_28 = 3;
    self->savedState_2c = 3;
    self->timer_24 = 0;
    self->spriteGroup_18 = func_020742cc(data_020f4e14);
    func_02071ee0(&self->resources_0c, data_020f4e18,
                  (void *)0x3298, (void *)0x3299, (void *)0x329a);
    allocation = Heap_Alloc(0xa0, data_020d5628, 4, &gHeapContext);
    if (allocation) {
        sprite = func_02073ffc(self->spriteGroup_18,
                               &self->resources_0c, 2);
        allocation = func_020953f4(allocation, sprite);
    }
    self->actor_1c = allocation;
    func_02094bbc(allocation, 0xf4000, 0xd4000, 0);
    func_02095508(self->actor_1c);
    func_020954c0(self->actor_1c, 0);
    spriteState = *(void **)((u8 *)self->actor_1c + 0x9c);
    *(u16 *)((u8 *)spriteState + 0x24) |= 2;
    return self;
}

/*
 * Invoke actor_1c's deleting virtual hook when present, release the sprite
 * group and resource binding, then run the recovered base destructor hook.
 * Returns self without freeing its storage.
 */
GamePhaseTouchPrompt *func_02010338(GamePhaseTouchPrompt *self)
{
    self->vtable = data_020d5604;
    if (self->actor_1c)
        ((void (*)(void *))(*(void ***)self->actor_1c)[1])(self->actor_1c);
    func_0207419c(self->spriteGroup_18);
    func_02071eb8(&self->resources_0c);
    func_02006138(self);
    return self;
}

/* Perform full prompt cleanup, free self, and return its former address. */
GamePhaseTouchPrompt *func_02010384(GamePhaseTouchPrompt *self)
{
    func_02010338(self);
    Heap_Free(self);
    return self;
}
