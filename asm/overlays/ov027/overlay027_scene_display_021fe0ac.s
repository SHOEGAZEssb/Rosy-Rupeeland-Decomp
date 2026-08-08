.text

/* Exact fallback; see corresponding documented C source. */
.extern func_020b0300
.extern func_ov048_0220b7b8


    .global func_ov027_021fe0ac
func_ov027_021fe0ac:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    add r0, r4, #0x198
    bl func_ov048_0220b7b8
    ldr r0, L_021fe0f4
    mov r1, #0x11
    mov r2, r0
    str r1, [r4, #0x48]
    mov ip, #0x0
    mov r1, #0x1f
    mov r3, #0x3f
    str ip, [sp, #0x0]
    bl func_020b0300
    mov r0, #0x1
    str r0, [r4, #0x80]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
L_021fe0f4: .word 0x7fff
.size func_ov027_021fe0ac, .-func_ov027_021fe0ac

