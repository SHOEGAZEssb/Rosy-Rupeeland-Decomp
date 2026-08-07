.text

/* Exact fallback; see src/overlays/ov023/overlay023_graphics_setup.c. */
.extern func_020929f4


    .global func_ov023_021fe0e0
func_ov023_021fe0e0:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x20]
    mov r1, r1, lsl #0x15
    movs r1, r1, asr #0x1f
    beq L_021fe130
    mov r3, #0x4000000
    ldr r2, [r3, #0x0]
    ldr r1, [r0, #0x48]
    bic r2, r2, #0x1f00
    orr r1, r2, r1, lsl #0x8
    str r1, [r3, #0x0]
    add r3, r3, #0x1000
    ldr r2, [r3, #0x0]
    ldr r1, [r0, #0x4c]
    bic r2, r2, #0x1f00
    add r0, r0, #0xc4
    orr r1, r2, r1, lsl #0x8
    add r0, r0, #0x400
    str r1, [r3, #0x0]
    bl func_020929f4
L_021fe130:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.size func_ov023_021fe0e0, .-func_ov023_021fe0e0

