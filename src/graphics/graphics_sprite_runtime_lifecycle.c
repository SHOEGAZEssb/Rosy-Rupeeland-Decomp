#include "tingle/graphics_sprite_runtime_lifecycle.h"

/*
 * Runtime lifecycle helpers at the boundary between the global 384-entry
 * sprite-state pool and the 0x18-byte address-ordered region records used by
 * the following fixed allocator. Both recovered destructors are empty.
 */

enum { GRAPHICS_SPRITE_GLOBAL_STATE_COUNT = 0x180 };

#ifdef __cplusplus
extern "C" {
#endif

extern void __destroy_arr(void *array, u32 count, u32 elementSize,
                          void (*destructor)(void *));
extern GraphicsSpriteState gGraphicsSpriteStates[];

#ifdef __cplusplus
}
#endif

/*
 * No-op destructor for one global GraphicsSpriteState. The input is ignored,
 * no state is changed, and no hardware or SDK operation occurs.
 */
void GraphicsSpriteState_Destroy(GraphicsSpriteState *state)
{
    (void)state;
}

/*
 * Destroy all 384 fixed GraphicsSpriteState records in reverse construction
 * order through the Metrowerks array runtime. Elements currently have a no-op
 * destructor, so observable state is unchanged; the runtime call itself is
 * retained because it is part of global C++ shutdown registration.
 */
void GraphicsSpriteState_DestroyGlobalPool(void)
{
    __destroy_arr(gGraphicsSpriteStates, GRAPHICS_SPRITE_GLOBAL_STATE_COUNT,
                  sizeof(GraphicsSpriteState),
                  (void (*)(void *))GraphicsSpriteState_Destroy);
}

/*
 * Zero every field of the 0x18-byte region descriptor and return region. No
 * allocation, ownership transfer, hardware access, or SDK call
 * occurs.
 */
GraphicsSpriteRegion *GraphicsSpriteRegion_Init(GraphicsSpriteRegion *region)
{
    region->next = 0;
    region->previous = 0;
    region->owner = 0;
    region->size = 0;
    region->offset = 0;
    region->type = 0;
    region->references = 0;
    return region;
}

/*
 * No-op destructor for a region descriptor. The input is ignored, no state
 * changes, and no hardware or SDK operation occurs.
 */
void GraphicsSpriteRegion_Destroy(GraphicsSpriteRegion *region)
{
    (void)region;
}
