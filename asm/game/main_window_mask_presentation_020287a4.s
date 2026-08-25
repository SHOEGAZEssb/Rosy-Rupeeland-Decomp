; Matching retail form; see src/game/main_window_mask_presentation.c.
.text
.extern FieldEffect_DestroyBase

    .global MainWindowMaskPresentation_Destroy
    .type MainWindowMaskPresentation_Destroy, @function
MainWindowMaskPresentation_Destroy: ; 0x020287a4
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl FieldEffect_DestroyBase
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size MainWindowMaskPresentation_Destroy, . - MainWindowMaskPresentation_Destroy

