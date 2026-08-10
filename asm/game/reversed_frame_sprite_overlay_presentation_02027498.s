; Matching retail form; see src/game/reversed_frame_sprite_overlay_presentation.c.
.text
.extern GraphicsSpriteGroup_ReleaseIndexedEntries

    .global ReversedFrameSpriteOverlayPresentation_SetVisible
    .type ReversedFrameSpriteOverlayPresentation_SetVisible, @function
ReversedFrameSpriteOverlayPresentation_SetVisible: ; 0x02027498
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x14]
    cmp r1, #0x0
    movne r1, #0x1
    strne r1, [r0, #0x20]
    ldmneia sp!, {r3, pc}
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
    ldmia sp!, {r3, pc}
    .size ReversedFrameSpriteOverlayPresentation_SetVisible, . - ReversedFrameSpriteOverlayPresentation_SetVisible
