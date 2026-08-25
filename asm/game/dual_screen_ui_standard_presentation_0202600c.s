; Matching retail form; see src/game/dual_screen_ui_standard_presentation.c.
.text
.extern DualScreenUiPresentationBase_LoadSubBg1Resources
.extern DualScreenUiPresentationBase_LoadSubBg2Resources
.extern DualScreenUiStandardPresentation_BindSource
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern gDebugFont

    .global DualScreenUiStandardPresentation_RefreshResources
    .type DualScreenUiStandardPresentation_RefreshResources, @function
DualScreenUiStandardPresentation_RefreshResources: ; 0x0202600c
    stmdb sp!, {r4, lr}
    ldr r1, .L_02026040
    mov r4, r0
    ldr r0, [r1, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    mov r0, r4
    bl DualScreenUiPresentationBase_LoadSubBg1Resources
    mov r0, r4
    bl DualScreenUiPresentationBase_LoadSubBg2Resources
    ldr r1, [r4, #0xac]
    mov r0, r4
    bl DualScreenUiStandardPresentation_BindSource
    ldmia sp!, {r4, pc}
.L_02026040: .word gDebugFont
    .size DualScreenUiStandardPresentation_RefreshResources, . - DualScreenUiStandardPresentation_RefreshResources
