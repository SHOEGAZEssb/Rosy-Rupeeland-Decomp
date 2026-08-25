; Matching retail form; see src/game/overlay_50_component_presentation.c.
.text
.extern func_ov089_02218720

    .global Overlay50ComponentPresentation_InvokeComponentOperation0
    .type Overlay50ComponentPresentation_InvokeComponentOperation0, @function
Overlay50ComponentPresentation_InvokeComponentOperation0: ; 0x020241e0
    ldr ip, .L_020241ec
    ldr r0, [r0, #0x8]
    bx ip
.L_020241ec: .word func_ov089_02218720 ; func_ov094_02218720
    .size Overlay50ComponentPresentation_InvokeComponentOperation0, . - Overlay50ComponentPresentation_InvokeComponentOperation0
