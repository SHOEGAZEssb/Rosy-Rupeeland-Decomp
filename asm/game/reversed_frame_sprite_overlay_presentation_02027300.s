; Matching retail form; see src/game/reversed_frame_sprite_overlay_presentation.c.
.text
.extern Heap_Alloc
.extern data_020c378c
.extern gReversedFrameSpriteOverlayPresentationVtable
.extern gSpriteOverlayControllerAllocationTag
.extern data_020f4e14
.extern data_020f4e18
.extern func_0201e250
.extern func_02071ea4
.extern func_02071ee0
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_CreateStateFromSource
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern Presentation_SetScript
.extern SpritePresentation_Init
.extern gHeapContext

    .global ReversedFrameSpriteOverlayPresentation_Init
    .type ReversedFrameSpriteOverlayPresentation_Init, @function
ReversedFrameSpriteOverlayPresentation_Init: ; 0x02027300
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r4, r0
    mov r6, r1
    bl func_0201e250
    ldr r1, .L_020273bc
    add r0, r4, #0x8
    str r1, [r4, #0x0]
    bl func_02071ea4
    mov r1, #0x3c
    ldr r0, .L_020273c0
    str r1, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r4, #0x8
    mov r2, #0x3a
    mov r3, #0x3b
    bl func_02071ee0
    ldr r0, .L_020273c4
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    add r1, r4, #0x8
    mov r2, #0x2
    str r0, [r4, #0x14]
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r5, r0
    rsb r1, r6, #0x9
    cmp r6, #0x0
    addge r1, r1, #0x1
    mov r0, r5
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, .L_020273c8
    ldr r3, .L_020273cc
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_020273a0
    mov r1, r5
    bl SpritePresentation_Init
.L_020273a0:
    ldr r1, .L_020273d0
    mov r2, #0x1
    str r0, [r4, #0x18]
    bl Presentation_SetScript
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_020273bc: .word gReversedFrameSpriteOverlayPresentationVtable
.L_020273c0: .word data_020f4e18
.L_020273c4: .word data_020f4e14
.L_020273c8: .word gSpriteOverlayControllerAllocationTag
.L_020273cc: .word gHeapContext
.L_020273d0: .word data_020c378c
    .size ReversedFrameSpriteOverlayPresentation_Init, . - ReversedFrameSpriteOverlayPresentation_Init
