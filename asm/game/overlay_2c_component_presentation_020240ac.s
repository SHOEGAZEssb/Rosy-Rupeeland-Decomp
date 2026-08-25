; Matching retail form; see src/game/overlay_2c_component_presentation.c.
.text
.extern func_ov094_02217d64

    .global Overlay2cComponentPresentation_InvokeComponentOperation0
    .type Overlay2cComponentPresentation_InvokeComponentOperation0, @function
Overlay2cComponentPresentation_InvokeComponentOperation0: ; 0x020240ac
    ldr ip, .L_020240b8
    ldr r0, [r0, #0x8]
    bx ip
.L_020240b8: .word func_ov094_02217d64
    .size Overlay2cComponentPresentation_InvokeComponentOperation0, . - Overlay2cComponentPresentation_InvokeComponentOperation0
