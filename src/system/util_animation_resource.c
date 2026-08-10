#include "tingle/util_animation_resource.h"
#include "tingle/heap.h"

/*
 * CUtilAnmRes lifecycle and paired animation-handle construction. The object
 * retains two manager handles created from parallel owners, a selector and
 * origin scalar, and an embedded TouchPoint used as its mutable 2D position.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern AnimationBindingHandle *GraphicsSpriteGroup_CreateState(
    void *owner, void *resource0, void *resource1, void *resource2, u32 variant);

#ifdef __cplusplus
}
#endif

/*
 * Install the CUtilAnmRes vtable, retain selector and origin, initialize the
 * embedded TouchPoint to (0,0), and request one handle from each owner using
 * identical resource and variant inputs. Bit 3 is set on both handle flag
 * words, the point coordinates are explicitly cleared again as in retail,
 * and self is returned. Handle creation is manager-visible SDK state change.
 */
#ifndef MATCHING
UtilAnimationResource *UtilAnimationResource_Init(
    UtilAnimationResource *self, u32 selector, void *owner0, void *owner1,
    u32 variant, void *resource0, void *resource1, void *resource2, s32 origin)
{
    self->vtable = &data_020d4168;
    self->selector = selector;
    self->origin = origin;
    TouchPoint_InitZero(&self->position);

    self->handles[0] = GraphicsSpriteGroup_CreateState(owner0, resource0, resource1, resource2,
                                     variant & 0xff);
    self->handles[0]->flags24 |= 8;
    self->handles[1] = GraphicsSpriteGroup_CreateState(owner1, resource0, resource1, resource2,
                                     variant & 0xff);
    self->handles[1]->flags24 |= 8;
    self->position.y = 0;
    self->position.x = 0;
    return self;
}
#endif

/*
 * Initialize the embedded coordinate object with the shared TouchPoint vtable
 * and zero coordinates, then return it. No touch input or hardware is read.
 */
TouchPoint *TouchPoint_InitZero(TouchPoint *point)
{
    point->vtable = &gSceneTouchInitialData.pointVTable;
    point->x = 0;
    point->y = 0;
    return point;
}

/* Trivial CUtilAnmRes destructor: change no state and return self. */
UtilAnimationResource *UtilAnimationResource_Destroy(UtilAnimationResource *self)
{
    return self;
}

/* Free the CUtilAnmRes object through the game heap and return its former address. */
UtilAnimationResource *UtilAnimationResource_DestroyAndFree(UtilAnimationResource *self)
{
    Heap_Free(self);
    return self;
}
