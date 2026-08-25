    .text
/* Exact fallback; see src/overlays/ov021/overlay021_auxiliary_helpers.c. */
    .extern Heap_Alloc
    .extern data_020f4e14
    .extern data_ov021_02202fb0
    .extern OverlaySlot_LoadOverlay
    .extern func_ov000_021fb6e0
    .extern gHeapContext

.global Overlay021_CreateAuxiliaryPanel
Overlay021_CreateAuxiliaryPanel:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x390]
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    add r0, r4, #0x1c
    ldr r1, L_021fee04
    add r0, r0, #0x400
    bl OverlaySlot_LoadOverlay
    ldr r1, L_021fee08
    ldr r3, L_021fee0c
    mov r0, #0xb4
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fedfc
    ldr r1, L_021fee10
    mov r2, #0x0
    ldr r1, [r1, #0x0]
    bl func_ov000_021fb6e0 ; func_ov001_021fb6e0, Overlay002_Presentation_Init, Overlay003_PixelBuffer_Init, func_ov004_021fb6e0, func_ov005_021fb6e0, Overlay006_InitTransitionState, func_ov007_021fb6e0, func_ov008_021fb6e0
L_021fedfc:
    str r0, [r4, #0x390]
    ldmia sp!, {r4, pc}
L_021fee04: .word 0x2
L_021fee08: .word data_ov021_02202fb0
L_021fee0c: .word gHeapContext
L_021fee10: .word data_020f4e14
    .size Overlay021_CreateAuxiliaryPanel, . - Overlay021_CreateAuxiliaryPanel

