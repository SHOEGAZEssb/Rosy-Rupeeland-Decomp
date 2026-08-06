; Matching retail form; see src/game/overlay_4c_component_presentation.c.
.text
.extern func_ov094_02219050

    .global func_0202430c
    .type func_0202430c, @function
func_0202430c: ; 0x0202430c
    ldr ip, .L_02024318
    ldr r0, [r0, #0x8]
    bx ip
.L_02024318: .word func_ov094_02219050
    .size func_0202430c, . - func_0202430c
