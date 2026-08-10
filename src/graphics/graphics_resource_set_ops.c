#include "tingle/graphics_resources.h"

/*
 * Teardown and graphics-application operations for a three-part resource set.
 * The code releases offset-0x04 allocations and forwards the numbered handles
 * to two distinct low-level paths. Their concrete formats remain unconfirmed,
 * so address-derived names and offsets are preserved.
 */

/* Only the offset-0x04 member is accessed here during resource teardown. */
typedef struct GraphicsResourceHandle {
    u32 field_00;
    void *field_04;
} GraphicsResourceHandle;

#ifdef __cplusplus
extern "C" {
#endif

extern void func_02071bdc(void *allocation);
extern void func_02071c38(void *allocation);
extern void func_02071cf0(void *allocation);
extern void func_02070638(void *resource, s32 value, s32 zero);
extern void func_02070b50(void *resource, s32 value);
extern void func_02070e0c(void *resource, s32 value, s32 zero);
extern void func_020706c4(void *resource, s32 value, s32 zero);
extern void func_02070bc4(void *resource, s32 value);
extern void func_02070eac(void *resource, s32 value, s32 zero);

#ifdef __cplusplus
}
#endif

/*
 * Release the offset-0x04 allocation in each owned handle, then clear all
 * three pointers. A null resource0 marks the entire set empty and causes no
 * state change; the teardown helpers may affect graphics-library ownership.
 */
#ifndef MATCHING
void GraphicsResourceSet_ReleaseHandles(GraphicsResourceSet *set)
{
    GraphicsResourceHandle *resource0 =
        (GraphicsResourceHandle *)set->resource0;
    GraphicsResourceHandle *resource1;
    GraphicsResourceHandle *resource2;

    if (resource0 == 0) {
        return;
    }

    func_02071bdc(resource0->field_04);
    resource1 = (GraphicsResourceHandle *)set->resource1;
    func_02071c38(resource1->field_04);
    resource2 = (GraphicsResourceHandle *)set->resource2;
    func_02071cf0(resource2->field_04);
    set->resource0 = 0;
    set->resource1 = 0;
    set->resource2 = 0;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void GraphicsResourceSet_ReleaseHandles(GraphicsResourceSet *set)
{
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0]
    cmp r1, #0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r1, #4]
    bl func_02071bdc
    ldr r1, [r4, #4]
    ldr r0, [r1, #4]
    bl func_02071c38
    ldr r1, [r4, #8]
    ldr r0, [r1, #4]
    bl func_02071cf0
    mov r0, #0
    str r0, [r4, #0]
    str r0, [r4, #4]
    str r0, [r4, #8]
    ldmia sp!, {r4, pc}
}
#endif

/*
 * Forward set and the two caller values through the first confirmed graphics
 * setup path. resource0/resource2 receive value0 plus a zero flag, while
 * resource1 receives value1; the downstream helpers mutate graphics state.
 */
void func_02072048(GraphicsResourceSet *set, s32 value0, s32 value1)
{
    func_02070638(set->resource0, value0, 0);
    func_02070b50(set->resource1, value1);
    func_02070e0c(set->resource2, value0, 0);
}

/*
 * Forward set and the two caller values through the second confirmed graphics
 * application path. The argument routing matches func_02072048; downstream
 * helpers update graphics-library and potentially display-engine state.
 */
void GraphicsResourceSet_Apply(GraphicsResourceSet *set, s32 value0,
                               s32 value1)
{
    func_020706c4(set->resource0, value0, 0);
    func_02070bc4(set->resource1, value1);
    func_02070eac(set->resource2, value0, 0);
}
