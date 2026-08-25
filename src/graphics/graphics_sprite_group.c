#include "tingle/graphics_sprite_group.h"

/*
 * Sprite-group list management and per-group lifecycle dispatch. A group owns
 * a doubly linked sequence of fixed-pool GraphicsSpriteState objects and routes
 * resource preparation, frame advancement, and owner-specific cleanup across
 * that sequence.
 */

typedef struct GraphicsSpriteResource14 {
    u8 padding_00[0x24];
    void *field_24;
} GraphicsSpriteResource14;

typedef struct GraphicsSpriteStatePool {
    u32 liveCount;
    u32 interruptState;
    GraphicsSpriteState *freeHead;
} GraphicsSpriteStatePool;

#ifdef __cplusplus
extern "C" {
#endif

extern GraphicsSpriteStatePool gGraphicsSpriteStatePool;
extern GraphicsSpriteState gGraphicsSpriteStates[];
extern void GraphicsSpriteResource_ReleaseTexture(void *resource);
extern void GraphicsSpriteGraphicsResource_Prepare(void *resource);
extern void GraphicsPaletteResource_ReleaseAllocation(void *resource);
extern void GraphicsSpriteResource_Prepare(void *resource);
extern void GraphicsSpriteAnimationResource_ReleaseAllocation(void *resource);
extern void GraphicsSpriteAnimationResource_Prepare(void *resource);
extern GraphicsSpriteState *GraphicsSpriteStatePool_Allocate(
    void *owner, void *graphicsResource, void *paletteResource,
    void *animationResource, u8 graphicsBindingMode,
    GraphicsSpriteGroup *group);
extern void GraphicsSpriteStatePool_Release(void *owner,
                                            GraphicsSpriteState *state);
extern void GraphicsSpriteState_ReplaceResources(void *owner,
                                                 GraphicsSpriteState *state,
                                                 void *graphicsResource,
                                                 void *paletteResource,
                                                 void *animationResource);
extern void GraphicsSpriteGroupOwner_DestroyGroup(
    void *owner, GraphicsSpriteGroup *group);
extern void GraphicsSpriteRenderer_ReleaseIndexedEntry(void *owner,
                                                       void *allocation);

#ifdef __cplusplus
}
#endif

/*
 * Release or deactivate the three resources referenced at offsets 0x14-0x1c.
 * The first helper may leave a live offset-0x24 allocation; only when it does
 * not, invalidate the attached state byte and release the other two resources.
 * Returns no value and performs resource-manager effects through its callees.
 */
void GraphicsSpriteState_ReleaseResources(GraphicsSpriteState *state)
{
    GraphicsSpriteResource_ReleaseTexture(state->graphicsResource);
    if (((GraphicsSpriteResource14 *)state->graphicsResource)->field_24 != 0) {
        return;
    }
    if (state->graphicsVramBinding != 0) {
        ((u8 *)state->graphicsVramBinding)[0x0c] = 0;
    }
    GraphicsPaletteResource_ReleaseAllocation(state->paletteResource);
    GraphicsSpriteAnimationResource_ReleaseAllocation(state->animationResource);
}

/*
 * Prepare or retain the three resources referenced at offsets 0x14-0x1c in
 * their required family order. State fields are unchanged; resource-manager
 * state may change through the called helpers and no value is returned.
 */
void GraphicsSpriteState_PrepareResources(GraphicsSpriteState *state)
{
    GraphicsSpriteGraphicsResource_Prepare(state->graphicsResource);
    GraphicsSpriteResource_Prepare(state->paletteResource);
    GraphicsSpriteAnimationResource_Prepare(state->animationResource);
}

/*
 * Remove state from its group, then return it to the owning renderer's fixed
 * sprite pool. The state becomes invalid for caller use and no value is
 * returned; allocator/resource effects occur through
 * GraphicsSpriteStatePool_Release.
 */
void GraphicsSpriteState_ReleaseFromGroup(GraphicsSpriteState *state)
{
    GraphicsSpriteGroup *group = state->group;

    GraphicsSpriteGroup_RemoveState(group, state);
    GraphicsSpriteStatePool_Release(group->owner, state);
}

/*
 * Initialize an empty group for owner, clear its links and screen offset, and
 * enable sprite submission. Returns group and performs no allocation or SDK
 * access.
 */
