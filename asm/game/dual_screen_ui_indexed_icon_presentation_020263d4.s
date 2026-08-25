; Matching retail form; see src/game/dual_screen_ui_indexed_icon_presentation.c.
.text
.extern DebugSpriteText_DrawCentered
.extern DualScreenUiGridState_Update
.extern GraphicsSpriteGroup_AdvanceAnimations

    .global DualScreenUiIndexedIconPresentation_Update
    .type DualScreenUiIndexedIconPresentation_Update, @function
DualScreenUiIndexedIconPresentation_Update: ; 0x020263d4
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xd4]
    cmp r0, #0x0
    beq .L_020263f8
    add r0, r4, #0xc8
    mov r1, #0x68
    mov r2, #0xab
    bl DebugSpriteText_DrawCentered
.L_020263f8:
    add r0, r4, #0x4
    bl DualScreenUiGridState_Update
    ldr r0, [r4, #0xa8]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldmia sp!, {r4, pc}
    .size DualScreenUiIndexedIconPresentation_Update, . - DualScreenUiIndexedIconPresentation_Update
