#include "tingle/graphics_sprite_renderer.h"

/*
 * Deferred refresh of the renderer's small object-palette resource. The
 * resource supplies one 32-byte source record per indexed-chain descriptor;
 * transfers are appended while the NDS interrupt state is preserved.
 */

typedef struct GraphicsSpritePaletteResourceHeader {
    u8 padding_00[6];
    u16 recordCount;
} GraphicsSpritePaletteResourceHeader;

typedef struct GraphicsSpritePaletteResource {
    u8 padding_00[0x20];
    GraphicsSpritePaletteResourceHeader *header;
} GraphicsSpritePaletteResource;

typedef struct GraphicsSpriteStatePoolPrefix {
    u32 count;
    u32 interruptState;
    void *freeHead;
} GraphicsSpriteStatePoolPrefix;

#ifdef __cplusplus
extern "C" {
#endif

extern GraphicsSpriteStatePoolPrefix data_021ede68;
extern void *func_02070874(void *resource);
extern u32 GX_VBlankIntr(u32 state);

#ifdef __cplusplus
}
#endif

/*
 * Queue one type-2, 32-byte transfer for every record declared by the palette
 * resource at renderer->field_14. Sources are consecutive resource records;
 * each destination is the current indexed descriptor's byte index times 32.
 * The chain and record count are assumed consistent, as retail performs no
 * null or capacity checks. Returns no value; queue state and the shared saved
 * interrupt-state word change, and the prior interrupt state is restored.
 */
#ifndef MATCHING
void func_02075630(GraphicsSpriteRenderer *renderer)
{
    GraphicsSpritePaletteResource *resource =
        (GraphicsSpritePaletteResource *)renderer->field_14;
    GraphicsIndexedChainEntry *entry =
        (GraphicsIndexedChainEntry *)renderer->field_08;
    s32 index;

    data_021ede68.interruptState = GX_VBlankIntr(0);
    for (index = 0; index < resource->header->recordCount; index++) {
        u8 *source = (u8 *)func_02070874(resource) + index * 0x20;

        GraphicsTransferQueue_Enqueue(
            &renderer->transferQueue, 2, source,
            (u32)entry->index << 5, 0x20);
        entry = entry->chainNext;
    }
    GX_VBlankIntr(data_021ede68.interruptState);
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void func_02075630(GraphicsSpriteRenderer *renderer)
{
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r8, r0
    mov r0, #0
    ldr r6, [r8, #0x08]
    bl GX_VBlankIntr
    ldr r1, =data_021ede68
    mov r7, #0
    str r0, [r1, #4]
    add r9, r8, #0x114
    mov r5, #0x20
    mov r4, #2
    b sprite_palette_upload_test
sprite_palette_upload_loop:
    bl func_02070874
    mov r2, r0
    str r5, [sp]
    ldrb r3, [r6, #0x12]
    mov r1, r4
    add r0, r9, #0x1c00
    add r2, r2, r7, lsl #5
    mov r3, r3, lsl #5
    bl GraphicsTransferQueue_Enqueue
    ldr r6, [r6, #8]
    add r7, r7, #1
sprite_palette_upload_test:
    ldr r0, [r8, #0x14]
    ldr r1, [r0, #0x20]
    ldrh r1, [r1, #6]
    cmp r7, r1
    blt sprite_palette_upload_loop
    ldr r0, =data_021ede68
    ldr r0, [r0, #4]
    bl GX_VBlankIntr
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
}
#endif
