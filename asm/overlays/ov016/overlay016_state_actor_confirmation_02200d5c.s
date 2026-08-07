    .text

/* Exact fallback; see src/overlays/ov016/overlay016_state_actor_confirmation.c. */
    .extern data_ov016_02201460
    .extern func_02092260
    .extern func_02092288
    .extern func_020946a8
    .extern func_02094738
    .extern func_ov000_021fc450
    .extern func_ov000_021fc460
    .extern func_ov000_021fc560
    .extern func_ov016_021fe754
    .extern func_ov016_021ff7bc
    .extern func_ov016_021ffc2c
.global func_ov016_02200d5c
func_ov016_02200d5c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0x44c]
    ldr r0, [r5, #0x4]
    ldr r4, [r1, #0x26c]
    cmp r0, #0x0
    beq L_02200d8c
    cmp r0, #0x1
    beq L_02200dac
    cmp r0, #0x2
    beq L_02200e10
    b L_02200e74
L_02200d8c:
    mov r0, r4
    mov r1, #0x4
    bl func_020946a8
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
L_02200dac:
    ldr r0, [r5, #0x44c]
    bl func_ov000_021fc450
    cmp r0, #0x0
    beq L_02200e04
    ldr r1, [r4, #0xc]
    ldr r0, [r4, #0x10]
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne L_02200dec
    mov r0, r5
    bl func_ov016_021ffc2c
    mov r0, r5
    mov r1, #0x8
    bl func_02092288
L_02200dec:
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_02200e10
L_02200e04:
    ldr r0, [r5, #0x44c]
    bl func_ov000_021fc460 ; func_ov001_021fc460
    b L_02200e74
L_02200e10:
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    beq L_02200e58
    ldr r0, [r5, #0x44c]
    add r1, r5, #0x30
    bl func_ov000_021fc560
    cmp r0, #0x0
    beq L_02200e74
    mov r0, r5
    mov r1, #0x8
    bl func_02092260
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_02200e74
L_02200e58:
    mov r0, r4
    mov r1, #0x6
    bl func_02094738
    ldr r1, L_02200e84
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov016_021fe754
L_02200e74:
    mov r0, r5
    bl func_ov016_021ff7bc
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_02200e84: .word data_ov016_02201460
    .size func_ov016_02200d5c, . - func_ov016_02200d5c

