#include "tingle/touch_region.h"

/*
 * Rectangle-based touch targets and their owning manager. A region stores an
 * integer result, an enable bit, and a short-lived pressed state dispatched
 * through virtual hooks. The manager owns a heap array and the region objects
 * placed in it, performs point hit tests, advances every registered target,
 * and broadcasts enable or notification changes.
 */

#define TOUCH_REGION_FLAG_ENABLED 0x01
#define TOUCH_REGION_STATE_PRESSED 1
#define TOUCH_REGION_PRESS_TICKS 10

#ifdef __cplusplus
extern "C" {
#endif

extern void *Heap_AllocAlternateEntry(u32 size, const char *tag, s32 alignment, void *heap);
extern void Heap_Free(void *allocation);
extern void Heap_FreeAlternateEntry(void *allocation);
extern const char data_020d3fc8[];
extern u8 gHeapContext[];
extern const TouchRegionVTable gTouchRegionVTable;
extern const void *gTouchRegionManagerVTable[];

#ifdef __cplusplus
}
#endif

/* Accept an object pointer and intentionally perform no destruction work. */
void NoOpDestructor(void *object)
{
    (void)object;
}

/* Initialize a region with its result value, bounds, and initial enable bit. */
TouchRegion *TouchRegion_Init(TouchRegion *region, s32 value,
                              const RectS16 *bounds, s32 enabled)
{
    region->vtable = &gTouchRegionVTable;
    region->value = value;
    region->pressState = 0;
    region->flags = 0;
    region->countdown = 0;
    RectS16_Copy(&region->bounds, bounds);
    TouchRegion_SetEnabled(region, enabled);
    return region;
}

/* Copy all four signed rectangle edges; no allocation or SDK state is used. */
void RectS16_Copy(RectS16 *destination, const RectS16 *source)
{
    destination->left = source->left;
    destination->top = source->top;
    destination->right = source->right;
    destination->bottom = source->bottom;
}

/* Base destructor; the region owns no subordinate storage and returns this. */
TouchRegion *TouchRegion_Destroy(TouchRegion *region)
{
    return region;
}

/* Free a region through the game heap and return its former address. */
TouchRegion *TouchRegion_DestroyAndFree(TouchRegion *region)
{
    Heap_Free(region);
    return region;
}

/* Empty helper used by overlay-side temporary objects of an unknown type. */
void TemporaryObject_NoOpDestructor(void *object)
{
    (void)object;
}

