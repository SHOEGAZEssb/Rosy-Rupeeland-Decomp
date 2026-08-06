; Matching retail form; see src/game/reversed_frame_sprite_overlay_presentation.c.
.text
.extern func_02074110

    .global func_02027498
    .type func_02027498, @function
func_02027498: ; 0x02027498
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x14]
    cmp r1, #0x0
    movne r1, #0x1
    strne r1, [r0, #0x20]
    ldmneia sp!, {r3, pc}
    bl func_02074110
    ldmia sp!, {r3, pc}
    .size func_02027498, . - func_02027498
