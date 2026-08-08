.text

/* Exact fallback; see src/overlays/ov025/overlay025_effect_controller.c. */
.extern func_02072b68
.extern func_ov025_021fe174


    .global func_ov025_021fe39c
func_ov025_021fe39c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r1, #0x1
    mov r2, #0x16
    mov r3, #0x2
    bl func_ov025_021fe174
    ldr r2, [r4, #0xec]
    mov r1, #0xd
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x2
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0xec]
    bl func_02072b68
    ldr r2, [r4, #0xf4]
    mov r1, #0xd
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x2
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0xf4]
    bl func_02072b68
    mov r0, #0x0
    str r0, [r4, #0xa8]
    ldmia sp!, {r4, pc}
.size func_ov025_021fe39c, .-func_ov025_021fe39c

