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
    u32 count;
    u32 field_04;
    GraphicsSpriteState *freeHead;
} GraphicsSpriteStatePool;

#ifdef __cplusplus
extern "C" {
#endif

extern GraphicsSpriteStatePool data_021ede68;
extern GraphicsSpriteState data_021edea0[];
extern void func_020703d8(void *resource);
extern void func_02070418(void *resource);
extern void func_02070830(void *resource);
extern void func_02070860(void *resource);
extern void func_02070d38(void *resource);
extern void func_02070d74(void *resource);
extern GraphicsSpriteState *func_020743ac(
    void *owner, void *field14, void *field18, void *field1c,
    u8 attach, GraphicsSpriteGroup *group);
extern void func_0207442c(void *owner, GraphicsSpriteState *state);
extern void func_0207447c(void *owner, GraphicsSpriteState *state,
                          void *field14, void *field18, void *field1c);
extern void func_02074330(void *owner, GraphicsSpriteGroup *group);
extern void func_02074d40(void *owner, void *allocation);

#ifdef __cplusplus
}
#endif

/*
 * Release or deactivate the three resources referenced at offsets 0x14-0x1c.
 * The first helper may leave a live offset-0x24 allocation; only when it does
 * not, invalidate the attached state byte and release the other two resources.
 * Returns no value and performs resource-manager effects through its callees.
 */
void func_02073e90(GraphicsSpriteState *state)
{
    func_020703d8(state->field_14);
    if (((GraphicsSpriteResource14 *)state->field_14)->field_24 != 0) {
        return;
    }
    if (state->field_0c != 0) {
        ((u8 *)state->field_0c)[0x0c] = 0;
    }
    func_02070830(state->field_18);
    func_02070d38(state->animationResource);
}

/*
 * Prepare or retain the three resources referenced at offsets 0x14-0x1c in
 * their required family order. State fields are unchanged; resource-manager
 * state may change through the called helpers and no value is returned.
 */
void func_02073ed4(GraphicsSpriteState *state)
{
    func_02070418(state->field_14);
    func_02070860(state->field_18);
    func_02070d74(state->animationResource);
}

/*
 * Remove state from its group, then return it to the owning renderer's fixed
 * sprite pool. The state becomes invalid for caller use and no value is
 * returned; allocator/resource effects occur through func_0207442c.
 */
void func_02073ef8(GraphicsSpriteState *state)
{
    GraphicsSpriteGroup *group = (GraphicsSpriteGroup *)state->field_00;

    func_02073f8c(group, state);
    func_0207442c(group->owner, state);
}

/*
 * Initialize an empty group for owner, clear all list and opaque fields, and
 * set field_20 to one. Returns group and performs no allocation or SDK access.
 */
