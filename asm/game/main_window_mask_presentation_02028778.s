; Matching retail form; see src/game/main_window_mask_presentation.c.
.text
.extern data_020de838
.extern FieldEffect_Init

    .global MainWindowMaskPresentation_Init
    .type MainWindowMaskPresentation_Init, @function
MainWindowMaskPresentation_Init: ; 0x02028778
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl FieldEffect_Init
    ldr r1, .L_020287a0
    mov r0, r4
    str r1, [r4, #0x0]
    ldr r1, [r4, #0x4]
    orr r1, r1, #0x2
    str r1, [r4, #0x4]
    ldmia sp!, {r4, pc}
.L_020287a0: .word data_020de838
    .size MainWindowMaskPresentation_Init, . - MainWindowMaskPresentation_Init

