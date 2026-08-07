    .text

/* Exact fallback; see src/overlays/ov016/overlay016_message_runtime.c. */
    .extern data_020f4e14
    .extern func_02076428
.global func_ov016_021ffb3c
func_ov016_021ffb3c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r0, [r4, #0x464]
    cmp r0, #0x0
    beq L_021ffb60
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021ffb60:
    mov r1, #0x0
    str r1, [r4, #0x464]
    mov r0, #0x34
    str r0, [sp, #0x0]
    ldr r0, L_021ffba0
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r1, #0x40
    mov r2, #0x14
    mov r3, #0xc0
    bl func_02076428
    ldr r0, [r4, #0x48]
    bic r0, r0, #0x2
    str r0, [r4, #0x48]
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
L_021ffba0: .word data_020f4e14
    .size func_ov016_021ffb3c, . - func_ov016_021ffb3c

