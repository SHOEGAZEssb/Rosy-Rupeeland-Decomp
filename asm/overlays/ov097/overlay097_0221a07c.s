.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern Actor_UpdateAnimationState
.extern func_02033f44
.extern func_02034a60

.global func_ov097_0221a07c
func_ov097_0221a07c:
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x0]
    mov r4, r0
    ldr r1, [r1, #0x18]
    blx r1
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldrb r0, [r4, #0x4b]
    tst r0, #0xf
    beq .L_0221a0c0
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0xc4]
    blx r2
.L_0221a0c0:
    add r1, r4, #0x100
    ldrsh r2, [r1, #0xf8]
    mov r0, r4
    add r2, r2, #0x1
    strh r2, [r1, #0xf8]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xd4]
    blx r1
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa4]
    blx r1
    mov r0, r4
    bl Actor_UpdateAnimationState
    mov r0, #0x10000
    ldr r1, [r4, #0x5c]
    rsb r0, r0, #0x0
    and r0, r1, r0
    orr r0, r0, #0x3e8
    orr r0, r0, #0xfc00
    str r0, [r4, #0x5c]
    ldr r0, [r4, #0x1f4]
    mov r0, r0, lsl #0x1f
    movs r0, r0, asr #0x1f
    bne .L_0221a14c
    mov r0, r4
    bl func_02033f44
    ldr r1, [r4, #0x24]
    sub r0, r1, r0
    cmp r0, #0x48000
    ldr r0, [r4, #0x10]
    biclt r0, r0, #0x20000
    strlt r0, [r4, #0x10]
    orrge r0, r0, #0x20000
    strge r0, [r4, #0x10]
.L_0221a14c:
    ldr r0, [r4, #0xd0]
    tst r0, #0x2000
    bne .L_0221a1b0
    ldr r0, [r4, #0x1f4]
    mov r0, r0, lsl #0x1f
    movs r0, r0, asr #0x1f
    bne .L_0221a1a4
    ldr r0, [r4, #0x10]
    ldr r1, .L_0221a1c4
    bic r0, r0, #0x1f0000
    str r0, [r4, #0x10]
    ldr r2, [r4, #0x14]
    mov r0, r4
    bic r2, r2, #0x2
    orr r2, r2, #0x800000
    str r2, [r4, #0x14]
    ldr r3, [r4, #0x1f4]
    mov r2, #0x0
    bic r3, r3, #0x1
    orr r3, r3, #0x1
    str r3, [r4, #0x1f4]
    bl func_02034a60
.L_0221a1a4:
    ldr r0, [r4, #0xd0]
    orr r0, r0, #0x2000
    str r0, [r4, #0xd0]
.L_0221a1b0:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x20]
    blx r1
    ldmia sp!, {r4, pc}
.L_0221a1c4: .word 0xf686
.size func_ov097_0221a07c, . - func_ov097_0221a07c
