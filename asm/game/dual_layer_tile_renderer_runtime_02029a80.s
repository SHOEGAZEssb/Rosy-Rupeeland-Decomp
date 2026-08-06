; Matching retail form; see src/game/dual_layer_tile_renderer_runtime.c.
.text


    .global func_02029a80
    .type func_02029a80, @function
func_02029a80: ; 0x02029a80
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, #0x0
    mov r6, r0
    mov r5, r4
.L_02029a90:
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0x28]
    cmp r0, #0x0
    beq .L_02029ab4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
    cmp r0, #0x0
    addne r4, r4, #0x1
.L_02029ab4:
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_02029a90
    cmp r4, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
    .size func_02029a80, . - func_02029a80

