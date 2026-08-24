#include "tingle/graphics_sprite_vram_binding.h"
#include "tingle/graphics_transfer_queue.h"

/*
 * Lookup and first-upload management for sprite graphics VRAM bindings. The
 * renderer owns a best-fit allocator at offset 0x448 and a deferred transfer
 * queue at offset 0x1d14; bindings use 128-byte allocator blocks.
 */

typedef struct GraphicsSpriteVramRenderer {
    u8 padding_0000[0x448];
    GraphicsVramAllocator vramAllocator;
    u8 padding_0bd0[0x1144];
    GraphicsTransferQueue transferQueue;
} GraphicsSpriteVramRenderer;

typedef struct GraphicsSpriteGraphicsResource {
    u8 padding_00[0x14];
    void *field_14;
    u8 padding_18[0x0c];
    void *field_24;
} GraphicsSpriteGraphicsResource;

typedef struct GraphicsSpriteStatePoolPrefix {
    u32 count;
    u32 interruptState;
    void *freeHead;
} GraphicsSpriteStatePoolPrefix;

#ifdef __cplusplus
extern "C" {
#endif

extern GraphicsSpriteStatePoolPrefix gGraphicsSpriteStatePool;
extern void func_02070418(void *resource);
extern s32 func_0207043c(void *resource);
extern u32 GX_VBlankIntr(u32 state);

#ifdef __cplusplus
}
#endif

/*
 * Return a shared type-1 binding for resource. An existing binding gains one
 * 16-bit reference. Otherwise lazily prepare the resource, round its positive
 * byte size up to 128-byte blocks, allocate a range, mark it initialized, and
 * queue a transfer from resource offset 0x24 to blockStart * 128. The transfer
 * enqueue is bracketed by the retail interrupt-state helper. Allocator, queue,
 * and resource preparation state may change; allocation failure is outside the
 * retail contract because the returned node is dereferenced immediately.
 */
#ifndef MATCHING
GraphicsVramRangeNode *GraphicsSpriteRenderer_AcquireGraphicsVramBinding(
    void *rendererPointer, void *resourcePointer)
{
    GraphicsSpriteVramRenderer *renderer =
        (GraphicsSpriteVramRenderer *)rendererPointer;
    GraphicsSpriteGraphicsResource *resource =
        (GraphicsSpriteGraphicsResource *)resourcePointer;
    GraphicsVramRangeNode *node =
        GraphicsSpriteRenderer_FindVramBinding(renderer, resource, 1);

    if (node == 0) {
        s32 size;
        s32 blocks;
        u32 interruptState;

        if (resource->field_14 == 0) {
            func_02070418(resource);
        }
        size = func_0207043c(resource);
        blocks = (size + 127) / 128;
        node = GraphicsVramAllocator_Allocate(
            &renderer->vramAllocator, blocks, resource, 1);
        interruptState = GX_VBlankIntr(0);
        gGraphicsSpriteStatePool.interruptState = interruptState;
        node->field_0c = 1;
        size = func_0207043c(resource);
        GraphicsTransferQueue_Enqueue(
            &renderer->transferQueue,
            GRAPHICS_TRANSFER_KIND_OBJECT_CHARACTER,
            resource->field_24,
            (u32)node->blockStart << 7, (u32)size);
        GX_VBlankIntr(gGraphicsSpriteStatePool.interruptState);
    } else {
        node->refCount++;
    }
    return node;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm GraphicsVramRangeNode *GraphicsSpriteRenderer_AcquireGraphicsVramBinding(
    void *renderer, void *resource)
{
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #4
    mov r2, #1
    mov r6, r0
    mov r5, r1
    bl GraphicsSpriteRenderer_FindVramBinding
    movs r4, r0
    bne sprite_vram_binding_retain
    ldr r0, [r5, #0x14]
    cmp r0, #0
    bne sprite_vram_binding_prepared
    mov r0, r5
    bl func_02070418
sprite_vram_binding_prepared:
    mov r0, r5
    bl func_0207043c
    mov r1, r0, asr #4
    add r0, r0, r1, lsr #27
    mov r0, r0, asr #5
    add r1, r0, #3
    mov r0, r1, asr #1
    add r0, r1, r0, lsr #30
    mov r0, r0, lsl #14
    add r3, r6, #0x48
    mov r2, r5
    mov r1, r0, lsr #16
    add r0, r3, #0x400
    mov r3, #1
    bl GraphicsVramAllocator_Allocate
    mov r4, r0
    mov r0, #0
    bl GX_VBlankIntr
    ldr r1, =gGraphicsSpriteStatePool
    mov r2, #1
    str r0, [r1, #4]
    strb r2, [r4, #0xc]
    ldrh r7, [r4, #0xe]
    ldr r8, [r5, #0x24]
    mov r0, r5
    bl func_0207043c
    add r1, r6, #0x114
    mov r2, r8
    mov r3, r7, lsl #7
    str r0, [sp]
    add r0, r1, #0x1c00
    mov r1, #1
    bl GraphicsTransferQueue_Enqueue
    ldr r0, =gGraphicsSpriteStatePool
    ldr r0, [r0, #4]
    bl GX_VBlankIntr
    b sprite_vram_binding_done
sprite_vram_binding_retain:
    ldrh r0, [r4, #0x12]
    add r0, r0, #1
    strh r0, [r4, #0x12]
sprite_vram_binding_done:
    mov r0, r4
    add sp, sp, #4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
}
#endif

/*
 * Search the renderer allocator's active address-ordered range list for the
 * first node whose byte-sized type and owner pointer both match. Return that
 * node or null. No state changes and there are no SDK/hardware effects.
 */
#ifndef MATCHING
GraphicsVramRangeNode *GraphicsSpriteRenderer_FindVramBinding(
    void *rendererPointer, void *resource, u8 type)
{
    GraphicsSpriteVramRenderer *renderer =
        (GraphicsSpriteVramRenderer *)rendererPointer;
    GraphicsVramRangeNode *node = renderer->vramAllocator.nodes;

    while (node != 0) {
        if (node->type == type && node->owner == resource) {
            return node;
        }
        node = node->next;
    }
    return 0;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm GraphicsVramRangeNode *GraphicsSpriteRenderer_FindVramBinding(
    void *renderer, void *resource, u8 type)
{
    add r0, r0, #0x48
    add r0, r0, #0x400
    b sprite_vram_binding_find_check
sprite_vram_binding_find_loop:
    ldrb r3, [r0, #0xd]
    cmp r2, r3
    ldreq r3, [r0, #8]
    cmpeq r3, r1
    bxeq lr
    ldr r0, [r0, #4]
sprite_vram_binding_find_check:
    cmp r0, #0
    DCD 0x1AFFFFF7
    bx lr
}
#endif
