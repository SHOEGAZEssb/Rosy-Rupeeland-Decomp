#ifndef TINGLE_GRAPHICS_SPRITE_GROUP_H
#define TINGLE_GRAPHICS_SPRITE_GROUP_H

#include "tingle/graphics_sprite_state.h"

/* Owner-scoped list of sprite states; the owner's exact type is still unknown. */
typedef struct GraphicsSpriteGroup {
    void *owner;
    struct GraphicsSpriteGroup *previous;
    struct GraphicsSpriteGroup *next;
    GraphicsSpriteState *head;
    GraphicsSpriteState *tail;
    u32 count;
    s32 screenOffsetX;
    s32 screenOffsetY;
    u32 renderEnabled;
} GraphicsSpriteGroup;

typedef struct GraphicsSpriteSource3 {
    void *graphicsResource;
    void *paletteResource;
    void *animationResource;
} GraphicsSpriteSource3;

typedef char GraphicsSpriteGroupSizeCheck[
    sizeof(GraphicsSpriteGroup) == 0x24 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

void GraphicsSpriteState_ReleaseResources(GraphicsSpriteState *state);
void GraphicsSpriteState_PrepareResources(GraphicsSpriteState *state);
void GraphicsSpriteState_ReleaseFromGroup(GraphicsSpriteState *state);
GraphicsSpriteGroup *GraphicsSpriteGroup_Init(GraphicsSpriteGroup *group,
                                              void *owner);
void GraphicsSpriteGroup_AppendState(GraphicsSpriteGroup *group,
                                     GraphicsSpriteState *state);
void GraphicsSpriteGroup_RemoveState(GraphicsSpriteGroup *group,
                                     GraphicsSpriteState *state);
GraphicsSpriteState *GraphicsSpriteGroup_CreateState(
    GraphicsSpriteGroup *group, void *graphicsResource, void *paletteResource,
    void *animationResource, u8 graphicsBindingMode);
GraphicsSpriteState *GraphicsSpriteGroup_CreateStateFromSource(
    GraphicsSpriteGroup *group, const GraphicsSpriteSource3 *source,
    u8 graphicsBindingMode);
void GraphicsSpriteGroup_ReleaseState(GraphicsSpriteGroup *group,
                                      GraphicsSpriteState *state);
void GraphicsSpriteGroup_Clear(GraphicsSpriteGroup *group);
void GraphicsSpriteGroup_AdvanceAnimations(GraphicsSpriteGroup *group);
void GraphicsSpriteGroup_ReplaceStateResources(
    GraphicsSpriteGroup *group, GraphicsSpriteState *state,
    void *graphicsResource, void *paletteResource, void *animationResource);
void GraphicsSpriteGroup_ReplaceStateResourcesFromSource(
    GraphicsSpriteGroup *group, GraphicsSpriteState *state,
    const GraphicsSpriteSource3 *source);
void GraphicsSpriteGroup_ReleaseIndexedEntries(GraphicsSpriteGroup *group);
void GraphicsSpriteGroup_ReleaseResources(GraphicsSpriteGroup *group);
void GraphicsSpriteGroup_PrepareResources(GraphicsSpriteGroup *group);
void GraphicsSpriteGroup_Destroy(GraphicsSpriteGroup *group);
void GraphicsSpriteState_InitGlobalPool(void);
GraphicsSpriteGroup *GraphicsSpriteGroupOwner_CreateGroup(void *owner);
void GraphicsSpriteGroupOwner_DestroyGroup(void *owner,
                                           GraphicsSpriteGroup *group);

#ifdef __cplusplus
}
#endif

#endif
