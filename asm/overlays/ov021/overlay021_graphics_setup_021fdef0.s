    .text
/* Exact fallback; see src/overlays/ov021/overlay021_graphics_setup.c. */
    .extern func_020929f4

.global func_ov021_021fdef0
func_ov021_021fdef0:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x20]
    mov r1, r1, lsl #0x15
    movs r1, r1, asr #0x1f
    beq L_021fdf50
    mov ip, #0x4000000
    ldr r2, [ip, #0x0]
    ldr r1, [r0, #0x48]
    bic r2, r2, #0x1f00
    orr r1, r2, r1, lsl #0x8
    str r1, [ip, #0x0]
    add r3, ip, #0x1000
    ldr r2, [r3, #0x0]
    ldr r1, [r0, #0x4c]
    bic r2, r2, #0x1f00
    orr r1, r2, r1, lsl #0x8
    str r1, [r3, #0x0]
    ldr r2, [r0, #0x3fc]
    ldr r1, L_021fdf58
    add r0, r0, #0x4
    and r1, r1, r2, lsl #0x10
    add r0, r0, #0x400
    str r1, [ip, #0x14]
    bl func_020929f4
L_021fdf50:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_021fdf58: .word 0x1ff0000
    .size func_ov021_021fdef0, . - func_ov021_021fdef0

