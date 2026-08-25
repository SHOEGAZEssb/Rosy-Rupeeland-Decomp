; Matching retail form; see src/game/dual_screen_ui_grid_state.c.
.text

    .global DualScreenUiDerivedPresentation_TestFlagBit7
    .type DualScreenUiDerivedPresentation_TestFlagBit7, @function
DualScreenUiDerivedPresentation_TestFlagBit7: ; 0x02026e38
    ldr r0, [r0, #0xd0]
    and r0, r0, #0x80
    bx lr
    .size DualScreenUiDerivedPresentation_TestFlagBit7, . - DualScreenUiDerivedPresentation_TestFlagBit7
