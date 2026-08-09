.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.
.extern data_ov078_02215c88
.extern func_02005030
.extern func_02005058
.extern func_ov078_022134d0

.global func_ov078_02213c3c
func_ov078_02213c3c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x10
    mov r5, r0
    ldr r3, [r5, #0xd0]
    mov r2, #0x6
    orr r3, r3, #0x2
    str r3, [r5, #0xd0]
    ldr r3, [r5, #0x260]
    mov r4, r1
    orr r1, r3, #0x3
    str r1, [r5, #0x260]
    strh r2, [r5, #0xd6]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x38]
    blx r1
    cmp r0, #0x0
    bne .L_02213e6c
    ldrh r0, [r4, #0x1a]
    tst r0, #0x2
    beq .L_02213ca4
    ldr r0, .L_02213e74
    ldr r1, [r0, #0x18]
    ldr r0, [r0, #0x1c]
    str r1, [r5, #0x218]
    str r0, [r5, #0x21c]
    b .L_02213e6c
.L_02213ca4:
    mov r0, r5
    ldr r2, [r0, #0x0]
    mov r1, r4
    ldr r2, [r2, #0x130]
    blx r2
    cmp r0, #0x0
    bne .L_02213e6c
    ldr r2, [r5, #0x1c]
    ldr r1, [r5, #0x240]
    ldr r0, [r5, #0x278]
    sub r3, r2, r1
    ldr r2, [r5, #0x20]
    ldr r1, [r5, #0x244]
    cmp r0, #0x0
    sub r1, r2, r1
    mov r7, r3, asr #0xc
    mov r9, r1, asr #0xc
    ldr r6, [r5, #0x228]
    mov r8, #0x0
    beq .L_02213d08
    ldr r1, [r6, #0x1c]
    ldr r2, [r6, #0x20]
    bl func_ov078_022134d0
    cmp r0, #0x0
    movne r8, #0x1
.L_02213d08:
    cmp r8, #0x0
    bne .L_02213d3c
    mul r0, r9, r9
    mla r1, r7, r7, r0
    ldrsh r0, [r4, #0xc]
    smulbb r0, r0, r0
    cmp r1, r0
    ble .L_02213d3c
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xe8]
    blx r1
    b .L_02213e6c
.L_02213d3c:
    ldr r0, [r5, #0x228]
    ldr r0, [r0, #0xd0]
    tst r0, #0x100
    beq .L_02213d60
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xe8]
    blx r1
    b .L_02213e6c
.L_02213d60:
    ldr r1, [r5, #0x20]
    ldr r0, [r6, #0x20]
    ldr r2, [r5, #0x1c]
    sub r0, r1, r0
    mov r9, r0, asr #0xc
    mul r0, r9, r9
    ldr r1, [r6, #0x1c]
    cmp r8, #0x0
    sub r1, r2, r1
    mov r7, r1, asr #0xc
    mla r6, r7, r7, r0
    bne .L_02213db8
    ldrsh r0, [r4, #0xa]
    add r1, r0, #0x20
    mul r0, r1, r1
    cmp r6, r0
    ble .L_02213db8
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xe8]
    blx r1
    b .L_02213e6c
.L_02213db8:
    add r0, sp, #0x0
    add r1, r5, #0x18
    bl func_02005030
    ldrsh r0, [r4, #0x12]
    cmp r0, #0x0
    bne .L_02213dec
    ldr r1, [sp, #0x4]
    ldr r0, [sp, #0x8]
    sub r1, r1, r7, lsl #0xc
    sub r0, r0, r9, lsl #0xc
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
    b .L_02213e48
.L_02213dec:
    mov r0, r5
    ldr r2, [r0, #0x0]
    mov r1, r4
    ldr r2, [r2, #0x208]
    blx r2
    cmp r6, r0
    bge .L_02213e24
    ldr r1, [sp, #0x4]
    ldr r0, [sp, #0x8]
    add r1, r1, r7, lsl #0xc
    add r0, r0, r9, lsl #0xc
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
    b .L_02213e48
.L_02213e24:
    add r0, r0, #0x40
    cmp r6, r0
    ble .L_02213e48
    ldr r1, [sp, #0x4]
    ldr r0, [sp, #0x8]
    sub r1, r1, r7, lsl #0xc
    sub r0, r0, r9, lsl #0xc
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
.L_02213e48:
    mov r0, r5
    ldr r2, [r0, #0x0]
    add r1, sp, #0x0
    ldr r2, [r2, #0xd0]
    blx r2
    mov r1, #0x2
    add r0, sp, #0x0
    strb r1, [r5, #0x24c]
    bl func_02005058
.L_02213e6c:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02213e74: .word data_ov078_02215c88
.size func_ov078_02213c3c, . - func_ov078_02213c3c
