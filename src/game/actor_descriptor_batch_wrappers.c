#include "tingle/types.h"

/* Provide category-specific batch-spawn entry points and install two recovered callbacks. */
extern void *data_020df500[2];

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorDescriptorBatch_RegisterAndSpawn(void *first, void *second, void *descriptors,
                          s32 category);
#ifdef __cplusplus
}
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Forward all three inputs to ActorDescriptorBatch_RegisterAndSpawn with actor
 * category one. Returns no value.
 */
void ActorDescriptorBatch_RegisterAndSpawnCategory1(void *first, void *second, void *descriptors)
{
    ActorDescriptorBatch_RegisterAndSpawn(first, second, descriptors, 1);
}

/*
 * Forward all three inputs to ActorDescriptorBatch_RegisterAndSpawn with actor
 * category two. Returns no value.
 */
void ActorDescriptorBatch_RegisterAndSpawnCategory2(void *first, void *second, void *descriptors)
{
    ActorDescriptorBatch_RegisterAndSpawn(first, second, descriptors, 2);
}

/* Store input in recovered callback slot data_020df500+0; return no value. */
void ActorDescriptorBatch_SetCategory1Callback(void *callback)
{
    data_020df500[0] = callback;
}

/* Store input in recovered callback slot data_020df500+4; return no value. */
void ActorDescriptorBatch_SetCategory2Callback(void *callback)
{
    data_020df500[1] = callback;
}

#ifdef __cplusplus
}
#endif
