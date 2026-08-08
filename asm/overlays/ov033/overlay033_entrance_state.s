.text

/* Exact fallback; see src/overlays/ov033/overlay033_entrance_state.c for documented portable C. */

    .extern func_02092c8c
    .extern func_02091bac
    .extern func_02091c7c
    .extern func_02091cf0
    .extern func_ov033_021fd04c
    .extern func_020740a4
    .extern data_ov033_021fdd00

    .global func_ov033_021fd624
func_ov033_021fd624:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r0, [r4, #0xd0]
    cmp r0, #0x0
    beq L_021fd648
    cmp r0, #0x1
    beq L_021fd6b8
    b L_021fd720
L_021fd648:
    mov r0, #0x3
    mov r1, #0x0
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    add r0, r4, #0x4c
    ldr r2, [r1, #0x24]
    mov ip, #0x5a
    add r3, r2, #0x40000
    mov r1, #0x2
    str ip, [sp, #0x0]
    bl func_02091bac
    mov ip, #0x5a
    add r0, r4, #0x68
    mov r1, #0x2
    mov r2, #0x2000
    mov r3, #0x0
    str ip, [sp, #0x0]
    bl func_02091bac
    mov r0, #0x5a
    str r0, [sp, #0x0]
    mov r1, #0x1
    add r0, r4, #0x84
    sub r2, r1, #0x9
    mov r3, #0x0
    bl func_02091bac
    ldr r0, [r4, #0xd0]
    add r0, r0, #0x1
    str r0, [r4, #0xd0]
L_021fd6b8:
    add r0, r4, #0x4c
    mov r1, #0x1
    bl func_02091c7c
    ldr r2, [r4, #0x4]
    mov r1, #0x1
    str r0, [r2, #0x24]
    add r0, r4, #0x68
    bl func_02091c7c
    ldr r2, [r4, #0x48]
    mov r1, #0x1
    str r0, [r2, #0x12c]
    add r0, r4, #0x84
    bl func_02091c7c
    ldr r1, [r4, #0x48]
    str r0, [r1, #0x130]
    add r0, r4, #0x4c
    bl func_02091cf0
    cmp r0, #0x0
    beq L_021fd720
    ldr r0, [r4, #0x48]
    mov r2, #0x0
    ldr r1, L_021fd734
    str r2, [r0, #0x12c]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov033_021fd04c
L_021fd720:
    ldr r0, [r4, #0x0]
    bl func_020740a4
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
L_021fd734: .word data_ov033_021fdd00
.size func_ov033_021fd624, .-func_ov033_021fd624
