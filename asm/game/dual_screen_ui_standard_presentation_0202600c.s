; Matching retail form; see src/game/dual_screen_ui_standard_presentation.c.
.text
.extern func_02025d1c
.extern func_02025dd8
.extern func_02026174
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern gDebugFont

    .global func_0202600c
    .type func_0202600c, @function
func_0202600c: ; 0x0202600c
    stmdb sp!, {r4, lr}
    ldr r1, .L_02026040
    mov r4, r0
    ldr r0, [r1, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    mov r0, r4
    bl func_02025d1c
    mov r0, r4
    bl func_02025dd8
    ldr r1, [r4, #0xac]
    mov r0, r4
    bl func_02026174
    ldmia sp!, {r4, pc}
.L_02026040: .word gDebugFont
    .size func_0202600c, . - func_0202600c
