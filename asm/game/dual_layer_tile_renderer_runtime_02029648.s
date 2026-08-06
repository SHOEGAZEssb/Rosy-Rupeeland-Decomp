; Matching retail form; see src/game/dual_layer_tile_renderer_runtime.c.
.text
.extern func_02029864
.extern func_02029914
.extern func_02029fb0

    .global func_02029648
    .type func_02029648, @function
func_02029648: ; 0x02029648
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    mov r6, r1
    mov r5, #0x0
.L_02029658:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x28]
    cmp r0, #0x0
    beq .L_02029674
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02029674:
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_02029658
    mov r0, r4
    bl func_02029864
    mov r0, r4
    bl func_02029914
    mov r5, #0x0
.L_02029694:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x28]
    cmp r0, #0x0
    beq .L_020296a8
    bl func_02029fb0
.L_020296a8:
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_02029694
    cmp r6, #0x0
    beq .L_020296d0
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, #0x1
    ldr r2, [r2, #0x24]
    blx r2
.L_020296d0:
    ldrb r0, [r4, #0x30]
    cmp r0, #0x1
    bne .L_02029708
    ldr r2, .L_02029734
    ldrh r0, [r2, #0x0]
    sub r1, r2, #0x2
    bic r0, r0, #0x3
    orr r0, r0, #0x2
    strh r0, [r2, #0x0]
    ldrh r0, [r1, #0x0]
    bic r0, r0, #0x3
    orr r0, r0, #0x1
    strh r0, [r1, #0x0]
    ldmia sp!, {r4, r5, r6, pc}
.L_02029708:
    ldr r2, .L_02029738
    ldrh r0, [r2, #0x0]
    sub r1, r2, #0x2
    bic r0, r0, #0x3
    orr r0, r0, #0x2
    strh r0, [r2, #0x0]
    ldrh r0, [r1, #0x0]
    bic r0, r0, #0x3
    orr r0, r0, #0x1
    strh r0, [r1, #0x0]
    ldmia sp!, {r4, r5, r6, pc}
.L_02029734: .word 0x400000e
.L_02029738: .word 0x400100e
    .size func_02029648, . - func_02029648

