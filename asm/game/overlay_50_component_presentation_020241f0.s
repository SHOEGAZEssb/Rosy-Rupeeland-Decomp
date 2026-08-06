; Matching retail form; see src/game/overlay_50_component_presentation.c.
.text
.extern data_ov087_022189f8

    .global func_020241f0
    .type func_020241f0, @function
func_020241f0: ; 0x020241f0
    ldr ip, .L_020241fc
    ldr r0, [r0, #0x8]
    bx ip
.L_020241fc: .word data_ov087_022189f8 ; data_ov093_022189f8, func_ov094_022189f8
    .size func_020241f0, . - func_020241f0
