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
    u32 field_18;
    u32 field_1c;
    u32 field_20;
} GraphicsSpriteGroup;

typedef struct GraphicsSpriteSource3 {
    void *field_00;
    void *field_04;
    void *field_08;
} GraphicsSpriteSource3;

typedef char GraphicsSpriteGroupSizeCheck[
    sizeof(GraphicsSpriteGroup) == 0x24 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

void GraphicsSpriteState_ReleaseResources(GraphicsSpriteState *state);
void GraphicsSpriteState_PrepareResources(GraphicsSpriteState *state);
void func_02073ef8(GraphicsSpriteState *state);
GraphicsSpriteGroup *GraphicsSpriteGroup_Init(GraphicsSpriteGroup *group,
                                              void *owner);
void GraphicsSpriteGroup_AppendState(GraphicsSpriteGroup *group,
                                     GraphicsSpriteState *state);
void GraphicsSpriteGroup_RemoveState(GraphicsSpriteGroup *group,
                                     GraphicsSpriteState *state);
GraphicsSpriteState *func_02073fc4(GraphicsSpriteGroup *group, void *field14,
                                    void *field18, void *field1c, u8 attach);
GraphicsSpriteState *func_02073ffc(GraphicsSpriteGroup *group,
                                    const GraphicsSpriteSource3 *source,
                                    u8 attach);
void func_02074038(GraphicsSpriteGroup *group, GraphicsSpriteState *state);
void func_02074058(GraphicsSpriteGroup *group);
void func_020740a4(GraphicsSpriteGroup *group);
void func_020740c8(GraphicsSpriteGroup *group, GraphicsSpriteState *state,
                   void *field14, void *field18, void *field1c);
void func_020740e8(GraphicsSpriteGroup *group, GraphicsSpriteState *state,
                   const GraphicsSpriteSource3 *source);
void func_02074110(GraphicsSpriteGroup *group);
void GraphicsSpriteGroup_ReleaseResources(GraphicsSpriteGroup *group);
void GraphicsSpriteGroup_PrepareResources(GraphicsSpriteGroup *group);
void func_0207419c(GraphicsSpriteGroup *group);
void GraphicsSpriteState_InitGlobalPool(void);
GraphicsSpriteGroup *func_020742cc(void *owner);
void func_02074330(void *owner, GraphicsSpriteGroup *group);

#ifdef __cplusplus
}
#endif

#endif