#ifndef MATCHING
GraphicsSpriteGroup *GraphicsSpriteGroup_Init(GraphicsSpriteGroup *group,
                                              void *owner)
{
    group->owner = owner;
    group->next = 0;
    group->previous = 0;
    group->tail = 0;
    group->head = 0;
    group->screenOffsetY = 0;
    group->screenOffsetX = 0;
    group->count = 0;
    group->renderEnabled = 1;
    return group;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm GraphicsSpriteGroup *GraphicsSpriteGroup_Init(GraphicsSpriteGroup *group,
                                                  void *owner)
{
    str r1, [r0, #0]
    mov r2, #0
    str r2, [r0, #8]
    str r2, [r0, #4]
    str r2, [r0, #0x10]
    str r2, [r0, #0xc]
    str r2, [r0, #0x1c]
    str r2, [r0, #0x18]
    str r2, [r0, #0x14]
    mov r1, #1
    str r1, [r0, #0x20]
    bx lr
}
#endif

/*
 * Append a non-null state to the group tail, update both directions of the
 * list, and increment count. A null state is ignored; no resources are touched.
 */
#ifndef MATCHING
void GraphicsSpriteGroup_AppendState(GraphicsSpriteGroup *group,
                                     GraphicsSpriteState *state)
{
    if (state == 0) {
        return;
    }
    if (group->head != 0) {
        group->tail->nextOrFree = state;
    } else {
        group->head = state;
    }
    state->previous = group->tail;
    group->tail = state;
    state->nextOrFree = 0;
    group->count++;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void GraphicsSpriteGroup_AppendState(GraphicsSpriteGroup *group,
                                         GraphicsSpriteState *state)
{
    cmp r1, #0
    bxeq lr
    ldr r2, [r0, #0xc]
    ldr r3, [r0, #0x10]
    cmp r2, #0
    strne r1, [r3, #8]
    streq r1, [r0, #0xc]
    str r3, [r1, #4]
    str r1, [r0, #0x10]
    mov r3, #0
    str r3, [r1, #8]
    ldr r1, [r0, #0x14]
    add r1, r1, #1
    str r1, [r0, #0x14]
    bx lr
}
#endif

/*
 * Unlink a non-null state from the group, repairing head and tail as needed,
 * and decrement count. The detached state's link fields are retained exactly
 * as in retail code; no allocation or resource operation occurs here.
 */
#ifndef MATCHING
void GraphicsSpriteGroup_RemoveState(GraphicsSpriteGroup *group,
                                     GraphicsSpriteState *state)
{
    if (state == 0) {
        return;
    }
    if (state->previous != 0) {
        state->previous->nextOrFree = state->nextOrFree;
    } else {
        group->head = state->nextOrFree;
    }
    if (state->nextOrFree != 0) {
        state->nextOrFree->previous = state->previous;
    } else {
        group->tail = state->previous;
    }
    group->count--;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void GraphicsSpriteGroup_RemoveState(GraphicsSpriteGroup *group,
                                         GraphicsSpriteState *state)
{
    cmp r1, #0
    bxeq lr
    ldr r2, [r1, #4]
    ldr r3, [r1, #8]
    cmp r2, #0
    strne r3, [r2, #8]
    streq r3, [r0, #0xc]
    cmp r3, #0
    strne r2, [r3, #4]
    streq r2, [r0, #0x10]
    ldr r1, [r0, #0x14]
    sub r1, r1, #1
    str r1, [r0, #0x14]
    bx lr
}
#endif

/*
 * Allocate/configure a sprite state from the renderer using three resource
 * pointers and graphics-binding policy, append it to group, and return it. Pool
 * exhaustion behavior is inherited from GraphicsSpriteStatePool_Allocate.
 */
GraphicsSpriteState *GraphicsSpriteGroup_CreateState(
    GraphicsSpriteGroup *group, void *graphicsResource, void *paletteResource,
    void *animationResource, u8 graphicsBindingMode)
{
    GraphicsSpriteState *state = GraphicsSpriteStatePool_Allocate(
        group->owner, graphicsResource, paletteResource, animationResource,
        graphicsBindingMode, group);
    GraphicsSpriteGroup_AppendState(group, state);
    return state;
}

/*
 * Vector form of GraphicsSpriteGroup_CreateState: read three resource pointers
 * from source, allocate/configure a state, append it, and return it. Source is
 * not changed.
 */
GraphicsSpriteState *GraphicsSpriteGroup_CreateStateFromSource(
    GraphicsSpriteGroup *group, const GraphicsSpriteSource3 *source,
    u8 graphicsBindingMode)
{
    GraphicsSpriteState *state = GraphicsSpriteStatePool_Allocate(
        group->owner, source->graphicsResource, source->paletteResource,
        source->animationResource, graphicsBindingMode, group);
    GraphicsSpriteGroup_AppendState(group, state);
    return state;
}

/*
 * Detach state from group and return it to the renderer pool. A null state is
 * accepted by the unlink/release helpers; the function returns no value.
 */
void GraphicsSpriteGroup_ReleaseState(GraphicsSpriteGroup *group,
                                      GraphicsSpriteState *state)
{
    GraphicsSpriteGroup_RemoveState(group, state);
    GraphicsSpriteStatePool_Release(group->owner, state);
}

/*
 * Remove and release every state in forward order, caching each next link
 * before release. Reset list endpoints and count to zero. Renderer allocator
 * and resource state change through GraphicsSpriteStatePool_Release; no value
 * is returned.
 */
void GraphicsSpriteGroup_Clear(GraphicsSpriteGroup *group)
{
    GraphicsSpriteState *state = group->head;

    while (state != 0) {
        GraphicsSpriteState *next = state->nextOrFree;
        GraphicsSpriteGroup_RemoveState(group, state);
        GraphicsSpriteStatePool_Release(group->owner, state);
        state = next;
    }
    group->tail = 0;
    group->head = 0;
    group->count = 0;
}

/* Advance every state in list order by one animation tick. */
void GraphicsSpriteGroup_AdvanceAnimations(GraphicsSpriteGroup *group)
{
    GraphicsSpriteState *state = group->head;

    while (state != 0) {
        GraphicsSpriteState_AdvanceAnimation(state);
        state = state->nextOrFree;
    }
}

/*
 * If state is non-null, forward three replacement resource pointers to the
 * owning renderer. Resource releases/reacquisition may occur in the callee.
 */
void GraphicsSpriteGroup_ReplaceStateResources(
    GraphicsSpriteGroup *group, GraphicsSpriteState *state,
    void *graphicsResource, void *paletteResource, void *animationResource)
{
    if (state != 0) {
        GraphicsSpriteState_ReplaceResources(
            group->owner, state, graphicsResource, paletteResource,
            animationResource);
    }
}

/*
 * Vector form of GraphicsSpriteGroup_ReplaceStateResources; source and group
 * links are unchanged.
 */
void GraphicsSpriteGroup_ReplaceStateResourcesFromSource(
    GraphicsSpriteGroup *group, GraphicsSpriteState *state,
    const GraphicsSpriteSource3 *source)
{
    if (state != 0) {
        GraphicsSpriteState_ReplaceResources(
            group->owner, state, source->graphicsResource,
            source->paletteResource, source->animationResource);
    }
}

/*
 * Disable group submission, release every non-null state's indexed palette
 * binding, and null that pointer. Renderer allocation state changes; list
 * links and the states' other resources remain.
 */
void GraphicsSpriteGroup_ReleaseIndexedEntries(GraphicsSpriteGroup *group)
{
    GraphicsSpriteState *state;

    group->renderEnabled = 0;
    state = group->head;
    while (state != 0) {
        if (state->indexedPaletteBinding != 0) {
            GraphicsSpriteRenderer_ReleaseIndexedEntry(group->owner,
                state->indexedPaletteBinding);
            state->indexedPaletteBinding = 0;
        }
        state = state->nextOrFree;
    }
}

/* Release/deactivate each state's three resource families in list order. */
void GraphicsSpriteGroup_ReleaseResources(GraphicsSpriteGroup *group)
{
    GraphicsSpriteState *state = group->head;

    while (state != 0) {
        GraphicsSpriteState_ReleaseResources(state);
        state = state->nextOrFree;
    }
}

/* Prepare/retain each state's three resource families in list order. */
void GraphicsSpriteGroup_PrepareResources(GraphicsSpriteGroup *group)
{
    GraphicsSpriteState *state = group->head;

    while (state != 0) {
        GraphicsSpriteState_PrepareResources(state);
        state = state->nextOrFree;
    }
}

/* Ask the owner to unlink, clear, and free group. The group becomes invalid. */
void GraphicsSpriteGroup_Destroy(GraphicsSpriteGroup *group)
{
    GraphicsSpriteGroupOwner_DestroyGroup(group->owner, group);
}

/*
 * Initialize the global fixed pool of 384 sprite states. Reset the live count,
 * make element zero the free-list head, and chain every element through its
 * offset-0x08 link. Stable state addresses are required; no heap or SDK call is
 * made and the BSS-zeroed final link remains null.
 */
void GraphicsSpriteState_InitGlobalPool(void)
{
    s32 index;

    gGraphicsSpriteStatePool.liveCount = 0;
    gGraphicsSpriteStatePool.freeHead = gGraphicsSpriteStates;
    for (index = 0; index < 383; index++) {
        gGraphicsSpriteStates[index].nextOrFree = &gGraphicsSpriteStates[index + 1];
    }
}
