; Matching retail form; see src/game/overlay_4c_component_presentation.c.
.text
.extern func_ov094_02219050

    .global Overlay4cComponentPresentation_InvokeComponentOperation0
    .type Overlay4cComponentPresentation_InvokeComponentOperation0, @function
Overlay4cComponentPresentation_InvokeComponentOperation0: ; 0x0202430c
    ldr ip, .L_02024318
    ldr r0, [r0, #0x8]
    bx ip
.L_02024318: .word func_ov094_02219050
    .size Overlay4cComponentPresentation_InvokeComponentOperation0, . - Overlay4cComponentPresentation_InvokeComponentOperation0
