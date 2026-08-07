    .text
/* Exact fallback; see src/overlays/ov018/overlay018_frame_ui.c. */
    .extern data_021052fc
    .extern data_021f3ecc
    .extern func_02008e10
    .extern func_020740a4
    .extern func_02075598
    .extern func_02076148
    .extern func_02076428
    .extern func_020791e0
    .extern func_02091b98
    .extern func_02091c7c
    .extern func_020958d8
    .extern func_02095928
    .extern func_02095940
    .extern gDebugFont
.global func_ov018_021fd788
func_ov018_021fd788:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    mov r4, r0
    ldr r0, [r4, #0x54]
    cmp r0, #0x1
    beq L_021fd7c8
    ldr r0, [r4, #0x414]
    cmp r0, #0x10
    add r0, r4, #0xd8
    bge L_021fd7c4
    bl func_02095940
    ldr r0, [r4, #0x414]
    add r0, r0, #0x1
    str r0, [r4, #0x414]
    b L_021fd7c8
L_021fd7c4:
    bl func_02095928
L_021fd7c8:
    add r0, r4, #0xd8
    bl func_020958d8
    ldr r0, L_021fd8fc
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    bl func_02008e10
    ldr r0, [r4, #0x184]
    ldr r1, [r4, #0xd0]
    ldr r0, [r0, #0x54]
    ldrsh r2, [r0, #0x2e]
    ldrsh r0, [r0, #0x2c]
    strh r0, [r1, #0x2c]
    strh r2, [r1, #0x2e]
    ldr r0, [r4, #0xc4]
    bl func_020740a4
    ldr r0, [r4, #0xc8]
    bl func_020740a4
    ldr r0, [r4, #0x5c]
    ldr r2, [r4, #0x60]
    ldr r1, [r4, #0xcc]
    rsb r0, r0, #0x0
    str r0, [r1, #0x18]
    rsb r0, r2, #0x0
    str r0, [r1, #0x1c]
    ldr r0, [r4, #0xcc]
    bl func_020740a4
    ldr r0, [r4, #0x400]
    cmp r0, #0x0
    beq L_021fd8f4
    add r0, r4, #0x3e0
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_021fd874
    add r0, r4, #0x3e0
    mov r1, #0x3c
    bl func_02091b98
    ldr r0, [r4, #0x3fc]
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r4, #0x3fc]
    moveq r0, #0x1
    streq r0, [r4, #0x3fc]
L_021fd874:
    ldr r0, [r4, #0x3fc]
    cmp r0, #0x0
    beq L_021fd8d0
    ldr r0, L_021fd900
    ldr r1, [r4, #0x70]
    ldr r0, [r0, #0x0]
    bl func_02075598
    ldr r0, L_021fd904
    ldr r1, L_021fd908
    bl func_020791e0
    mov r2, #0xb
    mov r1, #0x8
    str r2, [sp, #0x0]
    mov r2, #0x0
    str r1, [sp, #0x4]
    sub r1, r1, #0xa
    ldr r3, L_021fd900
    str r1, [sp, #0x8]
    mov r1, r0
    ldr r0, [r3, #0x0]
    mov r3, r2
    bl func_02076148
    b L_021fd8f4
L_021fd8d0:
    mov r0, #0xf
    mov r1, #0x0
    str r0, [sp, #0x0]
    ldr r0, L_021fd900
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r2, r1
    mov r3, #0xff
    bl func_02076428
L_021fd8f4:
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
L_021fd8fc: .word data_021052fc
L_021fd900: .word gDebugFont
L_021fd904: .word data_021f3ecc
L_021fd908: .word 0x319
    .size func_ov018_021fd788, . - func_ov018_021fd788
