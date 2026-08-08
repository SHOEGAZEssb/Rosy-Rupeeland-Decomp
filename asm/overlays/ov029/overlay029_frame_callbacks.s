.text

/* Exact fallback; see src/overlays/ov029/overlay029_frame_callbacks.c. */
.extern func_020929f4
.extern func_02092a34


    .global func_ov029_021fd3d4
func_ov029_021fd3d4:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x20]
    mov r1, r1, lsl #0x15
    movs r1, r1, asr #0x1f
    beq L_021fd430
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
    ldr r2, [r0, #0xe0]
    ldr r1, L_021fd438
    add r0, r0, #0xec
    and r1, r1, r2, lsl #0x10
    str r1, [ip, #0x14]
    bl func_020929f4
L_021fd430:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_021fd438: .word 0x1ff0000
.size func_ov029_021fd3d4, .-func_ov029_021fd3d4
    .global func_ov029_021fd43c
func_ov029_021fd43c:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x20]
    mov r1, r1, lsl #0x15
    movs r1, r1, asr #0x1f
    beq L_021fd45c
    add r0, r0, #0xec
    mov r1, #0x0
    bl func_02092a34
L_021fd45c:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.size func_ov029_021fd43c, .-func_ov029_021fd43c
