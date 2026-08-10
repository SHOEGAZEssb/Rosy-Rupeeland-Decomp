#include "tingle/types.h"

/* Release reference-counted screen-map resources from the archive cache. */

typedef struct GraphicsCachedScreen GraphicsCachedScreen;
typedef struct GraphicsCachedScreenVtable {
    void (*destroy)(GraphicsCachedScreen *self);
    void (*destroyAndFree)(GraphicsCachedScreen *self);
} GraphicsCachedScreenVtable;

struct GraphicsCachedScreen {
    const GraphicsCachedScreenVtable *vtable;
    u8 field_04[0x18];
    u16 referenceCount;
};

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_020702b8(void *cache, void *node);
extern void func_02070280(void *cache, void *node);
#ifdef __cplusplus
}
#endif

/*
 * Release one background screen map from archive cache +0xd8. Nonmembers are
 * ignored; the final reference unlinks the node and invokes its deleting
 * destructor. Returns no value and performs no direct GX operation.
 */
#ifdef __cplusplus
extern "C"
#endif
#ifndef MATCHING
void func_02071cf0(void *archive, GraphicsCachedScreen *resource)
{
    void *cache = (u8 *)archive + 0xd8;
    if (func_020702b8(cache, resource) == 0)
        return;
    resource->referenceCount--;
    if (resource->referenceCount != 0)
        return;
    func_02070280(cache, resource);
    if (resource != 0)
        resource->vtable->destroyAndFree(resource);
}
#else
/* This fallback implements the documented portable release directly above. */
asm void func_02071cf0(void *archive, GraphicsCachedScreen *resource)
{
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    add r0, r5, #0xd8
    mov r4, r1
    bl func_020702b8
    cmp r0, #0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0x1c]
    sub r0, r0, #1
    strh r0, [r4, #0x1c]
    ldrh r0, [r4, #0x1c]
    cmp r0, #0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r1, r4
    add r0, r5, #0xd8
    bl func_02070280
    cmp r4, #0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r4
    ldr r1, [r0]
    ldr r1, [r1, #4]
    blx r1
    ldmia sp!, {r3, r4, r5, pc}
}
#endif
