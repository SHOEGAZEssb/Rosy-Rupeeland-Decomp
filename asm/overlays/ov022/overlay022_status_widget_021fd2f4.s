    .text
/* Exact fallback; see src/overlays/ov022/overlay022_status_widget.c. */
    .extern data_021f5128
    .extern func_02076148
    .extern func_020761f8
    .extern func_0207b44c
    .extern gDebugFont

.global func_ov022_021fd2f4
func_ov022_021fd2f4:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    ldr r0, L_021fd368
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x1c]
    bl func_0207b44c
    mov r4, r0
    ldr r0, L_021fd36c
    mov r2, #0x8
    ldr r0, [r0, #0x0]
    mov r1, r4
    sub r3, r2, #0xa
    bl func_020761f8
    mov r2, #0xd
    mov r1, #0x8
    str r2, [sp, #0x0]
    add r0, r0, r0, lsr #0x1f
    mov r2, r0, asr #0x1
    str r1, [sp, #0x4]
    sub r1, r1, #0xa
    str r1, [sp, #0x8]
    ldr r0, L_021fd36c
    mov r1, r4
    ldr r0, [r0, #0x0]
    rsb r2, r2, #0x40
    mov r3, #0xac
    bl func_02076148
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
L_021fd368: .word data_021f5128
L_021fd36c: .word gDebugFont
.size func_ov022_021fd2f4, . - func_ov022_021fd2f4
