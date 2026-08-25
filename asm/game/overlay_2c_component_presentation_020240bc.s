; Matching retail form; see src/game/overlay_2c_component_presentation.c.
.text
.extern func_ov094_02217e94

    .global Overlay2cComponentPresentation_InvokeComponentOperation1
    .type Overlay2cComponentPresentation_InvokeComponentOperation1, @function
Overlay2cComponentPresentation_InvokeComponentOperation1: ; 0x020240bc
    ldr ip, .L_020240c8
    ldr r0, [r0, #0x8]
    bx ip
.L_020240c8: .word func_ov094_02217e94
    .size Overlay2cComponentPresentation_InvokeComponentOperation1, . - Overlay2cComponentPresentation_InvokeComponentOperation1
