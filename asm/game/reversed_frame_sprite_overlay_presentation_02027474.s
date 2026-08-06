; Matching retail form; see src/game/reversed_frame_sprite_overlay_presentation.c.
.text

    .global func_02027474
    .type func_02027474, @function
func_02027474: ; 0x02027474
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x18]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, pc}
    .size func_02027474, . - func_02027474
