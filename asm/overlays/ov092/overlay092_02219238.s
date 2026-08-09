.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.
.extern func_ov092_02218528

.global func_ov092_02219238
func_ov092_02219238:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0x274]
    ldr r1, [r2, #0x14]
    orr r1, r1, #0x20000000
    str r1, [r2, #0x14]
    ldr r2, [r4, #0x274]
    ldr r1, [r2, #0x10c]
    cmp r1, #0x0
    ldrne r1, [r2, #0x104]
    cmpne r1, #0x0
    ldmeqia sp!, {r4, pc}
    mov r1, #0x0
    str r1, [r2, #0x104]
    ldrb r1, [r4, #0x1ec]
    cmp r1, #0x2
    ldmneia sp!, {r4, pc}
    ldr r2, [r4, #0x274]
    ldr r1, .L_022192ac
    ldr r2, [r2, #0x1c]
    mov r3, #0x50
    mov r2, r2, asr #0xc
    bl func_ov092_02218528
    add r0, r4, #0x200
    ldrsh r1, [r0, #0x9c]
    cmp r1, #0x0
    moveq r1, #0x1
    streqh r1, [r0, #0x9c]
    ldmia sp!, {r4, pc}
.L_022192ac: .word 0xb980
.size func_ov092_02219238, . - func_ov092_02219238
