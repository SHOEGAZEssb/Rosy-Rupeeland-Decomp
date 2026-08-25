    .text
/* Exact fallback; see src/overlays/ov021/overlay021_widget_helpers.c. */
    .extern OverlaySlot_UnloadOverlay
    .extern Overlay000_CaptureViewState
    .extern Overlay021_CopySnapshot

.global Overlay021_DestroyPrimaryPanel
Overlay021_DestroyPrimaryPanel:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    mov r4, r0
    ldr r1, [r4, #0x354]
    cmp r1, #0x0
    beq L_021feac0
    add r0, sp, #0x0
    bl Overlay000_CaptureViewState
    add r1, sp, #0x0
    add r0, r4, #0x35c
    bl Overlay021_CopySnapshot
    ldr r0, [r4, #0x354]
    cmp r0, #0x0
    beq L_021feaac
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021feaac:
    add r0, r4, #0x1c
    mov r1, #0x0
    add r0, r0, #0x400
    str r1, [r4, #0x354]
    bl OverlaySlot_UnloadOverlay
L_021feac0:
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
    .size Overlay021_DestroyPrimaryPanel, . - Overlay021_DestroyPrimaryPanel

