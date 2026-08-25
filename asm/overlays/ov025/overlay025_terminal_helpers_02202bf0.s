.text

/* Exact fallback; see src/overlays/ov025/overlay025_terminal_helpers.c. */
.extern GraphicsAffineScanlineWave_Apply


    .global func_ov025_02202bf0
func_ov025_02202bf0:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x20]
    mov r1, r1, lsl #0x15
    movs r1, r1, asr #0x1f
    ldrne r1, [r0, #0x598]
    cmpne r1, #0x0
    beq L_02202c18
    add r0, r0, #0x5a0
    mov r1, #0x0
    bl GraphicsAffineScanlineWave_Apply
L_02202c18:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.size func_ov025_02202bf0, .-func_ov025_02202bf0

