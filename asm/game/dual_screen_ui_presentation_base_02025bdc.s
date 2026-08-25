; Matching retail form; see src/game/dual_screen_ui_presentation_base.c.
.text
.extern data_020d6b3c
.extern func_02026514
.extern AnimationResourceState_Destroy
.extern GraphicsSpriteGroupOwner_DestroyGroup
.extern gDebugFont

    .global DualScreenUiPresentationBase_DestroyAlternateEntry
    .type DualScreenUiPresentationBase_DestroyAlternateEntry, @function
DualScreenUiPresentationBase_DestroyAlternateEntry: ; 0x02025bdc
    stmdb sp!, {r4, lr}
    ldr r1, .L_02025c14
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, .L_02025c18
    ldr r1, [r4, #0xa8]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_DestroyGroup
    add r0, r4, #0xb8
    bl AnimationResourceState_Destroy
    add r0, r4, #0x4
    bl func_02026514
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02025c14: .word data_020d6b3c
.L_02025c18: .word gDebugFont
    .size DualScreenUiPresentationBase_DestroyAlternateEntry, . - DualScreenUiPresentationBase_DestroyAlternateEntry
