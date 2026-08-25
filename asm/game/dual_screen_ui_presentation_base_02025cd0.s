; Matching retail form; see src/game/dual_screen_ui_presentation_base.c.
.text
.extern GraphicsSpriteGroup_AdvanceAnimations
.extern GraphicsSpriteGroup_ReleaseIndexedEntries

    .global DualScreenUiPresentationBase_SetEmbeddedEnabled
    .type DualScreenUiPresentationBase_SetEmbeddedEnabled, @function
DualScreenUiPresentationBase_SetEmbeddedEnabled: ; 0x02025cd0
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrb r0, [r4, #0x8c]
    cmp r1, #0x0
    bicne r0, r0, #0x1
    strneb r0, [r4, #0x8c]
    ldmneia sp!, {r4, pc}
    orr r0, r0, #0x1
    strb r0, [r4, #0x8c]
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
    ldr r0, [r4, #0x0]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldmia sp!, {r4, pc}
    .size DualScreenUiPresentationBase_SetEmbeddedEnabled, . - DualScreenUiPresentationBase_SetEmbeddedEnabled
