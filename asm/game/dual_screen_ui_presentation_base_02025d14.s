; Matching retail form; see src/game/dual_screen_ui_presentation_base.c.
.text

    .global DualScreenUiPresentationBase_GetEmbeddedState
    .type DualScreenUiPresentationBase_GetEmbeddedState, @function
DualScreenUiPresentationBase_GetEmbeddedState: ; 0x02025d14
    add r0, r0, #0x4
    bx lr
    .size DualScreenUiPresentationBase_GetEmbeddedState, . - DualScreenUiPresentationBase_GetEmbeddedState
