#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Recovered lifecycle for an extended actor owning the transform-like value at
 * +0x29c. Two entry points share the same constructor implementation.
 */
extern u8 data_020e08ec[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *ActorExtendedType2_Init(void *actor, const void *configuration);
extern void *ActorExtendedType2_Destroy(void *actor);
extern void VecFx32Object_InitComponents(void *value, s32 x, s32 y, s32 z);
extern void VecFx32Object_Destroy(void *value);
extern s32 ActorExtendedType2_GetDescriptorValue2C(const void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the base actor from configuration, install vtable data_020e08ec,
 * clear halfword +0x298, construct a zero value at +0x29c, and store the
 * descriptor value +0x2c at +0x29a. Return self; actor/owned-value state
 * changes.
 */
void *ActorExtendedTransform_Init(void *self, const void *configuration)
{
    u8 *actor = (u8 *)self;
    ActorExtendedType2_Init(actor, configuration);
    *(void **)actor = data_020e08ec;
    *(u16 *)(actor + 0x298) = 0;
    VecFx32Object_InitComponents(actor + 0x29c, 0, 0, 0);
    *(u16 *)(actor + 0x29a) = (u16)ActorExtendedType2_GetDescriptorValue2C(actor);
    return actor;
}

/* Same inputs, state changes, and return contract as ActorExtendedTransform_Init. */
void *ActorExtendedTransform_InitDuplicate(void *self, const void *configuration)
{
    u8 *actor = (u8 *)self;
    ActorExtendedType2_Init(actor, configuration);
    *(void **)actor = data_020e08ec;
    *(u16 *)(actor + 0x298) = 0;
    VecFx32Object_InitComponents(actor + 0x29c, 0, 0, 0);
    *(u16 *)(actor + 0x29a) = (u16)ActorExtendedType2_GetDescriptorValue2C(actor);
    return actor;
}

/* Finalize +0x29c, invoke the base destructor, and return self. */
void *ActorExtendedTransform_DestroyComplete(void *self)
{
    VecFx32Object_Destroy((u8 *)self + 0x29c);
    ActorExtendedType2_Destroy(self);
    return self;
}

/*
 * Finalize +0x29c, invoke the base destructor, free self, and return the
 * original pointer value. Actor storage becomes invalid after Heap_Free.
 */
void *ActorExtendedTransform_DestroyAndFree(void *self)
{
    VecFx32Object_Destroy((u8 *)self + 0x29c);
    ActorExtendedType2_Destroy(self);
    Heap_Free(self);
    return self;
}

/* Finalize +0x29c, invoke the base destructor, and return self. */
void *ActorExtendedTransform_Destroy(void *self)
{
    VecFx32Object_Destroy((u8 *)self + 0x29c);
    ActorExtendedType2_Destroy(self);
    return self;
}