#ifndef MATCHING
GraphicsSpriteGroup *func_02073f20(GraphicsSpriteGroup *group, void *owner)
{
    group->owner = owner;
    group->next = 0;
    group->previous = 0;
    group->tail = 0;
    group->head = 0;
    group->field_1c = 0;
    group->field_18 = 0;
    group->count = 0;
    group->field_20 = 1;
    return group;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm GraphicsSpriteGroup *func_02073f20(GraphicsSpriteGroup *group, void *owner)
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
void func_02073f50(GraphicsSpriteGroup *group, GraphicsSpriteState *state)
{
    if (state == 0) {
        return;
    }
    if (group->head != 0) {
        group->tail->field_08 = state;
    } else {
        group->head = state;
    }
    state->field_04 = group->tail;
    group->tail = state;
    state->field_08 = 0;
    group->count++;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void func_02073f50(GraphicsSpriteGroup *group, GraphicsSpriteState *state)
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
void func_02073f8c(GraphicsSpriteGroup *group, GraphicsSpriteState *state)
{
    if (state == 0) {
        return;
    }
    if (state->field_04 != 0) {
        ((GraphicsSpriteState *)state->field_04)->field_08 = state->field_08;
    } else {
        group->head = (GraphicsSpriteState *)state->field_08;
    }
    if (state->field_08 != 0) {
        ((GraphicsSpriteState *)state->field_08)->field_04 = state->field_04;
    } else {
        group->tail = (GraphicsSpriteState *)state->field_04;
    }
    group->count--;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void func_02073f8c(GraphicsSpriteGroup *group, GraphicsSpriteState *state)
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
 * pointers and attach policy, append it to group, and return it. Pool
 * exhaustion behavior is inherited from func_020743ac.
 */
GraphicsSpriteState *func_02073fc4(GraphicsSpriteGroup *group, void *field14,
                                    void *field18, void *field1c, u8 attach)
{
    GraphicsSpriteState *state = func_020743ac(
        group->owner, field14, field18, field1c, attach, group);
    func_02073f50(group, state);
    return state;
}

/*
 * Vector form of func_02073fc4: read three resource pointers from source,
 * allocate/configure a state, append it, and return it. Source is not changed.
 */
GraphicsSpriteState *func_02073ffc(GraphicsSpriteGroup *group,
                                    const GraphicsSpriteSource3 *source,
                                    u8 attach)
{
    GraphicsSpriteState *state = func_020743ac(
        group->owner, source->field_00, source->field_04, source->field_08,
        attach, group);
    func_02073f50(group, state);
    return state;
}

/*
 * Detach state from group and return it to the renderer pool. A null state is
 * accepted by the unlink/release helpers; the function returns no value.
 */
void func_02074038(GraphicsSpriteGroup *group, GraphicsSpriteState *state)
{
    func_02073f8c(group, state);
    func_0207442c(group->owner, state);
}

/*
 * Remove and release every state in forward order, caching each next link
 * before release. Reset list endpoints and count to zero. Renderer allocator
 * and resource state change through func_0207442c; no value is returned.
 */
void func_02074058(GraphicsSpriteGroup *group)
{
    GraphicsSpriteState *state = group->head;

    while (state != 0) {
        GraphicsSpriteState *next = (GraphicsSpriteState *)state->field_08;
        func_02073f8c(group, state);
        func_0207442c(group->owner, state);
        state = next;
    }
    group->tail = 0;
    group->head = 0;
    group->count = 0;
}

/* Advance every state in list order by one animation tick. */
void func_020740a4(GraphicsSpriteGroup *group)
{
    GraphicsSpriteState *state = group->head;

    while (state != 0) {
        GraphicsSpriteState_AdvanceAnimation(state);
        state = (GraphicsSpriteState *)state->field_08;
    }
}

/*
 * If state is non-null, forward three replacement resource pointers to the
 * owning renderer. Resource releases/reacquisition may occur in the callee.
 */
void func_020740c8(GraphicsSpriteGroup *group, GraphicsSpriteState *state,
                   void *field14, void *field18, void *field1c)
{
    if (state != 0) {
        func_0207447c(group->owner, state, field14, field18, field1c);
    }
}

/* Vector form of func_020740c8; source and group links are unchanged. */
void func_020740e8(GraphicsSpriteGroup *group, GraphicsSpriteState *state,
                   const GraphicsSpriteSource3 *source)
{
    if (state != 0) {
        func_0207447c(group->owner, state, source->field_00,
                      source->field_04, source->field_08);
    }
}

/*
 * Clear group field_20, release every non-null state offset-0x10 allocation,
 * and null that pointer. Renderer allocation state changes; list links remain.
 */
void func_02074110(GraphicsSpriteGroup *group)
{
    GraphicsSpriteState *state;

    group->field_20 = 0;
    state = group->head;
    while (state != 0) {
        if (state->field_10 != 0) {
            func_02074d40(group->owner, state->field_10);
            state->field_10 = 0;
        }
        state = (GraphicsSpriteState *)state->field_08;
    }
}

/* Release/deactivate each state's three resource families in list order. */
void func_02074154(GraphicsSpriteGroup *group)
{
    GraphicsSpriteState *state = group->head;

    while (state != 0) {
        func_02073e90(state);
        state = (GraphicsSpriteState *)state->field_08;
    }
}

/* Prepare/retain each state's three resource families in list order. */
void func_02074178(GraphicsSpriteGroup *group)
{
    GraphicsSpriteState *state = group->head;

    while (state != 0) {
        func_02073ed4(state);
        state = (GraphicsSpriteState *)state->field_08;
    }
}

/* Ask the owner to unlink, clear, and free group. The group becomes invalid. */
void func_0207419c(GraphicsSpriteGroup *group)
{
    func_02074330(group->owner, group);
}

/*
 * Initialize the global fixed pool of 384 sprite states. Reset the live count,
 * make element zero the free-list head, and chain every element through its
 * offset-0x08 link. Stable state addresses are required; no heap or SDK call is
 * made and the BSS-zeroed final link remains null.
 */
void func_020741b0(void)
{
    s32 index;

    data_021ede68.count = 0;
    data_021ede68.freeHead = data_021edea0;
    for (index = 0; index < 383; index++) {
        data_021edea0[index].field_08 = &data_021edea0[index + 1];
    }
}
