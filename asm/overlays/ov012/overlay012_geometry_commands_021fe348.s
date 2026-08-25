    .text
/* Exact expression-order fallback; see src/overlays/ov012/overlay012_geometry_commands.c. */
    .global Overlay012_EmitGeometryCommands
Overlay012_EmitGeometryCommands:
    orr r0, r0, r1, lsl #4
    ldr r1, [sp, #4]
    orr r0, r0, r2, lsl #6
    orr r0, r1, r0
    ldr r2, [sp]
    orr r1, r0, r3, lsl #0x18
    ldr r0, L_021fe370
    orr r1, r1, r2, lsl #0x10
    str r1, [r0]
    bx lr
L_021fe370:
    .word 0x040004a4
    .size Overlay012_EmitGeometryCommands, . - Overlay012_EmitGeometryCommands

    .global func_ov012_021fe374
func_ov012_021fe374:
    ldr ip, [sp, #0xc]
    mov r0, r0, lsl #0x1a
    orr r0, r0, ip, lsr #3
    orr r0, r0, r1, lsl #0x1e
    orr r0, r0, r2, lsl #0x14
    ldr r1, [sp]
    orr r0, r0, r3, lsl #0x17
    ldr r2, [sp, #4]
    orr r0, r0, r1, lsl #0x10
    ldr r3, [sp, #8]
    orr r1, r0, r2, lsl #0x12
    ldr r0, L_021fe3b0
    orr r1, r1, r3, lsl #0x1d
    str r1, [r0]
    bx lr
L_021fe3b0:
    .word 0x040004a8
    .size func_ov012_021fe374, . - func_ov012_021fe374

    .global func_ov012_021fe3b4
func_ov012_021fe3b4:
    mov r1, r1, lsl #8
    mov r1, r1, asr #0x10
    mov r0, r0, lsl #8
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r2, r1, lsl #0x10
    ldr r1, L_021fe3e4
    orr r0, r2, r0, lsr #0x10
    str r0, [r1]
    bx lr
L_021fe3e4:
    .word 0x04000488
    .size func_ov012_021fe3b4, . - func_ov012_021fe3b4
