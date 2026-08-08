.text

/* Exact fallback; see src/overlays/ov032/overlay032_widget_helpers.c for documented portable C. */
.extern func_ov032_02201ea4

    .global func_ov032_02201e58
func_ov032_02201e58:
    stmdb sp!, {r3, lr}
    ldr r3, [r0, #0x4c]
    ldr r1, [r3, #0x2c]
    ldr r2, [r3, #0x30]
    add r1, r1, r1, lsr #0x1f
    cmp r2, r1, asr #0x1
    bne L_02201e9c
    ldr r2, [r3, #0xc]
    ldr r1, [r3, #0x10]
    cmp r2, r1
    movne r1, #0x1
    moveq r1, #0x0
    cmp r1, #0x0
    beq L_02201e94
    bl func_ov032_02201ea4
L_02201e94:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
L_02201e9c:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.size func_ov032_02201e58, .-func_ov032_02201e58

