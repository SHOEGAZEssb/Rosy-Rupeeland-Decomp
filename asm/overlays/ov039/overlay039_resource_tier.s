.text
/* Exact fallback; see overlay039_resource_tier.c for portable C. */
    .extern func_020befec
    .extern func_0209a07c
    .extern func_0209a0d8
    .extern func_ov039_021fd84c

    .global func_ov039_021ff01c
func_ov039_021ff01c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    add r0, r4, #0x1c00
    ldrsh r0, [r0, #0xa8]
    cmp r0, #0x0
    ble L_021ff2cc
    mov r1, #0xa
    bl func_020befec
    cmp r0, #0x1
    bne L_021ff188
    ldr r0, [r4, #0x98]
    bl func_0209a07c
    ldr r2, [r4, #0x48]
    mov r0, #0x2
    ldr r3, [r2, #0x0]
    ldr r1, L_021ff324
    str r3, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x98]
    add r2, r1, #0x14
    add r3, r1, #0x2
    bl func_0209a0d8
    ldr r0, [r4, #0x74]
    bl func_0209a07c
    ldr r0, [r4, #0x78]
    bl func_0209a07c
    ldr r0, [r4, #0x7c]
    bl func_0209a07c
    add r0, r4, #0x1c00
    ldrh r0, [r0, #0xb2]
    ldr r1, L_021ff328
    cmp r0, #0x0
    ldr r0, [r4, #0x48]
    ldr r2, [r0, #0x0]
    mov r0, #0x1
    bne L_021ff11c
    str r2, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x74]
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a0d8
    ldr r0, [r4, #0x48]
    ldr r1, L_021ff328
    ldr r2, [r0, #0x0]
    mov r0, #0x1
    str r2, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x78]
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a0d8
    ldr r2, [r4, #0x48]
    ldr r1, L_021ff328
    ldr r3, [r2, #0x0]
    mov r0, #0x1
    str r3, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x7c]
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a0d8
    b L_021ff2cc
L_021ff11c:
    str r2, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x74]
    add r2, r1, #0xb
    add r3, r1, #0x2
    bl func_0209a0d8
    ldr r0, [r4, #0x48]
    ldr r1, L_021ff328
    ldr r2, [r0, #0x0]
    mov r0, #0x1
    str r2, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x78]
    add r2, r1, #0xb
    add r3, r1, #0x2
    bl func_0209a0d8
    ldr r2, [r4, #0x48]
    ldr r1, L_021ff328
    ldr r3, [r2, #0x0]
    mov r0, #0x1
    str r3, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x7c]
    add r2, r1, #0xb
    add r3, r1, #0x2
    bl func_0209a0d8
    b L_021ff2cc
L_021ff188:
    cmp r0, #0x2
    bne L_021ff2cc
    ldr r0, [r4, #0x98]
    bl func_0209a07c
    ldr r2, [r4, #0x48]
    mov r0, #0x2
    ldr r3, [r2, #0x0]
    ldr r1, L_021ff324
    str r3, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x98]
    add r2, r1, #0x13
    add r3, r1, #0x2
    bl func_0209a0d8
    ldr r0, [r4, #0x74]
    bl func_0209a07c
    ldr r0, [r4, #0x78]
    bl func_0209a07c
    ldr r0, [r4, #0x7c]
    bl func_0209a07c
    add r0, r4, #0x1c00
    ldrh r0, [r0, #0xb2]
    ldr r1, L_021ff32c
    cmp r0, #0x0
    ldr r0, [r4, #0x48]
    ldr r2, [r0, #0x0]
    mov r0, #0x1
    bne L_021ff264
    str r2, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x74]
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a0d8
    ldr r0, [r4, #0x48]
    ldr r1, L_021ff32c
    ldr r2, [r0, #0x0]
    mov r0, #0x1
    str r2, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x78]
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a0d8
    ldr r2, [r4, #0x48]
    ldr r1, L_021ff32c
    ldr r3, [r2, #0x0]
    mov r0, #0x1
    str r3, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x7c]
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a0d8
    b L_021ff2cc
L_021ff264:
    str r2, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x74]
    add r2, r1, #0xd
    add r3, r1, #0x2
    bl func_0209a0d8
    ldr r0, [r4, #0x48]
    ldr r1, L_021ff32c
    ldr r2, [r0, #0x0]
    mov r0, #0x1
    str r2, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x78]
    add r2, r1, #0xd
    add r3, r1, #0x2
    bl func_0209a0d8
    ldr r2, [r4, #0x48]
    ldr r1, L_021ff32c
    ldr r3, [r2, #0x0]
    mov r0, #0x1
    str r3, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x7c]
    add r2, r1, #0xd
    add r3, r1, #0x2
    bl func_0209a0d8
L_021ff2cc:
    mov r2, #0x1
    ldr r1, [r4, #0x98]
    mov r0, r4
    mov r3, r2
    bl func_ov039_021fd84c
    mov r2, #0x1
    ldr r1, [r4, #0x74]
    mov r0, r4
    mov r3, r2
    bl func_ov039_021fd84c
    mov r2, #0x1
    ldr r1, [r4, #0x78]
    mov r0, r4
    mov r3, r2
    bl func_ov039_021fd84c
    ldr r1, [r4, #0x7c]
    mov r0, r4
    mov r2, #0x0
    mov r3, #0x1
    bl func_ov039_021fd84c
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
L_021ff324: .word 0x1271
L_021ff328: .word 0x127d
L_021ff32c: .word 0x127a
    .size func_ov039_021ff01c, .-func_ov039_021ff01c

