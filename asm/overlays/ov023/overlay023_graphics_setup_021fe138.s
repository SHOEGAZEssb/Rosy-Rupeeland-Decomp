.text

/* Exact fallback; see src/overlays/ov023/overlay023_graphics_setup.c. */
.extern GraphicsAffineScanlineWave_Apply


    .global func_ov023_021fe138
func_ov023_021fe138:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x20]
    mov r1, r1, lsl #0x15
    movs r1, r1, asr #0x1f
    beq L_021fe15c
    add r0, r0, #0xc4
    add r0, r0, #0x400
    mov r1, #0x0
    bl GraphicsAffineScanlineWave_Apply
L_021fe15c:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.size func_ov023_021fe138, .-func_ov023_021fe138

