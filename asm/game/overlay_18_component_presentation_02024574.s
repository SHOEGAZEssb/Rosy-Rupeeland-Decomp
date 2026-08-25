; Matching retail form; see src/game/overlay_18_component_presentation.c.
.text
.extern data_ov089_02219ad4

    .global Overlay18ComponentPresentation_InvokeComponentOperation0
    .type Overlay18ComponentPresentation_InvokeComponentOperation0, @function
Overlay18ComponentPresentation_InvokeComponentOperation0: ; 0x02024574
    ldr ip, .L_02024580
    ldr r0, [r0, #0x8]
    bx ip
.L_02024580: .word data_ov089_02219ad4 ; func_ov094_02219ad4
    .size Overlay18ComponentPresentation_InvokeComponentOperation0, . - Overlay18ComponentPresentation_InvokeComponentOperation0
