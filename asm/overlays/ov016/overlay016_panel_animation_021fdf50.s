    .text
    .extern func_020740a4
    .extern func_02091b98
    .extern func_02091c7c

/* Exact fallbacks for panel indicator animation; see src/overlays/ov016/overlay016_panel_animation.c. */
    .global func_ov016_021fdf50

func_ov016_021fdf50:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0xf8
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_021fdff0
    mov r1, #0x0
L_021fdf70:
    add r0, r4, r1, lsl #0x2
    ldr r2, [r0, #0x8c]
    ldrh r2, [r2, #0x24]
    and r2, r2, #0x4
    mov r2, r2, lsl #0x10
    movs r2, r2, lsr #0x10
    bne L_021fdfd8
    ldr ip, [r0, #0xa4]
    ldrh r3, [ip, #0x24]
    and r2, r3, #0x4
    mov r2, r2, lsl #0x10
    movs r2, r2, lsr #0x10
    beq L_021fdfc0
    bic r2, r3, #0x4
    strh r2, [ip, #0x24]
    ldr r2, [r0, #0xbc]
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x4
    strh r0, [r2, #0x24]
    b L_021fdfd8
L_021fdfc0:
    orr r2, r3, #0x4
    strh r2, [ip, #0x24]
    ldr r2, [r0, #0xbc]
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x4
    strh r0, [r2, #0x24]
L_021fdfd8:
    add r1, r1, #0x1
    cmp r1, #0x6
    blt L_021fdf70
    add r0, r4, #0xf8
    mov r1, #0x3c
    bl func_02091b98
L_021fdff0:
    ldr r0, [r4, #0x4]
    bl func_020740a4
    ldr r0, [r4, #0x8]
    bl func_020740a4
    ldmia sp!, {r4, pc}

    .size func_ov016_021fdf50, . - func_ov016_021fdf50
