; Matching retail form; see src/game/indexed_sprite_overlay_presentation.c.
.text
.extern GraphicsSpriteGroup_ReleaseIndexedEntries

    .global IndexedSpriteOverlayPresentation_SetVisible
    .type IndexedSpriteOverlayPresentation_SetVisible, @function
IndexedSpriteOverlayPresentation_SetVisible: ; 0x020272e0
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x14]
    cmp r1, #0x0
    movne r1, #0x1
    strne r1, [r0, #0x20]
    ldmneia sp!, {r3, pc}
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
    ldmia sp!, {r3, pc}
    .size IndexedSpriteOverlayPresentation_SetVisible, . - IndexedSpriteOverlayPresentation_SetVisible
