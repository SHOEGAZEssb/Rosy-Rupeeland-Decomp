.text

/* Exact fallback; see src/overlays/ov030/overlay030_display_callbacks.c for documented portable C. */
.extern func_020929f4
.extern GraphicsAffineScanlineWave_Apply


    .global func_ov030_021fe218
func_ov030_021fe218:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x20]
    mov r1, r1, lsl #0x15
    movs r1, r1, asr #0x1f
    beq L_021fe280
    mov r1, #0x4000000
    ldr r3, [r1, #0x0]
    ldr r2, [r0, #0x48]
    bic r3, r3, #0x1f00
    orr r2, r3, r2, lsl #0x8
    str r2, [r1, #0x0]
    add ip, r1, #0x1000
    ldr r3, [ip, #0x0]
    ldr r2, [r0, #0x4c]
    bic r3, r3, #0x1f00
    orr r2, r3, r2, lsl #0x8
    str r2, [ip, #0x0]
    ldr r3, [r0, #0x338]
    ldr r2, L_021fe288
    and r3, r2, r3, lsl #0x10
    str r3, [r1, #0x10]
    ldr r3, [r0, #0x33c]
    add r0, r0, #0x364
    and r2, r2, r3, lsl #0x10
    str r2, [r1, #0x14]
    bl func_020929f4
L_021fe280:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_021fe288: .word 0x1ff0000
.size func_ov030_021fe218, .-func_ov030_021fe218
    .global func_ov030_021fe28c
func_ov030_021fe28c:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x20]
    mov r1, r1, lsl #0x15
    movs r1, r1, asr #0x1f
    beq L_021fe2ac
    add r0, r0, #0x364
    mov r1, #0x0
    bl GraphicsAffineScanlineWave_Apply
L_021fe2ac:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.size func_ov030_021fe28c, .-func_ov030_021fe28c
