#include "tingle/heap.h"
#include "tingle/types.h"
#include "tingle/util_animation_resource.h"
#include "tingle/vec_fx32.h"

/*
 * Teardown variants for a overlay-90 participant's paired-sprite presentation
 * owner and its embedded position vector.
 */

typedef struct TitleParticipantPresentation {
    const void *vtable;
    UtilAnimationResource *resource;
    VecFx32Object position;
} TitleParticipantPresentation;

extern const u8 data_ov090_0221cc68[];

/* Destroy the paired animation resource and embedded vector without freeing `self`. */
TitleParticipantPresentation *func_ov090_0221ba6c(
    TitleParticipantPresentation *self)
{
    self->vtable = data_ov090_0221cc68;
    if (self->resource != 0)
        self->resource->vtable->destroyAndFree(self->resource);
    VecFx32Object_Destroy(&self->position);
    return self;
}

/* Destroy the presentation contents, free `self`, and return its original pointer. */
TitleParticipantPresentation *func_ov090_0221baa8(
    TitleParticipantPresentation *self)
{
    self->vtable = data_ov090_0221cc68;
    if (self->resource != 0)
        self->resource->vtable->destroyAndFree(self->resource);
    VecFx32Object_Destroy(&self->position);
    Heap_Free(self);
    return self;
}
