    .text
    .extern ModalState_DrawFrame

/* Exact fallback for transient presentation teardown; see src/overlays/ov015/overlay015_selection_runtime.c. */
    .global Overlay015_DestroyPrompt

Overlay015_DestroyPrompt:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xf8]
    bl ModalState_DrawFrame
    ldr r0, [r4, #0xf8]
    cmp r0, #0x0
    beq L_021fded4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fded4:
    mov r0, #0x0
    str r0, [r4, #0xf8]
    ldr r0, [r4, #0x48]
    bic r0, r0, #0x2
    str r0, [r4, #0x48]
    ldmia sp!, {r4, pc}

    .size Overlay015_DestroyPrompt, . - Overlay015_DestroyPrompt
