.text
/* Exact fallback; see overlay039_scene_lifecycle.c for portable C. */
    .extern func_ov039_02202f34
    .extern func_ov039_0220426c
    .global func_ov039_022013e8
func_ov039_022013e8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r5, r0
    add r0, r5, #0x1c00
    ldrh r0, [r0, #0xa8]
    mov r4, r2
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov ip, #0x7000
    mov r0, #0xa
    rsb ip, ip, #0x0
    sub r3, r0, #0x1
    add lr, ip, #0x1000
L_0220141c:
    add r2, r5, r3, lsl #0x2
    ldr r0, [r2, #0x74]
    ldr r6, [r0, #0x18]
    cmp r6, #0x0
    bne L_022014a4
    ldr r7, [r1, #0x8]
    ldr r6, [r1, #0xc]
    ldr r9, [r0, #0x4]
    ldr r8, [r1, #0x4]
    sub r6, r7, r6
    sub r8, r9, r8
    ldr r7, [r0, #0x8]
    sub r6, r6, #0xb000
    cmp r8, #0x6000
    sub r6, r7, r6
    bge L_022014a4
    cmp r8, lr
    ble L_022014a4
    cmp r6, #0x7000
    bge L_022014a4
    cmp r6, ip
    ble L_022014a4
    mov r1, #0x4
    str r1, [r0, #0x18]
    ldr r0, [r2, #0x74]
    mov r1, #0x0
    ldr r3, [r0, #0x10]
    mov r0, #0x1
    str r3, [r4, #0x4]
    ldr r2, [r2, #0x74]
    ldr r2, [r2, #0x14]
    str r2, [r4, #0x8]
    str r1, [r4, #0xc]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
L_022014a4:
    subs r3, r3, #0x1
    bpl L_0220141c
    mov r0, r5
    mov r1, r4
    bl func_ov039_02202f34
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov039_0220426c
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    .size func_ov039_022013e8, .-func_ov039_022013e8

