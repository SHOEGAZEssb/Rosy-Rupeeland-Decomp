; Matching retail form; see src/game/overlay_18_component_presentation.c.
.text
.extern data_ov089_02219b78

    .global Overlay18ComponentPresentation_InvokeComponentOperation1
    .type Overlay18ComponentPresentation_InvokeComponentOperation1, @function
Overlay18ComponentPresentation_InvokeComponentOperation1: ; 0x02024584
    ldr ip, .L_02024590
    ldr r0, [r0, #0x8]
    bx ip
.L_02024590: .word data_ov089_02219b78 ; func_ov094_02219b78
    .size Overlay18ComponentPresentation_InvokeComponentOperation1, . - Overlay18ComponentPresentation_InvokeComponentOperation1
