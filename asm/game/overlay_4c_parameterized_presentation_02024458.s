; Matching retail form; see src/game/overlay_4c_parameterized_presentation.c.
.text
.extern data_ov089_022198e8

    .global Overlay4cParameterizedPresentation_InvokeComponentOperation1
    .type Overlay4cParameterizedPresentation_InvokeComponentOperation1, @function
Overlay4cParameterizedPresentation_InvokeComponentOperation1: ; 0x02024458
    ldr ip, .L_02024464
    ldr r0, [r0, #0x8]
    bx ip
.L_02024464: .word data_ov089_022198e8 ; func_ov094_022198e8, func_ov097_022198e8
    .size Overlay4cParameterizedPresentation_InvokeComponentOperation1, . - Overlay4cParameterizedPresentation_InvokeComponentOperation1
