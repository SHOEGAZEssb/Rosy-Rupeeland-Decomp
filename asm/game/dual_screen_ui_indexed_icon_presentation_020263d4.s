; Matching retail form; see src/game/dual_screen_ui_indexed_icon_presentation.c.
.text
.extern DebugSpriteText_DrawCentered
.extern func_020269f8
.extern func_020740a4

    .global func_020263d4
    .type func_020263d4, @function
func_020263d4: ; 0x020263d4
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
    bl func_020269f8
    ldr r0, [r4, #0xa8]
    bl func_020740a4
    ldmia sp!, {r4, pc}
    .size func_020263d4, . - func_020263d4
