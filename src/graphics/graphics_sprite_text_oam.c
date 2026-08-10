#include "tingle/graphics_sprite_renderer.h"

/*
 * OAM-facing controls for the renderer's 4-by-3 text-sprite surface. The
 * twelve 64-pixel cells are positioned, hidden when fully offscreen, and
 * updated with shared priority or object-mode bits.
 */

enum {
    GRAPHICS_SPRITE_TEXT_COLUMNS = 4,
    GRAPHICS_SPRITE_TEXT_ROWS = 3,
    GRAPHICS_SPRITE_TEXT_CELL_SIZE = 64,
    GRAPHICS_SPRITE_TEXT_OAM_COUNT = 12
};

typedef struct GraphicsSpriteTextOamRecord {
    u8 padding_00[0x0c];
    u32 field_0c;
    u16 attribute0;
    u16 attribute1;
    u16 attribute2;
    u16 padding_16;
} GraphicsSpriteTextOamRecord;

typedef char GraphicsSpriteTextOamRecordSizeCheck[
    sizeof(GraphicsSpriteTextOamRecord) == 0x18 ? 1 : -1];

/*
 * Position the active 4-by-3 OAM grid at (x,y), spacing records by 64 pixels.
 * Attribute-1 keeps all but its low nine X bits; attribute-0 keeps all but its
 * low eight Y bits and bits 8-9. A cell outside inclusive extended bounds
 * X=-64..256 or Y=-64..192 is marked hidden with attribute-0 value 2 in bits
 * 8-9; an in-range cell is made normal. Null field_0c is ignored. Returns no
 * value and updates only the twelve shadow OAM records.
 */
