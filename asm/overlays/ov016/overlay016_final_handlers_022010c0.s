    .text

/* Exact fallback; see src/overlays/ov016/overlay016_final_handlers.c. */
    .extern data_020f4e14
    .extern data_ov016_02201430
    .extern func_02002d94
    .extern func_020755bc
    .extern func_02092c8c
    .extern func_ov016_021fd3f8
    .extern func_ov016_021fe754
    .extern func_ov016_021ff094
    .extern func_ov016_021ff404
    .extern func_ov016_021ff71c
    .extern func_ov016_021ff7bc
    .extern func_ov016_021ff848
    .extern func_ov016_021ffba4
.global func_ov016_022010c0
func_ov016_022010c0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_022010e8
    cmp r0, #0x1
    beq L_02201108
    cmp r0, #0x2
    beq L_02201178
    b L_022011a8
L_022010e8:
    mov r0, #0x1
    sub r1, r0, #0x11
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_02201108:
    bl func_02002d94
    cmp r0, #0x0
    beq L_022011a8
    mov r0, r4
    bl func_ov016_021ff71c
    ldr r0, L_022011b8
    ldr r0, [r0, #0x0]
    bl func_020755bc
    mov r0, r4
    mov r1, #0x18
    bl func_ov016_021ff848
    mov r0, r4
    bl func_ov016_021ff404
    mov r0, r4
    bl func_ov016_021ff094
    ldr r0, [r4, #0x444]
    bl func_ov016_021fd3f8
    mov r0, r4
    bl func_ov016_021ffba4
    mov r0, #0x1
    mov r1, #0x0
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_022011a8
L_02201178:
    bl func_02002d94
    cmp r0, #0x0
    beq L_022011a8
    ldr r1, L_022011bc
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov016_021fe754
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_022011a8:
    mov r0, r4
    bl func_ov016_021ff7bc
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_022011b8: .word data_020f4e14
L_022011bc: .word data_ov016_02201430
    .size func_ov016_022010c0, . - func_ov016_022010c0

