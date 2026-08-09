.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.
.extern data_020c9670
.extern data_ov076_02214848
.extern func_0200500c
.extern func_02005030
.extern func_02005058
.extern func_0204cfa4
.extern func_020ae024
.extern func_ov076_022145d8

.global func_ov076_02214288
func_ov076_02214288:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x30
    mov r6, r0
    ldr r2, [r6, #0x260]
    mov r4, r1
    orr r1, r2, #0x3
    str r1, [r6, #0x260]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x38]
    blx r1
    cmp r0, #0x0
    movne r0, #0x0
    bne .L_022145c8
    ldr r1, [r6, #0x228]
    cmp r1, #0x0
    bne .L_022142e0
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xe8]
    blx r1
    mov r0, #0x0
    b .L_022145c8
.L_022142e0:
    ldrh r0, [r4, #0x1a]
    tst r0, #0x2
    beq .L_02214304
    ldr r0, .L_022145d0
    ldr r1, [r0, #0x8]
    ldr r0, [r0, #0xc]
    str r1, [r6, #0x218]
    str r0, [r6, #0x21c]
    b .L_022145c4
.L_02214304:
    ldr r0, [r1, #0xd0]
    tst r0, #0x100
    mov r0, r6
    bne .L_022145b8
    ldr r2, [r0, #0x0]
    mov r1, r4
    ldr r2, [r2, #0x11c]
    blx r2
    cmp r0, #0x0
    movne r0, #0x0
    bne .L_022145c8
    add r0, r6, #0x200
    ldrsh r1, [r0, #0x5a]
    cmp r1, #0x0
    bne .L_022145ac
    ldrb r0, [r6, #0x4b]
    cmp r0, #0x0
    beq .L_02214398
    ldr r0, [r6, #0x298]
    cmp r0, #0x0
    ldreq r0, [r6, #0x29c]
    eoreq r0, r0, #0x1
    streq r0, [r6, #0x29c]
    beq .L_02214390
    ldr r3, [r6, #0x1c]
    ldr r0, [r6, #0x2c]
    ldr r2, [r6, #0x20]
    ldr r1, [r6, #0x30]
    sub r0, r3, r0
    sub r1, r2, r1
    bl func_0204cfa4
    cmp r0, #0xc00
    ldrlt r0, [r6, #0x29c]
    eorlt r0, r0, #0x1
    strlt r0, [r6, #0x29c]
.L_02214390:
    mov r0, #0x1e
    str r0, [r6, #0x298]
.L_02214398:
    ldr r0, [r6, #0x298]
    cmp r0, #0x0
    beq .L_02214508
    sub r0, r0, #0x1
    str r0, [r6, #0x298]
    ldr r4, [r6, #0x228]
    add r0, sp, #0x20
    add r1, r4, #0x18
    add r2, r6, #0x18
    bl func_ov076_022145d8
    ldr r1, [r6, #0x298]
    ldr r0, [sp, #0x28]
    rsb r1, r1, #0x1e
    mov r1, r1, lsl #0x1
    add r2, r1, #0x46
    ldr r1, [sp, #0x24]
    mov r5, r2, lsl #0xc
    bl func_020ae024
    ldr r1, [r6, #0x29c]
    ldr r2, [r6, #0x298]
    cmp r1, #0x0
    movne r3, #0x1
    mov r1, #0x64
    rsb r2, r2, #0x1e
    mul r1, r2, r1
    mvneq r3, #0x0
    rsb r1, r1, #0x2000
    mul r2, r1, r3
    mov r1, r2, lsl #0x10
    add r0, r0, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r3, r0, lsl #0x1
    add r0, r3, #0x1
    mov r2, r0, lsl #0x1
    ldr r1, .L_022145d4
    mov r0, r3, lsl #0x1
    ldrsh r2, [r1, r2]
    ldrsh r0, [r1, r0]
    ldr r1, [r4, #0x1c]
    smull r3, ip, r2, r5
    adds lr, r3, #0x800
    smull r3, r2, r0, r5
    adc r0, ip, #0x0
    mov r5, lr, lsr #0xc
    orr r5, r5, r0, lsl #0x14
    adds r3, r3, #0x800
    adc r0, r2, #0x0
    mov r2, r3, lsr #0xc
    orr r2, r2, r0, lsl #0x14
    ldr r4, [r4, #0x20]
    ldr r3, [r6, #0x24]
    add r0, sp, #0x10
    sub r1, r1, r5
    sub r2, r4, r2
    bl func_0200500c
    ldr r1, [r6, #0xd0]
    mov r0, r6
    orr r1, r1, #0x2
    str r1, [r6, #0xd0]
    ldr r2, [r0, #0x0]
    add r1, sp, #0x10
    ldr r2, [r2, #0xd0]
    blx r2
    ldr r0, [r6, #0x3c]
    mov r1, #0x1800
    umull r4, r3, r0, r1
    mov r2, #0x0
    mla r3, r0, r2, r3
    mov r0, r0, asr #0x1f
    mla r3, r0, r1, r3
    adds r4, r4, #0x800
    adc r0, r3, #0x0
    mov r3, r4, lsr #0xc
    orr r3, r3, r0, lsl #0x14
    str r3, [r6, #0x3c]
    ldr r4, [r6, #0x40]
    add r0, sp, #0x10
    umull ip, r5, r4, r1
    mla r5, r4, r2, r5
    mov r3, r4, asr #0x1f
    adds r2, ip, #0x800
    mla r5, r3, r1, r5
    adc r1, r5, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    str r2, [r6, #0x40]
    bl func_02005058
    add r0, sp, #0x20
    bl func_02005058
    b .L_022145c4
.L_02214508:
    ldr ip, [r6, #0x228]
    ldrsh r0, [r4, #0xa]
    ldr r3, [r6, #0x20]
    ldr r1, [ip, #0x20]
    add r2, r0, #0x20
    sub r0, r3, r1
    mov r5, r0, asr #0xc
    mul r1, r5, r5
    ldr r4, [r6, #0x1c]
    ldr r3, [ip, #0x1c]
    mul r0, r2, r2
    sub r2, r4, r3
    mov r4, r2, asr #0xc
    mla r1, r4, r4, r1
    cmp r1, r0
    bge .L_02214598
    add r0, sp, #0x0
    add r1, r6, #0x18
    bl func_02005030
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0x4]
    add r0, r0, r5, lsl #0xc
    add r1, r1, r4, lsl #0xc
    str r0, [sp, #0x8]
    str r1, [sp, #0x4]
    ldr r1, [r6, #0xd0]
    mov r0, r6
    orr r1, r1, #0x2
    str r1, [r6, #0xd0]
    ldr r2, [r0, #0x0]
    add r1, sp, #0x0
    ldr r2, [r2, #0xd0]
    blx r2
    add r0, sp, #0x0
    bl func_02005058
    b .L_022145c4
.L_02214598:
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xe8]
    blx r1
    b .L_022145c4
.L_022145ac:
    sub r1, r1, #0x1
    strh r1, [r0, #0x5a]
    b .L_022145c4
.L_022145b8:
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xe8]
    blx r1
.L_022145c4:
    mov r0, #0x0
.L_022145c8:
    add sp, sp, #0x30
    ldmia sp!, {r4, r5, r6, pc}
.L_022145d0: .word data_ov076_02214848
.L_022145d4: .word data_020c9670
.size func_ov076_02214288, . - func_ov076_02214288
