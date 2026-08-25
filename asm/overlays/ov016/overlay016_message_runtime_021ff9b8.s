    .text

/* Exact fallback; see src/overlays/ov016/overlay016_message_runtime.c. */
    .extern ModalState_DrawFrame
.global func_ov016_021ff9b8
func_ov016_021ff9b8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x460]
    bl ModalState_DrawFrame
    ldr r0, [r4, #0x460]
    cmp r0, #0x0
    beq L_021ff9e0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021ff9e0:
    mov r0, #0x0
    str r0, [r4, #0x460]
    ldr r0, [r4, #0x48]
    bic r0, r0, #0x2
    str r0, [r4, #0x48]
    ldmia sp!, {r4, pc}
    .size func_ov016_021ff9b8, . - func_ov016_021ff9b8

