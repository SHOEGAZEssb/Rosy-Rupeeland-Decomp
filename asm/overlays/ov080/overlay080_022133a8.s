.text
; Matching fallback for the portable implementation in src/overlays/ov080/overlay080_recovery.c.
.extern data_0210576d
.extern data_ov080_02213e68
.extern Actor_RestoreSavedFlags
.extern func_02072b68
.extern func_ov080_022136f4

.global func_ov080_022133a8
func_ov080_022133a8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r1, #0x13
    strh r1, [r4, #0xd6]
    ldr r3, [r4, #0x260]
    ldr r1, .L_022134cc
    add r2, r4, #0x200
    and r1, r3, r1
    str r1, [r4, #0x260]
    ldrsh r1, [r2, #0x5a]
    cmp r1, #0x0
    ble .L_0221341c
    sub r0, r1, #0x1
    strh r0, [r2, #0x5a]
    ldrsh r0, [r2, #0x5a]
    cmp r0, #0x0
    bne .L_02213414
    ldr r2, [r4, #0x54]
    mov r1, #0x14
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x17
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0x54]
    bl func_02072b68
    ldr r0, [r4, #0x14]
    bic r0, r0, #0x10000000
    str r0, [r4, #0x14]
.L_02213414:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_0221341c:
    ldr r2, [r4, #0x54]
    ldrh r1, [r2, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    beq .L_022134c4
    mov r1, #0x0
    strh r1, [r2, #0x30]
    ldr r3, [r4, #0x54]
    mov r2, #0x100
    strh r2, [r3, #0x32]
    ldr r1, .L_022134d0
    strh r2, [r3, #0x34]
    ldr r2, [r1, #0x38]
    ldr r1, [r1, #0x3c]
    str r2, [r4, #0x218]
    str r1, [r4, #0x21c]
    bl Actor_RestoreSavedFlags
    ldr r2, .L_022134d4
    ldrb r0, [r4, #0x298]
    mov r1, #0x1
    ldrb r3, [r2, #0x0]
    mvn r0, r1, lsl r0
    and r3, r3, r0
    mov r0, r4
    strb r3, [r2, #0x0]
    bl func_ov080_022136f4
    ldr r1, [r4, #0x10]
    mov r0, #0x2
    orr r1, r1, #0x40000
    str r1, [r4, #0x10]
    strh r0, [r4, #0xd6]
    ldr r1, [r4, #0x260]
    add r0, r4, #0x200
    orr r1, r1, #0x3
    str r1, [r4, #0x260]
    ldr r2, [r4, #0xd0]
    mov r1, #0x0
    bic r2, r2, #0x100
    str r2, [r4, #0xd0]
    strh r1, [r0, #0x54]
    strh r1, [r0, #0xa2]
.L_022134c4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_022134cc: .word 0xffffbffc
.L_022134d0: .word data_ov080_02213e68
.L_022134d4: .word data_0210576d
.size func_ov080_022133a8, . - func_ov080_022133a8
