    .text
    .extern data_ov014_021fd940
    .extern func_02064be0
    .extern func_ov000_021fc164
    .extern func_ov000_021fc254
    .extern func_ov000_021fc3a4
    .extern func_ov000_021fc614
    .extern func_ov000_021fc714
    .extern func_ov000_021fc9d4
    .extern func_ov014_021fce14

/* Exact fallback; see the documented portable reconstruction in
 * src/overlays/ov014/overlay014_state_machines.c. */
    .global func_ov014_021fd7b4

func_ov014_021fd7b4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_021fd7d4
    cmp r0, #0x1
    beq L_021fd84c
    b L_021fd880
L_021fd7d4:
    ldr r0, [r4, #0x78]
    ldr r2, [r0, #0x150]
    ldr r1, [r0, #0x14c]
    cmp r2, r1
    movge r1, #0x1
    movlt r1, #0x0
    cmp r1, #0x0
    beq L_021fd880
    bl func_ov000_021fc3a4
    ldr r0, [r4, #0x8c]
    cmp r0, #0x0
    bne L_021fd81c
    mov r1, #0x1
    str r1, [r4, #0x8c]
    ldr r0, [r4, #0x78]
    ldr r0, [r0, #0x24c]
    bl func_02064be0
    b L_021fd834
L_021fd81c:
    mov r0, #0x0
    str r0, [r4, #0x8c]
    ldr r0, [r4, #0x78]
    mov r1, #0x2
    ldr r0, [r0, #0x24c]
    bl func_02064be0
L_021fd834:
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fd880
L_021fd84c:
    ldr r0, [r4, #0x78]
    mov r1, #0x0
    bl func_ov000_021fc614
    ldr r0, [r4, #0x78]
    bl func_ov000_021fc254
    ldr r0, [r4, #0x78]
    bl func_ov000_021fc714
    ldr r0, [r4, #0x78]
    bl func_ov000_021fc9d4
    ldr r1, L_021fd898
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov014_021fce14
L_021fd880:
    ldr r0, [r4, #0x78]
    cmp r0, #0x0
    beq L_021fd890
    bl func_ov000_021fc164
L_021fd890:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fd898: .word data_ov014_021fd940
    .size func_ov014_021fd7b4, . - func_ov014_021fd7b4
