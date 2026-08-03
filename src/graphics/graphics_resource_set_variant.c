#include "tingle/graphics_resources.h"

/*
 * Construction, replacement loading, and teardown for the second recovered
 * three-handle graphics resource set. It shares the first two resource
 * families with GraphicsResourceSet but uses a distinct third loader and
 * destructor; the concrete format is not yet confirmed.
 */

/* Only the offset-0x04 allocation is observed during handle teardown. */
typedef struct GraphicsResourceHandleVariant {
    u32 field_00;
    void *field_04;
} GraphicsResourceHandleVariant;

#ifdef __cplusplus
extern "C" {
#endif

extern void *func_02071568(void *archive, u32 resourceId);
extern void *func_020716bc(void *archive, u32 resourceId);
extern void *func_02071a24(void *archive, u32 resourceId);
extern void func_02071bdc(void *allocation);
extern void func_02071c38(void *allocation);
extern void func_02071da8(void *allocation);

#ifdef __cplusplus
}
#endif

/*
 * Initialize set with three null handles. The set is mutated in place and the
 * function has no return value or direct SDK/hardware effects.
 */
void func_020720c0(GraphicsResourceSet *set)
{
    set->resource0 = 0;
    set->resource1 = 0;
    set->resource2 = 0;
}

/*
 * Release every handle owned by set through func_02072140 and return set. The
 * called teardown helpers may release graphics-library allocations.
 */
GraphicsResourceSet *func_020720d4(GraphicsResourceSet *set)
{
    func_02072140(set);
    return set;
}

/*
 * Replace set's handles with the three IDs loaded from archive. Existing
 * resources are released first when resource0 is non-null. The third handle
 * uses the distinct func_02071a24 family; the function returns no value.
 */
void func_020720e8(GraphicsResourceSet *set, void *archive, u32 resource0Id,
                   u32 resource1Id, u32 resource2Id)
{
    if (set->resource0 != 0) {
        func_02072140(set);
    }

    set->resource0 = func_02071568(archive, resource0Id);
    set->resource1 = func_020716bc(archive, resource1Id);
    set->resource2 = func_02071a24(archive, resource2Id);
}

/*
 * If resource0 is non-null, release the offset-0x04 allocation in all three
 * handles through their resource-family destructors, then clear the set. A
 * null resource0 marks the complete set empty and causes no state change. The
 * function returns no value; the helpers release graphics-library allocations.
 */
#ifndef MATCHING
void func_02072140(GraphicsResourceSet *set)
{
    GraphicsResourceHandleVariant *resource0 =
        (GraphicsResourceHandleVariant *)set->resource0;
    GraphicsResourceHandleVariant *resource1;
    GraphicsResourceHandleVariant *resource2;

    if (resource0 == 0) {
        return;
    }

    func_02071bdc(resource0->field_04);
    resource1 = (GraphicsResourceHandleVariant *)set->resource1;
    func_02071c38(resource1->field_04);
    resource2 = (GraphicsResourceHandleVariant *)set->resource2;
    func_02071da8(resource2->field_04);
    set->resource0 = 0;
    set->resource1 = 0;
    set->resource2 = 0;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void func_02072140(GraphicsResourceSet *set)
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
    bl func_02071da8
    mov r0, #0
    str r0, [r4, #0]
    str r0, [r4, #4]
    str r0, [r4, #8]
    ldmia sp!, {r4, pc}
}
#endif
