#ifndef TINGLE_GRAPHICS_SPRITE_CREATE_H
#define TINGLE_GRAPHICS_SPRITE_CREATE_H

#include "tingle/graphics_sprite_group.h"

/* Resource tuple with an unidentified leading field skipped by creation. */
typedef struct GraphicsSpriteResourceDescriptor {
    void *field_00;
    void *graphicsResource;
    void *paletteResource;
    void *animationResource;
} GraphicsSpriteResourceDescriptor;

#ifdef __cplusplus
extern "C" {
#endif

void GraphicsSpriteState_Configure(GraphicsSpriteState *state, u8 animationIndex,
                   u8 oamPriority, u16 sortOrder, u16 flagsToSet,
                   u16 flagsToClear);
GraphicsSpriteState *GraphicsSpriteState_Create(
    GraphicsSpriteGroup *group,
    const GraphicsSpriteResourceDescriptor *resources,
    u8 animationIndex, u8 oamPriority, u16 sortOrder,
    u16 flagsToSet, u16 flagsToClear);

#ifdef __cplusplus
}
#endif

#endif
