#include "tingle/graphics_animation_instance.h"

/*
 * Ownership and list operations for 0x5c-byte graphics animation instances.
 * A 0x28-byte manager retains an external owner, maintains a doubly linked
 * list through instance offsets 0x04/0x08, and delegates instance allocation,
 * destruction, and rendering to adjacent subsystem helpers.
 */

#ifdef __cplusplus
extern "C" {
#endif

#ifdef __cplusplus
}
#endif

/*
 * Remove instance from the manager stored in instance->owner, then destroy it
 * through that manager's external owner. The instance and manager must be
 * valid; list membership is a caller invariant. No value is returned.
 */
void func_02077220(GraphicsAnimationInstance *instance)
{
    GraphicsAnimationInstanceManager *manager =
        (GraphicsAnimationInstanceManager *)instance->owner;

    func_020772d0(manager, instance);
    func_020777ac((struct Graphics3DResourceOwner *)manager->owner, instance);
}

/*
 * Return the 16-bit duration of the currently selected sequence. Resource
 * pointers and animationIndex must be valid; state and hardware are unchanged.
 */
u16 func_02077248(GraphicsAnimationInstance *instance)
{
    return instance->resource->sequences[instance->animationIndex].duration;
}

/*
 * Initialize an empty manager with owner, null links/opaque fields, count zero,
 * and field_24 set to one. No allocation or hardware access occurs.
 */
#ifndef MATCHING
void func_02077260(GraphicsAnimationInstanceManager *manager, void *owner)
{
    manager->owner = owner;
    manager->next = 0;
    manager->previous = 0;
    manager->tail = 0;
    manager->head = 0;
    manager->count = 0;
    manager->field_20 = 0;
    manager->field_1c = 0;
    manager->field_18 = 0;
    manager->field_24 = 1;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void func_02077260(GraphicsAnimationInstanceManager *manager, void *owner)
{
    str r1, [r0]
    mov r2, #0
    str r2, [r0, #8]
    str r2, [r0, #4]
    str r2, [r0, #0x10]
    str r2, [r0, #0xc]
    str r2, [r0, #0x14]
    str r2, [r0, #0x20]
    str r2, [r0, #0x1c]
    str r2, [r0, #0x18]
    mov r1, #1
    str r1, [r0, #0x24]
    bx lr
}
#endif

/*
 * Append non-null instance at the tail, repairing the empty-list head, writing
 * both node links, and incrementing count. Ownership/allocation is unchanged.
 */
#ifndef MATCHING
void func_02077294(GraphicsAnimationInstanceManager *manager,
                   GraphicsAnimationInstance *instance)
{
    GraphicsAnimationInstance *tail;

    if (instance == 0) {
        return;
    }
    tail = manager->tail;
    if (manager->head == 0) {
        manager->head = instance;
    } else {
        tail->field_08 = instance;
    }
    instance->field_04 = tail;
    manager->tail = instance;
    instance->field_08 = 0;
    manager->count++;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void func_02077294(GraphicsAnimationInstanceManager *manager,
                       GraphicsAnimationInstance *instance)
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
 * Unlink non-null instance from manager's doubly linked list, repair head and
 * tail, and decrement count. Retail leaves the removed node links unchanged;
 * it neither destroys the instance nor validates membership.
 */
#ifndef MATCHING
void func_020772d0(GraphicsAnimationInstanceManager *manager,
                   GraphicsAnimationInstance *instance)
{
    GraphicsAnimationInstance *previous;
    GraphicsAnimationInstance *next;

    if (instance == 0) {
        return;
    }
    previous = instance->field_04;
    next = instance->field_08;
    if (previous != 0) {
        previous->field_08 = next;
    } else {
        manager->head = next;
    }
    if (next != 0) {
        next->field_04 = previous;
    } else {
        manager->tail = previous;
    }
    manager->count--;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void func_020772d0(GraphicsAnimationInstanceManager *manager,
                       GraphicsAnimationInstance *instance)
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
 * Allocate/initialize an instance through the external owner using the three
 * creation words, append the returned node, and return it. The manager address
 * is passed to the allocator as the new instance owner. Retail does not reject
 * a null allocation before append returns it.
 */
GraphicsAnimationInstance *func_02077308(
    GraphicsAnimationInstanceManager *manager,
    const GraphicsAnimationCreateParams *params)
{
    GraphicsAnimationInstance *instance =
        func_02077734((struct Graphics3DResourceOwner *)manager->owner,
                      (void *)params->field_00, (void *)params->field_04,
                      (GraphicsAnimationResource *)params->field_08, manager);

    func_02077294(manager, instance);
    return instance;
}

/*
 * Unlink instance and destroy it through manager's external owner. Null is
 * accepted by unlink but still forwarded to the destruction helper.
 */
void func_0207733c(GraphicsAnimationInstanceManager *manager,
                   GraphicsAnimationInstance *instance)
{
    func_020772d0(manager, instance);
    func_020777ac((struct Graphics3DResourceOwner *)manager->owner, instance);
}

/*
 * Destroy every instance in list order, caching next before unlink/destruction,
 * then explicitly clear both endpoints and count. External owner callbacks are
 * the only possible allocator or graphics side effects.
 */
void func_0207735c(GraphicsAnimationInstanceManager *manager)
{
    GraphicsAnimationInstance *instance = manager->head;

    while (instance != 0) {
        GraphicsAnimationInstance *next =
            instance->field_08;

        func_020772d0(manager, instance);
        func_020777ac((struct Graphics3DResourceOwner *)manager->owner, instance);
        instance = next;
    }
    manager->tail = 0;
    manager->head = 0;
    manager->count = 0;
}

/* Advance every linked instance once in list order; list mutation is not guarded. */
void func_020773a8(GraphicsAnimationInstanceManager *manager)
{
    GraphicsAnimationInstance *instance;

    for (instance = manager->head; instance != 0;
         instance = instance->field_08) {
        func_02076ca0(instance);
    }
}

/*
 * If instance is non-null, forward it and params to the owner's resource
 * rebinding helper. The manager itself is unchanged.
 */
void func_020773cc(GraphicsAnimationInstanceManager *manager,
                   GraphicsAnimationInstance *instance,
                   const GraphicsAnimationCreateParams *params)
{
    if (instance == 0) {
        return;
    }
    func_020777e8((struct Graphics3DResourceOwner *)manager->owner, instance,
                  params);
}
