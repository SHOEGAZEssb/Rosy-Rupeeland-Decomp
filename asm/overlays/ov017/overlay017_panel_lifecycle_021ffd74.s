    .text
/* Exact fallback; see src/overlays/ov017/overlay017_panel_lifecycle.c. */
    .extern ModalState_DrawFrame
.global Overlay017_DestroyModalPanel
Overlay017_DestroyModalPanel:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x400]
    bl ModalState_DrawFrame
    ldr r0, [r4, #0x400]
    cmp r0, #0x0
    beq L_021ffd9c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021ffd9c:
    mov r0, #0x0
    str r0, [r4, #0x400]
    ldr r0, [r4, #0x48]
    bic r0, r0, #0x4
    str r0, [r4, #0x48]
    ldmia sp!, {r4, pc}
    .size Overlay017_DestroyModalPanel, . - Overlay017_DestroyModalPanel
