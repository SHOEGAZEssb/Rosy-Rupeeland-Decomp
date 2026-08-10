.text
/* Exact fallback; see overlay039_helper_collision.c for documented portable C. */
    .extern GraphicsSpriteState_SetAnimationIndex

    .global func_ov039_021fd84c
func_ov039_021fd84c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    ldr r0, [r5, #0xc]
    mov r1, r2
    mov r4, r3
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r5, #0xc]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r0, [r5, #0xc]
    strb r4, [r0, #0x3a]
    ldmia sp!, {r3, r4, r5, pc}
    .size func_ov039_021fd84c, .-func_ov039_021fd84c

    .global func_ov039_021fd880
func_ov039_021fd880:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    add r3, r0, #0x1c00
    ldrh r3, [r3, #0xac]
    cmp r3, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r4, #0x7000
    mov r3, #0x1e
    rsb r4, r4, #0x0
    sub lr, r3, #0x1
    add r5, r4, #0x1000
L_021fd8ac:
    add ip, r0, lr, lsl #0x2
    ldr r3, [ip, #0xa0]
    ldr r6, [r3, #0x18]
    tst r6, #0x4
    bne L_021fd92c
    ldr r7, [r1, #0x8]
    ldr r6, [r1, #0xc]
    ldr r9, [r3, #0x4]
    ldr r8, [r1, #0x4]
    sub r6, r7, r6
    sub r8, r9, r8
    ldr r7, [r3, #0x8]
    sub r6, r6, #0xb000
    cmp r8, #0x6000
    sub r6, r7, r6
    bge L_021fd92c
    cmp r8, r5
    ble L_021fd92c
    cmp r6, #0x7000
    bge L_021fd92c
    cmp r6, r4
    ble L_021fd92c
    mov r0, #0x4
    str r0, [r3, #0x18]
    ldr r1, [ip, #0xa0]
    mov r0, #0x1
    ldr r1, [r1, #0x10]
    str r1, [r2, #0x4]
    ldr r1, [ip, #0xa0]
    ldr r1, [r1, #0x14]
    str r1, [r2, #0x8]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
L_021fd92c:
    subs lr, lr, #0x1
    bpl L_021fd8ac
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    .size func_ov039_021fd880, .-func_ov039_021fd880

