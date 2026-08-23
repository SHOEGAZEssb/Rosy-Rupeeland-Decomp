#include "tingle/heap.h"
#include "tingle/types.h"

/* Supply signed-byte bounds-center deletion and shared actor virtual defaults. */
#ifdef __cplusplus
extern "C" {
#endif
extern void VecFx32Object_InitCopy(void *destination, const void *source);
#ifdef __cplusplus
}
#endif

/*
 * Free self through the heap and return the original pointer value. This is the
 * confirmed deleting-destructor convention; the returned address no longer
 * owns live storage and must not be dereferenced.
 */
void *S8BoundsCenter_DestroyAndFree(void *self)
{
    Heap_Free(self);
    return self;
}

/*
 * Copy the actor transform at +0x18 into output through VecFx32Object_InitCopy.
 * The auxiliary-interaction context is unused by the base implementation.
 * Returns no value; the vector helper may manage SDK object state.
 */
void Actor_BuildContactPosition(void *output, void *actor,
                                const void *interactionContext)
{
    (void)interactionContext;
    VecFx32Object_InitCopy(output, (const u8 *)actor + 0x18);
}

/* Return no integer-world-unit adjustment to an interaction record's radius. */
s32 Actor_GetInteractionRadiusOffset(void *actor)
{
    (void)actor;
    return 0;
}

/* Mark actor-local state as an AuxiliaryInteraction attaches the actor. */
void Actor_PrepareForAuxiliaryInteraction(void *actor)
{
    *(u32 *)((u8 *)actor + 0xd0) |= 0x80;
}

/* Ignore self and return zero as a second default query result. */
s32 func_02034e44(void *self)
{
    (void)self;
    return 0;
}

/* Base actors are never in the subtype-defined current states nine or ten. */
s32 Actor_IsCurrentState9Or10(void *actor)
{
    (void)actor;
    return 0;
}

/* Base actor frame control has no subtype-specific work. */
void Actor_UpdateFrameControl(void *actor)
{
    (void)actor;
}