/* Return whether (x,y) lies in the half-open bounds [left,right)x[top,bottom). */
#ifndef MATCHING
s32 TouchRegion_ContainsPoint(const TouchRegion *region, s32 x, s32 y)
{
    return y < region->bounds.bottom && y >= region->bounds.top &&
           x >= region->bounds.left && x < region->bounds.right;
}
#else
/* Preserve the original eager normalization and conjunction order. */
asm s32 TouchRegion_ContainsPoint(const TouchRegion *region, s32 x, s32 y)
{
    ldrsh r3, [r0, #0x1a]
    cmp r2, r3
    ldrsh r3, [r0, #0x16]
    movlt r12, #1
    movge r12, #0
    cmp r2, r3
    ldrsh r2, [r0, #0x14]
    movge r3, #1
    movlt r3, #0
    cmp r1, r2
    movge r2, #1
    ldrsh r0, [r0, #0x18]
    movlt r2, #0
    cmp r1, r0
    movlt r0, #1
    movge r0, #0
    and r0, r2, r0
    and r0, r3, r0
    and r0, r12, r0
    bx lr
}
#endif

/* Begin a ten-tick press lifetime and immediately run the virtual tick hook. */
void TouchRegion_BeginPress(TouchRegion *region)
{
    region->countdown = TOUCH_REGION_PRESS_TICKS;
    region->pressState = TOUCH_REGION_STATE_PRESSED;
    region->vtable->tick(region);
}

/* Clear the pressed state and immediately run the virtual tick hook. */
void TouchRegion_EndPress(TouchRegion *region)
{
    region->pressState = 0;
    region->vtable->tick(region);
}

/* Set or clear the region's point-selection enable bit, preserving other flags. */
void TouchRegion_SetEnabled(TouchRegion *region, s32 enabled)
{
    if (enabled)
        region->flags |= TOUCH_REGION_FLAG_ENABLED;
    else
        region->flags &= ~TOUCH_REGION_FLAG_ENABLED;
}

/* Count down a pressed region and invoke its virtual end hook after expiry. */
#ifndef MATCHING
void TouchRegion_Tick(TouchRegion *region)
{
    if (region->pressState != TOUCH_REGION_STATE_PRESSED)
        return;

    region->countdown--;
    if (region->countdown < 0)
        region->vtable->endPress(region);
}
#else
/* Retain the compiler's explicit state-to-Boolean normalization. */
asm void TouchRegion_Tick(TouchRegion *region)
{
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #8]
    cmp r1, #1
    moveq r1, #1
    movne r1, #0
    cmp r1, #0
    ldmeqia sp!, {r3, pc}
    ldr r1, [r0, #0x10]
    subs r1, r1, #1
    str r1, [r0, #0x10]
    ldmplia sp!, {r3, pc}
    ldr r1, [r0]
    ldr r1, [r1, #0x10]
    blx r1
    ldmia sp!, {r3, pc}
}
#endif

/* Default notification hook; subclasses may consume the supplied value. */
void TouchRegion_Notify(TouchRegion *region, s32 value)
{
    (void)region;
    (void)value;
}

/* Initialize an empty, enabled manager and return this. */
TouchRegionManager *TouchRegionManager_Init(TouchRegionManager *manager)
{
    manager->vtable = gTouchRegionManagerVTable;
    manager->regions.items = 0;
    manager->regions.capacity = 0;
    manager->count = 0;
    manager->flags = 0;
    TouchRegionManager_SetEnabled(manager, 1);
    return manager;
}

/* Reset allocated array storage when present and return the array wrapper. */
TouchRegionArray *TouchRegionArray_Destroy(TouchRegionArray *array)
{
    if (array->items != 0)
        TouchRegionArray_Reset(array);
    return array;
}

/* Free the pointer array, clear its pointer, and zero its capacity. */
void TouchRegionArray_Reset(TouchRegionArray *array)
{
    if (array->items != 0) {
        Heap_FreeAlternateEntry(array->items);
        array->items = 0;
    }
    array->capacity = 0;
}

/* Delete owned regions, release the pointer array, and return this. */
TouchRegionManager *TouchRegionManager_Destroy(TouchRegionManager *manager)
{
    manager->vtable = gTouchRegionManagerVTable;
    TouchRegionManager_Clear(manager);
    TouchRegionArray_Destroy(&manager->regions);
    return manager;
}

/* Destroy and free a manager, returning its former address. */
TouchRegionManager *TouchRegionManager_DestroyAndFree(TouchRegionManager *manager)
{
    manager->vtable = gTouchRegionManagerVTable;
    TouchRegionManager_Clear(manager);
    TouchRegionArray_Destroy(&manager->regions);
    Heap_Free(manager);
    return manager;
}

/* Replace the array with capacity null slots allocated from the game heap. */
void TouchRegionManager_Allocate(TouchRegionManager *manager, s32 capacity)
{
    s32 i;

    TouchRegionArray_Reset(&manager->regions);
    if (manager->regions.items != 0)
        TouchRegionArray_Reset(&manager->regions);
    manager->regions.items = (TouchRegion **)Heap_AllocAlternateEntry(
        capacity * sizeof(TouchRegion *), data_020d3fc8, 4, gHeapContext);
    manager->regions.capacity = capacity;
    for (i = 0; i < capacity; i++)
        manager->regions.items[i] = 0;
}

/* Append a region pointer and increment the active count; capacity is caller-owned. */
void TouchRegionManager_Add(TouchRegionManager *manager, TouchRegion *region)
{
    manager->regions.items[manager->count] = region;
    manager->count++;
}

/* Delete every non-null slot across capacity, null it, and clear active count. */
#ifndef MATCHING
void TouchRegionManager_Clear(TouchRegionManager *manager)
{
    s32 i;

    for (i = 0; i < manager->regions.capacity; i++) {
        TouchRegion *region = manager->regions.items[i];
        if (region != 0) {
            if (region != 0)
                region->vtable->destroyAndFree(region);
            manager->regions.items[i] = 0;
        }
    }
    manager->count = 0;
}
#else
/* Preserve the redundant null guard emitted for the virtual delete expression. */
asm void TouchRegionManager_Clear(TouchRegionManager *manager)
{
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, #0
    mov r4, r0
    mov r5, r6
    b check
loop:
    ldr r0, [r4, #4]
    ldr r0, [r0, r6, lsl #2]
    cmp r0, #0
    beq next
    beq clear_slot
    ldr r1, [r0]
    ldr r1, [r1, #4]
    blx r1
clear_slot:
    ldr r0, [r4, #4]
    str r5, [r0, r6, lsl #2]
next:
    add r6, r6, #1
check:
    ldr r0, [r4, #8]
    cmp r6, r0
    blt loop
    mov r0, #0
    str r0, [r4, #0xc]
    ldmia sp!, {r4, r5, r6, pc}
}
#endif

/* Activate the first enabled region containing (x,y), returning its stored value. */
#ifndef MATCHING
s32 TouchRegionManager_BeginPressAt(TouchRegionManager *manager, s32 x, s32 y)
{
    s32 i;

    if (manager->flags & TOUCH_REGION_FLAG_ENABLED) {
        for (i = 0; i < manager->count; i++) {
            TouchRegion *region = manager->regions.items[i];
            if (TouchRegion_ContainsPoint(region, x, y) &&
                (region->flags & TOUCH_REGION_FLAG_ENABLED)) {
                region->vtable->beginPress(region);
                return region->value;
            }
        }
    }
    return -1;
}
#else
/* Match the address-based array reloads around the virtual press call. */
asm s32 TouchRegionManager_BeginPressAt(TouchRegionManager *manager, s32 x, s32 y)
{
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldr r0, [r7, #0x10]
    mov r6, r1
    mov r5, r2
    tst r0, #1
    beq no_match
    mov r4, #0
    b check
loop:
    ldr r0, [r7, #4]
    mov r1, r6
    ldr r0, [r0, r4, lsl #2]
    mov r2, r5
    bl TouchRegion_ContainsPoint
    cmp r0, #0
    beq next
    ldr r0, [r7, #4]
    ldr r0, [r0, r4, lsl #2]
    ldr r1, [r0, #0xc]
    tst r1, #1
    beq next
    ldr r1, [r0]
    ldr r1, [r1, #0xc]
    blx r1
    ldr r0, [r7, #4]
    ldr r0, [r0, r4, lsl #2]
    ldr r0, [r0, #4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
next:
    add r4, r4, #1
check:
    ldr r0, [r7, #0xc]
    cmp r4, r0
    blt loop
no_match:
    mvn r0, #0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
}
#endif

/* End each pressed region no longer containing (x,y); always return -1. */
#ifndef MATCHING
s32 TouchRegionManager_EndPressOutside(TouchRegionManager *manager, s32 x, s32 y)
{
    s32 i;

    if (manager->flags & TOUCH_REGION_FLAG_ENABLED) {
        for (i = 0; i < manager->count; i++) {
            TouchRegion *region = manager->regions.items[i];
            if (region->pressState == TOUCH_REGION_STATE_PRESSED &&
                !TouchRegion_ContainsPoint(region, x, y))
                region->vtable->endPress(region);
        }
    }
    return -1;
}
#else
/* Preserve the explicit pressed-state normalization used by the original. */
asm s32 TouchRegionManager_EndPressOutside(TouchRegionManager *manager, s32 x, s32 y)
{
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r9, r0
    ldr r0, [r9, #0x10]
    mov r8, r1
    mov r7, r2
    tst r0, #1
    beq done
    mov r6, #0
    mov r4, r6
    mov r5, #1
    b check
loop:
    ldr r0, [r9, #4]
    ldr r0, [r0, r6, lsl #2]
    ldr r1, [r0, #8]
    cmp r1, #1
    moveq r1, r5
    movne r1, r4
    cmp r1, #0
    beq next
    mov r1, r8
    mov r2, r7
    bl TouchRegion_ContainsPoint
    cmp r0, #0
    bne next
    ldr r0, [r9, #4]
    ldr r0, [r0, r6, lsl #2]
    ldr r1, [r0]
    ldr r1, [r1, #0x10]
    blx r1
next:
    add r6, r6, #1
check:
    ldr r0, [r9, #0xc]
    cmp r6, r0
    blt loop
done:
    mvn r0, #0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
}
#endif

/* Invoke the virtual per-tick hook of every registered region. */
void TouchRegionManager_Tick(TouchRegionManager *manager)
{
    s32 i;

    for (i = 0; i < manager->count; i++)
        manager->regions.items[i]->vtable->tick(manager->regions.items[i]);
}

/* Set the manager enable bit and propagate the same setting to all regions. */
void TouchRegionManager_SetEnabled(TouchRegionManager *manager, s32 enabled)
{
    s32 i;

    if (enabled)
        manager->flags |= TOUCH_REGION_FLAG_ENABLED;
    else
        manager->flags &= ~TOUCH_REGION_FLAG_ENABLED;

    for (i = 0; i < manager->count; i++) {
        TouchRegion *region = manager->regions.items[i];
        if (region != 0)
            TouchRegion_SetEnabled(region, enabled);
    }
}

/* Broadcast value through the last virtual hook of every non-null region. */
void TouchRegionManager_NotifyAll(TouchRegionManager *manager, s32 value)
{
    s32 i;

    for (i = 0; i < manager->count; i++) {
        TouchRegion *region = manager->regions.items[i];
        if (region != 0)
            region->vtable->notify(region, value);
    }
}
