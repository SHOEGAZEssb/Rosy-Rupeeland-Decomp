    .text
/* Exact fallback; see src/overlays/ov021/overlay021_state_exchange.c. */
    .extern data_ov021_02202e20
    .extern data_ov021_02202e28
    .extern data_ov021_02202e30
    .extern func_02002d94
    .extern func_02092c8c
    .extern func_ov021_021fd1cc
    .extern func_ov021_021fd39c
    .extern func_ov021_021fd490
    .extern func_ov021_021fd7c0
    .extern func_ov021_021fe144
    .extern func_ov021_021fe6b0
    .extern func_ov021_021fee14
    .extern func_ov021_021fee54
    .extern func_ov021_021feea4
    .extern func_ov021_021ff050

.global func_ov021_022011a4
func_ov021_022011a4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_022011cc
    cmp r0, #0x1
    beq L_022011ec
    cmp r0, #0x2
    beq L_022012b0
    b L_022012d4
L_022011cc:
    mov r0, #0x1
    sub r1, r0, #0x11
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_022011ec:
    bl func_02002d94
    cmp r0, #0x0
    beq L_022012d4
    mov r0, r4
    bl func_ov021_021fee14
    mov r0, r4
    bl func_ov021_021fe6b0
    ldr r1, [r4, #0x2c4]
    mov r0, r4
    bl func_ov021_021ff050
    ldr r0, [r4, #0x37c]
    cmp r0, #0x0
    beq L_0220123c
    mov r0, #0x0
    ldr r1, L_022012e4
    str r0, [r4, #0x37c]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    b L_022012d4
L_0220123c:
    ldr r0, [r4, #0x380]
    cmp r0, #0x0
    beq L_02201264
    mov r0, #0x0
    ldr r1, L_022012e8
    str r0, [r4, #0x380]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    b L_022012d4
L_02201264:
    mov r0, r4
    bl func_ov021_021fe144
    ldr r0, [r4, #0x2c0]
    bl func_ov021_021fd1cc
    ldr r0, [r4, #0x2c0]
    bl func_ov021_021fd39c
    ldr r0, [r4, #0x2c0]
    bl func_ov021_021fd490
    mov r0, r4
    bl func_ov021_021fee54
    mov r0, #0x1
    mov r1, #0x0
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_022012d4
L_022012b0:
    bl func_02002d94
    cmp r0, #0x0
    beq L_022012d4
    mov r0, #0x0
    ldr r1, L_022012ec
    str r0, [r4, #0x3e0]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
L_022012d4:
    mov r0, r4
    bl func_ov021_021feea4
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_022012e4: .word data_ov021_02202e30
L_022012e8: .word data_ov021_02202e28
L_022012ec: .word data_ov021_02202e20
.size func_ov021_022011a4, . - func_ov021_022011a4
