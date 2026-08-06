; Matching retail form; see src/game/indexed_sprite_overlay_presentation.c.
.text

    .global func_020272bc
    .type func_020272bc, @function
func_020272bc: ; 0x020272bc
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x18]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, pc}
    .size func_020272bc, . - func_020272bc
