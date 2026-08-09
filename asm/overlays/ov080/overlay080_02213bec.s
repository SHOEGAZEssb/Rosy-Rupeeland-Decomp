.text
; Matching fallback for the portable implementation in src/overlays/ov080/overlay080_recovery.c.
.extern data_020e8380
.extern data_ov080_02213e68
.extern data_ov080_02213eb0

.global func_ov080_02213bec
func_ov080_02213bec:
    ldr r1, [r0, #0x10]
    tst r1, #0x1000000
    movne r0, #0x0
    bxne lr
    tst r1, #0x4
    moveq r0, #0x0
    bxeq lr
    ldrh r3, [r0, #0x4e]
    ldr r2, .L_02213c80
    mov r1, #0x30
    mla r1, r3, r1, r2
    ldrh r1, [r1, #0x1e]
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x12
    cmp r1, #0x5
    movhs r0, #0x0
    bxhs lr
    ldr r1, .L_02213c84
    ldr r3, [r0, #0x218]
    ldr r1, [r1, #0x48]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_02213c88
    bne .L_02213c60
    ldr r2, [r0, #0x21c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_02213c60:
    cmp ip, #0x0
    moveq r0, #0x0
    bxeq lr
    ldr r0, [r0, #0xd0]
    tst r0, #0x100
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.L_02213c80: .word data_020e8380
.L_02213c84: .word data_ov080_02213e68
.L_02213c88: .word data_ov080_02213eb0
.size func_ov080_02213bec, . - func_ov080_02213bec
