.text

/* Exact fallback; see src/overlays/ov024/overlay024_state_callbacks.c. */
.extern func_ov046_0220c1d8


    .global func_ov024_021fe0cc
func_ov024_021fe0cc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x15
    movs r0, r0, asr #0x1f
    beq L_021fe140
    ldr r0, [r4, #0x2c0]
    bl func_ov046_0220c1d8
    mov r0, #0x4000000
    ldr r2, [r0, #0x0]
    ldr r1, [r4, #0x48]
    bic r2, r2, #0x1f00
    orr r1, r2, r1, lsl #0x8
    str r1, [r0, #0x0]
    ldr r2, [r4, #0x2e8]
    ldr r1, L_021fe148
    and r2, r1, r2, lsl #0x10
    str r2, [r0, #0x10]
    ldr r2, [r4, #0x2e8]
    sub r2, r2, #0xc0
    and r2, r1, r2, lsl #0x10
    str r2, [r0, #0x14]
    ldr r2, [r4, #0x2e8]
    sub r2, r2, #0x180
    and r2, r1, r2, lsl #0x10
    str r2, [r0, #0x18]
    ldr r2, [r4, #0x2e8]
    and r1, r1, r2, lsl #0x10
    str r1, [r0, #0x1c]
L_021fe140:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fe148: .word 0x1ff0000
.size func_ov024_021fe0cc, .-func_ov024_021fe0cc

