#include "tingle/graphics_sprite_oam.h"

/*
 * Sprite OAM shadow-buffer reset and upload. The renderer keeps 128 eight-byte
 * object-attribute records at offset 0x3c and selects main or sub engine with
 * the word at offset 0x24.
 */

enum {
    GRAPHICS_SPRITE_OAM_COUNT = 128,
    GRAPHICS_SPRITE_OAM_BYTES = 0x400
};

typedef struct GraphicsSpriteOamRecord {
    u32 attributes01;
    u32 attributes23;
} GraphicsSpriteOamRecord;

typedef struct GraphicsSpriteOamRenderer {
    u8 padding_00[0x24];
    u32 engine;
    u8 padding_28[0x14];
    GraphicsSpriteOamRecord oam[GRAPHICS_SPRITE_OAM_COUNT];
} GraphicsSpriteOamRenderer;

#ifdef __cplusplus
extern "C" {
#endif

extern void func_020b4554(void *address, u32 size);
extern void func_020b1ec4(const void *source, u32 destinationOffset, u32 size);
extern void func_020b1e5c(const void *source, u32 destinationOffset, u32 size);

#ifdef __cplusplus
}
#endif

/*
 * Mark all 128 shadow OAM entries hidden by replacing attribute-0 bits 8-9
 * with binary 10, flush all 0x400 bytes, then upload to main OAM when engine is
 * zero or sub OAM otherwise. Other attribute bits are preserved. Returns no
 * value and performs ordered cache and graphics-hardware transfers.
 */
#ifndef MATCHING
void GraphicsSpriteRenderer_HideAllSprites(void *rendererPointer)
{
    GraphicsSpriteOamRenderer *renderer =
        (GraphicsSpriteOamRenderer *)rendererPointer;
    s32 index;

    for (index = 0; index < GRAPHICS_SPRITE_OAM_COUNT; index++) {
        renderer->oam[index].attributes01 &= ~0x300;
        renderer->oam[index].attributes01 |= 0x200;
    }
    func_020b4554(renderer->oam, GRAPHICS_SPRITE_OAM_BYTES);
    if (renderer->engine == 0) {
        func_020b1ec4(renderer->oam, 0, GRAPHICS_SPRITE_OAM_BYTES);
    } else {
        func_020b1e5c(renderer->oam, 0, GRAPHICS_SPRITE_OAM_BYTES);
    }
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void GraphicsSpriteRenderer_HideAllSprites(void *renderer)
{
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r2, #0
    add r0, r4, #0x3c
sprite_oam_hide_loop:
    ldr r1, [r0, r2, lsl #3]
    bic r1, r1, #0x300
    orr r1, r1, #0x200
    str r1, [r0, r2, lsl #3]
    add r2, r2, #1
    cmp r2, #0x80
    DCD 0xBAFFFFF8
    mov r1, #0x400
    bl func_020b4554
    ldr r0, [r4, #0x24]
    mov r1, #0
    cmp r0, #0
    add r0, r4, #0x3c
    mov r2, #0x400
    bne sprite_oam_upload_sub
    bl func_020b1ec4
    ldmia sp!, {r4, pc}
sprite_oam_upload_sub:
    bl func_020b1e5c
    ldmia sp!, {r4, pc}
}
#endif
