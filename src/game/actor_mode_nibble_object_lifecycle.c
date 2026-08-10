#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Construct and destroy an actor subclass carrying a four-bit mode in field
 * +0x208.
 */
extern void *data_020df774;

#ifdef __cplusplus
extern "C" {
#endif
extern void *ActorDerivedRuntime_Init(void *actor);
extern void *ActorDerivedRuntime_DestroyAlternate(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the recovered base, install this subclass vtable, clear both
 * nibbles of halfword +0x208 and place the low four bits of mode in bits
 * 12..15, clear halfword +0xd6, set word +0x108 to -16, and return self.
 * The second input is unused in the recovered constructor. Base initialization
 * establishes actor-owned runtime state.
 */
void *ActorModeNibble_Init(void *self, void *unused, u32 mode)
{
    u8 *actor = (u8 *)ActorDerivedRuntime_Init(self);
    u16 flags;
    (void)unused;
    *(void **)actor = data_020df774;
    flags = *(u16 *)(actor + 0x208);
    flags &= 0xf000;
    flags &= (u16)~0xf000;
    flags |= (u16)((mode & 0x0f) << 12);
    *(u16 *)(actor + 0x208) = flags;
    *(u16 *)(actor + 0xd6) = 0;
    *(s32 *)(actor + 0x108) = -16;
    return actor;
}

/*
 * Run ActorDerivedRuntime_DestroyAlternate and return self without freeing
 * it.
 */
void *ActorModeNibble_Destroy(void *self)
{
    ActorDerivedRuntime_DestroyAlternate(self);
    return self;
}

/* Run the recovered base teardown, free self, and return its former address. */
void *ActorModeNibble_DestroyAndFree(void *self)
{
    ActorDerivedRuntime_DestroyAlternate(self);
    Heap_Free(self);
    return self;
}
