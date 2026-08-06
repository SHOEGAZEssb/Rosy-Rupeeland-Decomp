; Matching retail form; see src/game/dual_layer_tile_renderer_base.c.
.text


    .global func_02029328
    .type func_02029328, @function
func_02029328: ; 0x02029328
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, #0x0
.L_02029334:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x28]
    cmp r0, #0x0
    beq .L_02029350
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02029350:
    add r4, r4, #0x1
    cmp r4, #0x2
    blt .L_02029334
    ldmia sp!, {r3, r4, r5, pc}
    .size func_02029328, . - func_02029328

