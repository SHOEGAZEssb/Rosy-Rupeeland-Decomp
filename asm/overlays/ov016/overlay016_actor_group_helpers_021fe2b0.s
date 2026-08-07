    .text
    .extern func_02091a70
    .extern func_020948e4

/* Exact fallbacks for actor layout and aggregation; see src/overlays/ov016/overlay016_actor_group.c. */
    .global func_ov016_021fe2b0
    .global func_ov016_021fe358

func_ov016_021fe2b0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r4, r0
    ldr r5, [r4, #0xdc]
    cmp r5, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    mov r3, r5
    mov r0, #0x20000
    mov r1, #0x10000
    mov r2, #0xf
    mov r7, #0x0
    bl func_02091a70
    mov r8, r0
    sub r0, r5, #0x1
    mul r1, r0, r8
    add r0, r1, r1, lsr #0x1f
    mov r0, r0, asr #0x1
    mov r6, #0x2
    ldr r10, [r4, #0xd4]
    rsb r9, r0, #0x80000
    mov r11, r6
    mov r5, #0x10
    mov r4, r7
    b L_021fe34c
L_021fe30c:
    mov r1, r6
    mov r2, r9
    add r0, r10, #0xc
    bl func_020948e4
    mov r0, r7, lsl #0x1f
    mov r0, r0, lsr #0x1c
    add r2, r0, #0x84
    mov r1, r11
    add r0, r10, #0x1c
    mov r2, r2, lsl #0xc
    bl func_020948e4
    str r5, [r10, #0x7c]
    str r4, [r10, #0x80]
    ldr r10, [r10, #0x8]
    add r9, r9, r8
    add r7, r7, #0x1
L_021fe34c:
    cmp r10, #0x0
    bne L_021fe30c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}

    .global func_ov016_021fe358
func_ov016_021fe358:
    stmdb sp!, {r3, lr}
    ldr lr, [r1, #0x0]
    mov r0, #0x0
    mov r3, r0
    ldr ip, [lr, #0x100]
    mov r1, #0x24
    b L_021fe384
L_021fe374:
    mla r2, r3, r1, lr
    ldrh r2, [r2, #0x2c]
    add r3, r3, #0x1
    add r0, r0, r2
L_021fe384:
    cmp r3, ip
    blt L_021fe374
    ldmia sp!, {r3, pc}

    .size func_ov016_021fe2b0, func_ov016_021fe358 - func_ov016_021fe2b0
    .size func_ov016_021fe358, . - func_ov016_021fe358
