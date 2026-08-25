; Matching retail form; see src/game/dual_screen_ui_standard_presentation.c.
.text
.extern DebugSpriteText_DrawCentered
.extern DualScreenUiGridState_Update
.extern GraphicsSpriteGroup_AdvanceAnimations

    .global DualScreenUiStandardPresentation_Update
    .type DualScreenUiStandardPresentation_Update, @function
DualScreenUiStandardPresentation_Update: ; 0x0202613c
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xd0]
    cmp r0, #0x0
    beq .L_02026160
    add r0, r4, #0xc8
    mov r1, #0x68
    mov r2, #0xab
    bl DebugSpriteText_DrawCentered
.L_02026160:
    add r0, r4, #0x4
    bl DualScreenUiGridState_Update
    ldr r0, [r4, #0xa8]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldmia sp!, {r4, pc}
    .size DualScreenUiStandardPresentation_Update, . - DualScreenUiStandardPresentation_Update
