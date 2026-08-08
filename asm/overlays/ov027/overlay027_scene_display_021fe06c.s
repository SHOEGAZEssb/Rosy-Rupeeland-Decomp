.text

/* Exact fallback; see corresponding documented C source. */
.extern func_ov048_0220ba90


    .global func_ov027_021fe06c
func_ov027_021fe06c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x15
    movs r0, r0, asr #0x1f
    beq L_021fe0a4
    add r0, r4, #0x198
    bl func_ov048_0220ba90
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    ldr r0, [r4, #0x48]
    bic r1, r1, #0x1f00
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
L_021fe0a4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size func_ov027_021fe06c, .-func_ov027_021fe06c

