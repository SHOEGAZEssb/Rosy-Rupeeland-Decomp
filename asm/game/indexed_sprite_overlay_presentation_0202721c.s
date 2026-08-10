; Matching retail form; see src/game/indexed_sprite_overlay_presentation.c.
.text
.extern gIndexedSpriteOverlayPresentationVtable
.extern func_0201e28c
.extern func_02071eb8
.extern GraphicsSpriteGroup_Destroy

    .global IndexedSpriteOverlayPresentation_Destroy
    .type IndexedSpriteOverlayPresentation_Destroy, @function
IndexedSpriteOverlayPresentation_Destroy: ; 0x0202721c
    stmdb sp!, {r4, lr}
    ldr r1, .L_02027264
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    beq .L_02027244
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02027244:
    ldr r0, [r4, #0x14]
    bl GraphicsSpriteGroup_Destroy
    add r0, r4, #0x8
    bl func_02071eb8
    mov r0, r4
    bl func_0201e28c
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02027264: .word gIndexedSpriteOverlayPresentationVtable
    .size IndexedSpriteOverlayPresentation_Destroy, . - IndexedSpriteOverlayPresentation_Destroy
