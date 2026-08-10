#include "tingle/types.h"

/* Release reference-counted character and palette resources from caches. */

typedef struct GraphicsCachedResource GraphicsCachedResource;
typedef struct GraphicsCachedResourceVtable {
    void (*destroy)(GraphicsCachedResource *self);
    void (*destroyAndFree)(GraphicsCachedResource *self);
} GraphicsCachedResourceVtable;

struct GraphicsCachedResource {
    const GraphicsCachedResourceVtable *vtable;
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
 * Release one character resource from archive cache +0xb4. Nonmembers are
 * ignored; the final reference unlinks the node and invokes its deleting
 * destructor. Returns no value and performs no direct hardware access.
 */
#ifdef __cplusplus
extern "C"
#endif
#ifndef MATCHING
void func_02071bdc(void *archive, GraphicsCachedResource *resource)
{
    void *cache = (u8 *)archive + 0xb4;
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
asm void func_02071bdc(void *archive, GraphicsCachedResource *resource)
{
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    add r0, r5, #0xb4
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
    add r0, r5, #0xb4
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

/*
 * Release one palette resource from archive cache +0xc0. Nonmembers are
 * ignored; the final reference unlinks the node and invokes its deleting
 * destructor. Returns no value and performs no direct hardware access.
 */
#ifdef __cplusplus
extern "C"
#endif
#ifndef MATCHING
void func_02071c38(void *archive, GraphicsCachedResource *resource)
{
    void *cache = (u8 *)archive + 0xc0;
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
asm void func_02071c38(void *archive, GraphicsCachedResource *resource)
{
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    add r0, r5, #0xc0
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
    add r0, r5, #0xc0
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
