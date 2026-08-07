    .text
/* Exact fallback; see src/overlays/ov021/overlay021_state_actions.c. */
    .extern data_021f5128
    .extern data_ov021_02202ed0
    .extern func_02002d94
    .extern func_0207ab48
    .extern func_0207c4cc
    .extern func_02092c8c
    .extern func_ov021_021fd7c0
    .extern func_ov021_021feea4
    .extern func_ov021_021ff1d0
    .extern func_ov021_021ff274
    .extern func_ov045_0220c028

.global func_ov021_02200360
func_ov021_02200360:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    beq L_02200388
    cmp r1, #0x1
    beq L_022003a8
    cmp r1, #0x2
    beq L_022003ec
    b L_02200434
L_02200388:
    mov r0, #0x1
    sub r1, r0, #0x9
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_022003a8:
    bl func_02002d94
    cmp r0, #0x0
    beq L_02200434
    ldr r0, [r4, #0x2bc]
    mov r1, #0x0
    bl func_0207c4cc
    mov r1, r0
    mov r0, r4
    bl func_ov021_021ff1d0
    ldr r0, [r4, #0x38c]
    bl func_ov045_0220c028
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02200434
L_022003ec:
    bl func_ov021_021ff274
    cmp r0, #0x0
    beq L_02200434
    mov r0, #0x1
    sub r1, r0, #0x11
    bl func_02092c8c
    ldr r1, [r4, #0x2bc]
    ldr r0, L_02200444
    ldr r1, [r1, #0x4]
    ldr r2, [r0, #0x0]
    ldr r0, [r4, #0x54]
    ldrh r1, [r1, #0x0]
    ldr r0, [r2, r0, lsl #0x2]
    bl func_0207ab48
    ldr r1, L_02200448
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
L_02200434:
    mov r0, r4
    bl func_ov021_021feea4
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_02200444: .word data_021f5128
L_02200448: .word data_ov021_02202ed0
    .size func_ov021_02200360, . - func_ov021_02200360

