; Matching retail form; see src/game/overlay_2c_component_presentation.c.
.text
.extern func_ov094_02217d64

    .global func_020240ac
    .type func_020240ac, @function
func_020240ac: ; 0x020240ac
    ldr ip, .L_020240b8
    ldr r0, [r0, #0x8]
    bx ip
.L_020240b8: .word func_ov094_02217d64
    .size func_020240ac, . - func_020240ac
