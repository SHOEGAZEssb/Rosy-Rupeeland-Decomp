#include "tingle/graphics_sprite_renderer.h"

/*
 * Small renderer state and text-surface helpers. These expose an optional
 * callback/context slot, clear the renderer's 0x6000-byte text tile buffer,
 * and resolve its allocated object-palette address for the selected engine.
 */

enum {
    GRAPHICS_SPRITE_TEXT_BUFFER_SIZE = 0x6000,
    GRAPHICS_SPRITE_PALETTE_SLOT_OFFSET = 0x12,
    GRAPHICS_SPRITE_PALETTE_SLOT_BYTES = 0x20,
    REG_MAIN_OBJ_PALETTE = 0x05000200,
    REG_SUB_OBJ_PALETTE = 0x05000600
};

#ifdef __cplusplus
extern "C" {
#endif

extern void MIi_CpuClearFast(u32 value, void *destination, u32 size);

#ifdef __cplusplus
}
#endif

/*
 * Return renderer->field_18 and replace it only while the renderer has an
 * active object at field_0c. The precise role of both fields is not yet
 * confirmed. No allocation or hardware access occurs.
 */
void *GraphicsSpriteRenderer_SetFontResource(GraphicsSpriteRenderer *renderer, void *replacement)
{
    void *previous = renderer->field_18;

    if (renderer->field_0c != 0) {
        renderer->field_18 = replacement;
    }
    return previous;
}

/*
 * Clear renderer->field_18 unconditionally. Returns no value and does not
 * release the referenced object; ownership of that pointer remains unknown.
 */
void GraphicsSpriteRenderer_ClearFontResource(GraphicsSpriteRenderer *renderer)
{
    renderer->field_18 = 0;
}

/*
 * When renderer initialization flag field_30 is nonzero, clear the entire
 * 0x6000-byte buffer referenced by field_00 using the SDK fast-clear routine.
 * Returns no value and writes the renderer-owned text/tile buffer.
 */
void GraphicsSpriteRenderer_ClearTextBuffer(GraphicsSpriteRenderer *renderer)
{
    if (renderer->field_30 != 0) {
        MIi_CpuClearFast(0, renderer->field_00,
                         GRAPHICS_SPRITE_TEXT_BUFFER_SIZE);
    }
}

/*
 * Resolve the hardware object-palette address selected by renderer->engine.
 * The byte at offset 0x12 of field_08 supplies a 32-byte palette slot. Return
 * null when field_0c is inactive or the engine is neither main nor sub. The
 * returned pointer names memory-mapped VRAM and must not be dereferenced by a
 * native port without a graphics-backend mapping.
 */
#ifndef MATCHING
void *GraphicsSpriteRenderer_GetObjectPaletteAddress(GraphicsSpriteRenderer *renderer)
{
    u32 offset;

    if (renderer->field_0c == 0) {
        return 0;
    }
    offset = ((u8 *)renderer->field_08)[GRAPHICS_SPRITE_PALETTE_SLOT_OFFSET] *
             GRAPHICS_SPRITE_PALETTE_SLOT_BYTES;
    if (renderer->engine == 0) {
        return (void *)(REG_MAIN_OBJ_PALETTE + offset);
    }
    if (renderer->engine == 1) {
        return (void *)(REG_SUB_OBJ_PALETTE + offset);
    }
    return 0;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void *GraphicsSpriteRenderer_GetObjectPaletteAddress(GraphicsSpriteRenderer *renderer)
{
    ldr r1, [r0, #0x0c]
    cmp r1, #0
    beq renderer_palette_none
    ldr r1, [r0, #0x08]
    ldr r0, [r0, #0x24]
    ldrb r1, [r1, #0x12]
    cmp r0, #0
    mov r1, r1, lsl #5
    beq renderer_palette_main
    cmp r0, #1
    beq renderer_palette_sub
    b renderer_palette_none
renderer_palette_main:
    add r0, r1, #0x200
    add r0, r0, #0x05000000
    bx lr
renderer_palette_sub:
    add r0, r1, #0x600
    add r0, r0, #0x05000000
    bx lr
renderer_palette_none:
    mov r0, #0
    bx lr
}
#endif
