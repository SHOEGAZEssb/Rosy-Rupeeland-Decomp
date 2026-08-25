; Matching retail form; see src/game/dual_screen_ui_indexed_icon_presentation.c.
.text
.extern DebugSpriteText_DrawCentered
.extern DualScreenUiPresentationBase_LoadSubBg1Resources
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern gDebugFont

    .global func_020263a0
    .type func_020263a0, @function
func_020263a0: ; 0x020263a0
    stmdb sp!, {r4, lr}
    ldr r1, .L_020263d0
    mov r4, r0
    ldr r0, [r1, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    mov r0, r4
    bl DualScreenUiPresentationBase_LoadSubBg1Resources
    add r0, r4, #0xc8
    mov r1, #0x68
    mov r2, #0xab
    bl DebugSpriteText_DrawCentered
    ldmia sp!, {r4, pc}
.L_020263d0: .word gDebugFont
    .size func_020263a0, . - func_020263a0
