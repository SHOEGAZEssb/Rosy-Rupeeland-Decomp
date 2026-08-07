    .text
/* Exact fallback; see src/overlays/ov021/overlay021_state_exchange.c. */
    .extern data_020f4e14
    .extern data_ov021_02202e18
    .extern func_02002d94
    .extern func_020755bc
    .extern func_02092c8c
    .extern func_02095940
    .extern func_ov021_021fd7c0
    .extern func_ov021_021fe390
    .extern func_ov021_021fe8e8
    .extern func_ov021_021feea4
    .extern func_ov021_021ff050
    .extern func_ov021_021ff0e0
    .extern func_ov021_021ff274
    .extern GameWork_ClearFlag
    .extern gGameWork

.global func_ov021_022012f0
func_ov021_022012f0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov021_021ff274
    ldr r0, [r4, #0x4]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b L_022013f0
L_0220130c: ; jump table
    b L_0220131c ; case 0
    b L_02201350 ; case 1
    b L_0220139c ; case 2
    b L_022013d4 ; case 3
L_0220131c:
    ldr r0, L_02201400
    ldr r1, L_02201404
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, L_02201400
    mov r1, #0x388
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_02201350:
    bl func_02002d94
    cmp r0, #0x0
    beq L_022013f0
    add r0, r4, #0xa0
    bl func_02095940
    ldr r1, [r4, #0x2c4]
    mov r0, r4
    bl func_ov021_021ff050
    ldr r0, L_02201408
    ldr r0, [r0, #0x0]
    bl func_020755bc
    mov r0, r4
    bl func_ov021_021fe8e8
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_022013f0
L_0220139c:
    mov r0, r4
    bl func_ov021_021fe390
    mov r0, r4
    mov r1, #0x2
    bl func_ov021_021ff0e0
    mov r0, #0x1
    mov r1, #0x0
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_022013f0
L_022013d4:
    bl func_02002d94
    cmp r0, #0x0
    beq L_022013f0
    ldr r1, L_0220140c
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
L_022013f0:
    mov r0, r4
    bl func_ov021_021feea4
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_02201400: .word gGameWork
L_02201404: .word 0x387
L_02201408: .word data_020f4e14
L_0220140c: .word data_ov021_02202e18
.size func_ov021_022012f0, . - func_ov021_022012f0