#ifndef MATCHING
void GraphicsSpriteRenderer_SetTextGridPosition(GraphicsSpriteRenderer *renderer, s32 x, s32 y)
{
    GraphicsSpriteTextOamRecord *records =
        (GraphicsSpriteTextOamRecord *)renderer->field_0c;
    s32 row;

    if (records == 0) {
        return;
    }
    for (row = 0; row < GRAPHICS_SPRITE_TEXT_ROWS; row++) {
        s32 cellY = y + row * GRAPHICS_SPRITE_TEXT_CELL_SIZE;
        s32 column;

        for (column = 0; column < GRAPHICS_SPRITE_TEXT_COLUMNS; column++) {
            GraphicsSpriteTextOamRecord *record =
                &records[column + row * GRAPHICS_SPRITE_TEXT_COLUMNS];
            s32 cellX = x + column * GRAPHICS_SPRITE_TEXT_CELL_SIZE;

            record->attribute1 =
                (record->attribute1 & 0xfe00) | ((u16)cellX & 0x01ff);
            record->attribute0 =
                (record->attribute0 & 0xff00) | ((u8)cellY);
            if (cellX < -64 || cellX > 256 ||
                cellY < -64 || cellY > 192) {
                record->attribute0 =
                    (record->attribute0 & 0xfcff) | 0x0200;
            } else {
                record->attribute0 &= 0xfcff;
            }
        }
    }
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void GraphicsSpriteRenderer_SetTextGridPosition(GraphicsSpriteRenderer *renderer, s32 x, s32 y)
{
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    ldr r3, [r0, #0x0c]
    cmp r3, #0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    mov r12, #0
text_oam_position_row:
    add r5, r2, r12, lsl #6
    and r3, r5, #0xff
    mvn r8, #0x3f
    mov lr, #0
    and r9, r3, #0xff
    sub r7, r8, #0x1c0
    mov r6, #0x18
text_oam_position_column:
    ldr r4, [r0, #0x0c]
    add r3, lr, r12, lsl #2
    mla r4, r3, r6, r4
    add r3, r1, lr, lsl #6
    ldrh r11, [r4, #0x12]
    mov r10, r3, lsl #16
    mov r10, r10, lsr #16
    and r11, r11, r7
    and r10, r10, r8, lsr #23
    orr r10, r11, r10
    strh r10, [r4, #0x12]
    ldrh r10, [r4, #0x10]
    cmp r3, r8
    bic r10, r10, #0xff
    orr r10, r10, r9
    strh r10, [r4, #0x10]
    blt text_oam_hide
    cmp r3, #0x100
    bgt text_oam_hide
    cmp r5, r8
    blt text_oam_hide
    cmp r5, #0xc0
    ble text_oam_show
text_oam_hide:
    ldrh r3, [r4, #0x10]
    bic r3, r3, #0x300
    orr r3, r3, #0x200
    strh r3, [r4, #0x10]
    b text_oam_position_next
text_oam_show:
    ldrh r3, [r4, #0x10]
    bic r3, r3, #0x300
    strh r3, [r4, #0x10]
text_oam_position_next:
    add lr, lr, #1
    cmp lr, #4
    DCD 0xBAFFFFDD
    add r12, r12, #1
    cmp r12, #3
    DCD 0xBAFFFFD3
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
}
#endif

/*
 * Clamp priority to 0..3, store it with field20 in the text OAM owner's
 * offset-0x0c word, and write priority into attribute-2 bits 10-11 of all
 * twelve active records. Null field_0c still records the requested state but
 * skips OAM writes. Returns no value; renderer state and shadow OAM may change.
 */
#ifndef MATCHING
void GraphicsSpriteRenderer_ConfigureTextGridPriority(GraphicsSpriteRenderer *renderer, s32 priority,
                   u32 field20)
{
    GraphicsSpriteTextOamRecord *records;
    s32 index;

    if (priority < 0) {
        renderer->field_1c = 0;
    } else if (priority > 3) {
        renderer->field_1c = 3;
    } else {
        renderer->field_1c = priority;
    }
    renderer->field_20 = field20;
    records = (GraphicsSpriteTextOamRecord *)renderer->field_0c;
    if (records == 0) {
        return;
    }
    records->field_0c = renderer->field_20 | (renderer->field_1c << 16);
    for (index = 0; index < GRAPHICS_SPRITE_TEXT_OAM_COUNT; index++) {
        records[index].attribute2 =
            (records[index].attribute2 & 0xf3ff) |
            ((renderer->field_1c & 3) << 10);
    }
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void GraphicsSpriteRenderer_ConfigureTextGridPriority(GraphicsSpriteRenderer *renderer, s32 priority,
                       u32 field20)
{
    stmdb sp!, {r3, lr}
    cmp r1, #0
    movlt r1, #0
    strlt r1, [r0, #0x1c]
    blt text_oam_priority_clamped
    cmp r1, #3
    movgt r1, #3
    strgt r1, [r0, #0x1c]
    strle r1, [r0, #0x1c]
text_oam_priority_clamped:
    str r2, [r0, #0x20]
    ldr r12, [r0, #0x0c]
    cmp r12, #0
    ldmeqia sp!, {r3, pc}
    ldr r3, [r0, #0x1c]
    ldr r2, [r0, #0x20]
    mov r1, #0
    orr r2, r2, r3, lsl #16
    str r2, [r12, #0x0c]
    mov r2, #0x18
text_oam_priority_loop:
    ldr r12, [r0, #0x0c]
    ldr r3, [r0, #0x1c]
    mla lr, r1, r2, r12
    ldrh r12, [lr, #0x14]
    mov r3, r3, lsl #16
    mov r3, r3, lsr #16
    bic r12, r12, #0xc00
    mov r3, r3, lsl #30
    orr r3, r12, r3, lsr #20
    add r1, r1, #1
    strh r3, [lr, #0x14]
    cmp r1, #0x0c
    DCD 0xBAFFFFF2
    ldmia sp!, {r3, pc}
}
#endif

/*
 * Write the low two bits of objectMode into attribute-0 bits 10-11 of all
 * twelve active text-sprite records, preserving every other bit. Null
 * field_0c is ignored. Returns no value and changes shadow OAM only.
 */
#ifndef MATCHING
void GraphicsSpriteRenderer_SetTextGridObjectMode(GraphicsSpriteRenderer *renderer, s32 objectMode)
{
    GraphicsSpriteTextOamRecord *records =
        (GraphicsSpriteTextOamRecord *)renderer->field_0c;
    s32 index;

    if (records == 0) {
        return;
    }
    for (index = 0; index < GRAPHICS_SPRITE_TEXT_OAM_COUNT; index++) {
        records[index].attribute0 =
            (records[index].attribute0 & 0xf3ff) |
            (((u16)objectMode & 3) << 10);
    }
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void GraphicsSpriteRenderer_SetTextGridObjectMode(GraphicsSpriteRenderer *renderer, s32 objectMode)
{
    stmdb sp!, {r3, lr}
    ldr r2, [r0, #0x0c]
    cmp r2, #0
    ldmeqia sp!, {r3, pc}
    mov r1, r1, lsl #16
    mov r1, r1, lsr #16
    mov r2, r1, lsl #30
    mov lr, #0
    mov r1, #0x18
text_oam_mode_loop:
    ldr r3, [r0, #0x0c]
    mla r12, lr, r1, r3
    ldrh r3, [r12, #0x10]
    add lr, lr, #1
    cmp lr, #0x0c
    bic r3, r3, #0xc00
    orr r3, r3, r2, lsr #20
    strh r3, [r12, #0x10]
    DCD 0xBAFFFFF6
    ldmia sp!, {r3, pc}
}
#endif
