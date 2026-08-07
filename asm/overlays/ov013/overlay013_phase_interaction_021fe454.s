    .text
    .extern data_ov013_021febb4
    .extern data_ov013_021fed10
    .extern data_ov013_021fed18
    .extern data_ov013_021fed20
    .extern data_ov013_021fed28
    .extern func_02091bac
    .extern func_02091c7c
    .extern func_02091cf0
    .extern func_02091fb0
    .extern func_02092260
    .extern func_02092910
    .extern func_02095988
    .extern func_02095dd4
    .extern func_ov013_021fce04
    .extern func_ov013_021fda9c
    .extern func_ov013_021fdb10
    .extern func_ov013_021fdbb0
    .extern func_ov013_021fdd8c
    .extern func_ov013_021fde18
    .extern func_ov013_021fdee4
    .extern func_ov013_021fdfbc

/* Exact fallback; see the documented portable reconstruction in
 * src/overlays/ov013/overlay013_phase_handlers.c. */
    .global func_ov013_021fe454

func_ov013_021fe454:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x9a8]
    cmp r0, #0x0
    beq L_021fe470
    mov r1, #0x1
    bl func_02091fb0
L_021fe470:
    ldr r0, [r4, #0x4]
    cmp r0, #0x14
    bgt L_021fe4b8
    bge L_021fe754
    cmp r0, #0xa
    addls pc, pc, r0, lsl #0x2
    b L_021fe85c
L_021fe48c: ; jump table
    b L_021fe4d4 ; case 0
    b L_021fe4e4 ; case 1
    b L_021fe624 ; case 2
    b L_021fe678 ; case 3
    b L_021fe85c ; case 4
    b L_021fe85c ; case 5
    b L_021fe85c ; case 6
    b L_021fe85c ; case 7
    b L_021fe85c ; case 8
    b L_021fe85c ; case 9
    b L_021fe6c0 ; case 10
L_021fe4b8:
    cmp r0, #0x1e
    bgt L_021fe4c8
    beq L_021fe7bc
    b L_021fe85c
L_021fe4c8:
    cmp r0, #0x1f
    beq L_021fe800
    b L_021fe85c
L_021fe4d4:
    add r0, r0, #0x1
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
L_021fe4e4:
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq L_021fe85c
    mov r0, r4
    bl func_ov013_021fdd8c
    cmp r0, #0x0
    beq L_021fe57c
    ldr r0, [r4, #0x96c]
    cmp r0, #0x2
    bne L_021fe534
    mov r0, r4
    mov r1, #0xb
    bl func_02092260
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe85c
L_021fe534:
    cmp r0, #0x3
    mov r0, r4
    mov r1, #0x2
    bne L_021fe55c
    bl func_02092260
    mov r0, #0x1e
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_021fe85c
L_021fe55c:
    bl func_02092260
    mov r0, #0x4
    str r0, [r4, #0x984]
    ldr r1, L_021fe86c
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov013_021fce04
    b L_021fe85c
L_021fe57c:
    mov r0, r4
    bl func_ov013_021fde18
    cmp r0, #0x0
    mov r0, r4
    beq L_021fe5ac
    mov r1, #0x32
    bl func_02092260
    mov r0, #0xa
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_021fe85c
L_021fe5ac:
    bl func_ov013_021fdee4
    cmp r0, #0x0
    beq L_021fe5d8
    mov r0, r4
    mov r1, #0x32
    bl func_02092260
    mov r0, #0x14
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_021fe85c
L_021fe5d8:
    ldr r0, [r4, #0x984]
    cmp r0, #0x1
    bne L_021fe85c
    ldr r0, [r4, #0x948]
    add r1, r4, #0x30
    ldr r0, [r0, #0x9c]
    bl func_02092910
    cmp r0, #0x0
    beq L_021fe85c
    mov r0, r4
    mov r1, #0x7c
    bl func_02092260
    mov r0, #0x4
    ldr r1, L_021fe870
    str r0, [r4, #0x984]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov013_021fce04
    b L_021fe85c
L_021fe624:
    ldr r1, [r4, #0x96c]
    add r2, r4, #0x8c
    mov r0, #0xac
    mla r0, r1, r0, r2
    bl func_ov013_021fdfbc
    cmp r0, #0x0
    beq L_021fe85c
    add r0, r4, #0x188
    mov r1, #0x14
    mov r2, #0x0
    str r1, [sp, #0x0]
    add r0, r0, #0x800
    sub r3, r2, #0x100
    mov r1, #0x2
    bl func_02091bac
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe85c
L_021fe678:
    add r0, r4, #0x188
    add r0, r0, #0x800
    mov r1, #0x1
    bl func_02091c7c
    ldr r3, [r4, #0x84]
    add r1, r4, #0x188
    str r0, [r3, #0x18]
    mov r2, #0x0
    add r0, r1, #0x800
    str r2, [r3, #0x1c]
    bl func_02091cf0
    cmp r0, #0x0
    beq L_021fe85c
    ldr r1, L_021fe874
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov013_021fce04
    b L_021fe85c
L_021fe6c0:
    ldr r2, [r4, #0x970]
    mov r1, #0xac
    mla r0, r2, r1, r4
    ldr r0, [r0, #0x5dc]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq L_021fe85c
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    ldr r5, [r4, #0x970]
    cmp r0, #0x3
    mov r0, #0x14
    mul r3, r5, r0
    blt L_021fe738
    add r0, r4, #0x540
    mla r0, r5, r1, r0
    ldr r2, L_021fe878
    ldr r1, [r2, r3]
    bl func_02095988
    ldr r2, [r4, #0x94c]
    mov r0, #0x0
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x4
    strh r1, [r2, #0x24]
    str r0, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe85c
L_021fe738:
    add r0, r4, #0x540
    mla r0, r5, r1, r0
    ldr r2, L_021fe878
    ldr r1, [r2, r3]
    add r1, r1, #0x1
    bl func_02095988
    b L_021fe85c
L_021fe754:
    ldr r0, [r4, #0x938]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq L_021fe85c
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    cmp r0, #0x3
    add r0, r4, #0x9c
    add r0, r0, #0x800
    blt L_021fe7b0
    mov r1, #0x0
    bl func_02095988
    ldr r2, [r4, #0x94c]
    mov r0, #0x0
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x4
    strh r1, [r2, #0x24]
    str r0, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe85c
L_021fe7b0:
    mov r1, #0x1
    bl func_02095988
    b L_021fe85c
L_021fe7bc:
    ldr r1, [r4, #0x96c]
    add r2, r4, #0x8c
    mov r0, #0xac
    mla r0, r1, r0, r2
    bl func_ov013_021fdfbc
    cmp r0, #0x0
    beq L_021fe85c
    mov r0, r4
    mov r1, #0x20
    mov r2, #0x0
    bl func_ov013_021fda9c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe85c
L_021fe800:
    ldr r1, [r4, #0x20]
    ldr r0, [r4, #0x9a4]
    mov r2, r1, lsl #0x1a
    add r1, r4, #0x30
    mov r2, r2, asr #0x1f
    bl func_02095dd4
    movs r5, r0
    bmi L_021fe85c
    mov r0, r4
    bl func_ov013_021fdb10
    cmp r5, #0x1
    beq L_021fe844
    cmp r5, #0x2
    moveq r0, #0x0
    streq r0, [r4, #0x4]
    streq r0, [r4, #0x8]
    b L_021fe85c
L_021fe844:
    mov r0, #0x4
    str r0, [r4, #0x984]
    ldr r1, L_021fe87c
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov013_021fce04
L_021fe85c:
    mov r0, r4
    bl func_ov013_021fdbb0
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_021fe86c: .word data_ov013_021fed28
L_021fe870: .word data_ov013_021fed20
L_021fe874: .word data_ov013_021fed18
L_021fe878: .word data_ov013_021febb4
L_021fe87c: .word data_ov013_021fed10
    .size func_ov013_021fe454, . - func_ov013_021fe454
