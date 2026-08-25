; Matching retail form; see src/game/overlay_4c_component_presentation.c.
.text
.extern func_ov094_022191fc

    .global Overlay4cComponentPresentation_InvokeComponentOperation1
    .type Overlay4cComponentPresentation_InvokeComponentOperation1, @function
Overlay4cComponentPresentation_InvokeComponentOperation1: ; 0x0202431c
    ldr ip, .L_02024328
    ldr r0, [r0, #0x8]
    bx ip
.L_02024328: .word func_ov094_022191fc
    .size Overlay4cComponentPresentation_InvokeComponentOperation1, . - Overlay4cComponentPresentation_InvokeComponentOperation1
