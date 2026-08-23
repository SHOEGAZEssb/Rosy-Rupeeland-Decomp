; Matching retail form; see src/game/reversed_frame_sprite_overlay_presentation.c.
.text
.extern gReversedFrameSpriteOverlayPresentationVtable
.extern FieldEffect_DestroyBase
.extern AnimationResourceState_Destroy
.extern GraphicsSpriteGroup_Destroy

    .global ReversedFrameSpriteOverlayPresentation_Destroy
    .type ReversedFrameSpriteOverlayPresentation_Destroy, @function
ReversedFrameSpriteOverlayPresentation_Destroy: ; 0x020273d4
    stmdb sp!, {r4, lr}
    ldr r1, .L_0202741c
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    beq .L_020273fc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_020273fc:
    ldr r0, [r4, #0x14]
    bl GraphicsSpriteGroup_Destroy
    add r0, r4, #0x8
    bl AnimationResourceState_Destroy
    mov r0, r4
    bl FieldEffect_DestroyBase
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0202741c: .word gReversedFrameSpriteOverlayPresentationVtable
    .size ReversedFrameSpriteOverlayPresentation_Destroy, . - ReversedFrameSpriteOverlayPresentation_Destroy
