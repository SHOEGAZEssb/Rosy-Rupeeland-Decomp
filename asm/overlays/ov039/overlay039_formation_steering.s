.text
/* Exact fallback; see overlay039_formation_steering.c for documented portable C. */
    .extern func_0200500c
    .extern func_020befec
    .extern func_02004fe0
    .extern func_020050a4
    .extern func_020adc40
    .extern func_020adc90
    .extern func_ov039_021ff330
    .extern func_02005058

    .global func_ov039_021fdb9c
func_ov039_021fdb9c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x120
    mov r5, r0
    add r0, sp, #0xa0
    mov r1, #0x28000
    mov r2, #0x1e000
    mov r3, #0x1000
    bl func_0200500c
    add r0, sp, #0xb0
    mov r1, #0xf000
    mov r2, #0x0
    mov r3, #0x1000
    bl func_0200500c
    mov r1, #0x28000
    add r0, sp, #0xc0
    rsb r1, r1, #0x0
    mov r2, #0x1e000
    mov r3, #0x1000
    bl func_0200500c
    mov r1, #0xf000
    add r0, sp, #0xd0
    rsb r1, r1, #0x0
    mov r2, #0x0
    mov r3, #0x1000
    bl func_0200500c
    mov r1, #0x28000
    add r0, sp, #0xe0
    mov r2, r1
    mov r3, #0x1000
    bl func_0200500c
    mov r1, #0xa000
    add r0, sp, #0xf0
    rsb r1, r1, #0x0
    mov r2, #0xa000
    mov r3, #0x1000
    bl func_0200500c
    mov r1, #0x28000
    add r0, sp, #0x100
    rsb r1, r1, #0x0
    mov r2, #0x28000
    mov r3, #0x1000
    bl func_0200500c
    mov r1, #0xa000
    add r0, sp, #0x110
    mov r2, r1
    mov r3, #0x1000
    bl func_0200500c
    add r0, sp, #0x20
    mov r1, #0xa000
    mov r2, #0x50000
    mov r3, #0x1000
    bl func_0200500c
    add r0, sp, #0x30
    mov r1, #0x46000
    mov r2, #0x50000
    mov r3, #0x1000
    bl func_0200500c
    add r0, sp, #0x40
    mov r1, #0x3c000
    mov r2, #0x5000
    mov r3, #0x1000
    bl func_0200500c
    mov r1, #0xa000
    add r0, sp, #0x50
    rsb r1, r1, #0x0
    mov r2, #0x0
    mov r3, #0x1000
    bl func_0200500c
    add r0, sp, #0x60
    mov r1, #0xa000
    mov r2, #0x50000
    mov r3, #0x1000
    bl func_0200500c
    mov r1, #0x46000
    add r0, sp, #0x70
    rsb r1, r1, #0x0
    mov r2, #0x50000
    mov r3, #0x1000
    bl func_0200500c
    mov r1, #0x3c000
    add r0, sp, #0x80
    rsb r1, r1, #0x0
    mov r2, #0x0
    mov r3, #0x1000
    bl func_0200500c
    mov r1, #0xa000
    add r0, sp, #0x90
    rsb r1, r1, #0x0
    mov r2, #0x5000
    mov r3, #0x1000
    bl func_0200500c
    add r0, r5, #0x1c00
    ldrsh r0, [r0, #0xa8]
    mov r1, #0xa
    bl func_020befec
    cmp r0, #0x2
    add r0, r5, #0x1c00
    addge r4, sp, #0xa0
    ldrh r0, [r0, #0xc0]
    addlt r4, sp, #0x20
    cmp r0, #0x1
    bne L_021fde78
    add r0, sp, #0x10
    bl func_02004fe0
    add r0, sp, #0x0
    bl func_02004fe0
    add r0, r5, #0x1c00
    ldrh r1, [r0, #0xc2]
    add r0, sp, #0x10
    add r1, r4, r1, lsl #0x4
    bl func_020050a4
    ldr r1, [sp, #0x14]
    ldr r0, [sp, #0x18]
    add r1, r1, #0x200000
    add r4, r0, #0x118000
    str r1, [sp, #0x14]
    str r4, [sp, #0x18]
    ldr r0, [r5, #0x30]
    sub r3, r1, r0
    str r3, [sp, #0x4]
    smull r0, r2, r3, r3
    adds r3, r0, #0x800
    ldr r1, [r5, #0x34]
    adc r2, r2, #0x0
    sub r4, r4, r1
    smull r1, r0, r4, r4
    adds r1, r1, #0x800
    mov r3, r3, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    str r4, [sp, #0x8]
    bl func_020adc40
    add r1, r5, #0x1000
    ldr r6, [r1, #0xcc4]
    mov r4, r0
    cmp r4, r6
    ble L_021fde24
    ldr r0, [sp, #0x4]
    mov r1, r4
    bl func_020adc90
    smull r2, r1, r0, r6
    adds r2, r2, #0x800
    adc r0, r1, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r0, r5, #0x1000
    str r1, [r0, #0xd94]
    ldr r6, [r0, #0xcc4]
    ldr r0, [sp, #0x8]
    mov r1, r4
    bl func_020adc90
    smull r2, r1, r0, r6
    adds r2, r2, #0x800
    adc r0, r1, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r0, r5, #0x1000
    str r1, [r0, #0xd98]
    b L_021fde5c
L_021fde24:
    mov r4, #0x0
    str r4, [r1, #0xd94]
    str r4, [r1, #0xd98]
    add r2, r5, #0x1c00
    ldrh r3, [r2, #0xc2]
    mov r0, r5
    mov r1, #0x4
    add r3, r3, #0x1
    strh r3, [r2, #0xc2]
    ldrh r3, [r2, #0xc2]
    and r3, r3, #0x7
    strh r3, [r2, #0xc2]
    strh r4, [r2, #0xc0]
    bl func_ov039_021ff330
L_021fde5c:
    add r0, sp, #0x0
    add r1, r5, #0x1c00
    mov r2, #0x0
    strh r2, [r1, #0xa0]
    bl func_02005058
    add r0, sp, #0x10
    bl func_02005058
L_021fde78:
    add r1, r5, #0x1000
    ldr r2, [r1, #0xd94]
    mvn r0, #0x2
    cmp r2, r0
    ldrlt r0, [r1, #0xc98]
    addlt r0, r0, #0x308
    addlt r0, r0, #0x400
    strlt r0, [r1, #0xc98]
    blt L_021fdf04
    ldr r0, [r1, #0xc98]
    cmp r2, #0x3
    subgt r0, r0, #0x308
    subgt r0, r0, #0x400
    strgt r0, [r1, #0xc98]
    bgt L_021fdf04
    cmp r0, #0x0
    addne r0, r5, #0x1c00
    movne r1, #0x0
    strneh r1, [r0, #0xa0]
    add r1, r5, #0x1000
    ldr r0, [r1, #0xc98]
    cmp r0, #0x0
    ble L_021fdeec
    sub r0, r0, #0x308
    subs r0, r0, #0x400
    str r0, [r1, #0xc98]
    movmi r0, #0x0
    strmi r0, [r1, #0xc98]
    b L_021fdf04
L_021fdeec:
    add r0, r0, #0x308
    add r0, r0, #0x400
    str r0, [r1, #0xc98]
    cmp r0, #0x0
    movgt r0, #0x0
    strgt r0, [r1, #0xc98]
L_021fdf04:
    add r0, r5, #0x1000
    ldr r2, [r0, #0xc98]
    ldr r1, L_021fe058
    cmp r2, r1
    strgt r1, [r0, #0xc98]
    add r0, r5, #0x1000
    mov r1, #0x4000
    ldr r2, [r0, #0xc98]
    rsb r1, r1, #0x0
    cmp r2, r1
    strlt r1, [r0, #0xc98]
    add r1, r5, #0x1000
    ldr r2, [r1, #0xd98]
    mvn r0, #0xd1
    cmp r2, r0
    ldrlt r0, [r1, #0xc9c]
    addlt r0, r0, #0x308
    addlt r0, r0, #0x400
    strlt r0, [r1, #0xc9c]
    blt L_021fdfa4
    ldr r0, [r1, #0xc9c]
    cmp r2, #0xd2
    subgt r0, r0, #0x308
    subgt r0, r0, #0x400
    strgt r0, [r1, #0xc9c]
    bgt L_021fdfa4
    cmp r0, #0x0
    ble L_021fdf8c
    sub r0, r0, #0x308
    subs r0, r0, #0x400
    str r0, [r1, #0xc9c]
    movmi r0, #0x0
    strmi r0, [r1, #0xc9c]
    b L_021fdfa4
L_021fdf8c:
    add r0, r0, #0x308
    add r0, r0, #0x400
    str r0, [r1, #0xc9c]
    cmp r0, #0x0
    movgt r0, #0x0
    strgt r0, [r1, #0xc9c]
L_021fdfa4:
    add r0, r5, #0x1000
    ldr r2, [r0, #0xc9c]
    ldr r1, L_021fe058
    cmp r2, r1
    strgt r1, [r0, #0xc9c]
    add r0, r5, #0x1000
    mov r1, #0x4000
    ldr r2, [r0, #0xc9c]
    rsb r1, r1, #0x0
    cmp r2, r1
    strlt r1, [r0, #0xc9c]
    add r0, sp, #0x90
    bl func_02005058
    add r0, sp, #0x80
    bl func_02005058
    add r0, sp, #0x70
    bl func_02005058
    add r0, sp, #0x60
    bl func_02005058
    add r0, sp, #0x50
    bl func_02005058
    add r0, sp, #0x40
    bl func_02005058
    add r0, sp, #0x30
    bl func_02005058
    add r0, sp, #0x20
    bl func_02005058
    add r0, sp, #0x110
    bl func_02005058
    add r0, sp, #0x100
    bl func_02005058
    add r0, sp, #0xf0
    bl func_02005058
    add r0, sp, #0xe0
    bl func_02005058
    add r0, sp, #0xd0
    bl func_02005058
    add r0, sp, #0xc0
    bl func_02005058
    add r0, sp, #0xb0
    bl func_02005058
    add r0, sp, #0xa0
    bl func_02005058
    add sp, sp, #0x120
    ldmia sp!, {r4, r5, r6, pc}
L_021fe058: .word 0x3fff
    .size func_ov039_021fdb9c, .-func_ov039_021fdb9c

