    .text
/* Exact fallback; see src/overlays/ov022/overlay022_graphics_setup.c. */
    .extern func_02092a34

.global func_ov022_021fe380
func_ov022_021fe380:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x20]
    mov r1, r1, lsl #0x15
    movs r1, r1, asr #0x1f
    beq L_021fe3b8
    ldr r1, [r0, #0x35c]
    add r0, r0, #0x378
    cmp r1, #0x0
    beq L_021fe3b0
    mov r1, #0x1
    bl func_02092a34
    b L_021fe3b8
L_021fe3b0:
    mov r1, #0x0
    bl func_02092a34
L_021fe3b8:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.size func_ov022_021fe380, . - func_ov022_021fe380
