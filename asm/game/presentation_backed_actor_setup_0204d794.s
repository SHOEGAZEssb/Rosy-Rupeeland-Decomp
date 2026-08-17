; Matching retail form; see src/game/presentation_backed_actor_setup.c.
.extern data_020f4e18
.extern ActorCollection_GetSpriteOwner
.extern Actor_GetCollection
.extern func_02071e60
.extern GraphicsArchive_FindPaletteResource
.extern func_02071e80
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_CreateState
.text
    .global PresentationBackedActor_InitPresentation
PresentationBackedActor_InitPresentation:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    ldr r2, .L_0204d828
    mov r4, r1
    mov r5, r0
    ldr r0, [r2, #0x0]
    ldr r1, [r4, #0x4]
    bl func_02071e60
    ldr r1, .L_0204d828
    mov r8, r0
    ldr r0, [r1, #0x0]
    ldr r1, [r4, #0x8]
    bl GraphicsArchive_FindPaletteResource
    ldr r1, .L_0204d828
    mov r7, r0
    ldr r0, [r1, #0x0]
    ldr r1, [r4, #0xc]
    bl func_02071e80
    mov r6, r0
    mov r0, r5
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldrb ip, [r4, #0x10]
    mov r1, r8
    mov r2, r7
    mov r3, r6
    str ip, [sp, #0x0]
    bl GraphicsSpriteGroup_CreateState
    str r0, [r5, #0x54]
    ldrb r1, [r4, #0x11]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x6
    strh r0, [r1, #0x24]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_0204d828: .word data_020f4e18
.size PresentationBackedActor_InitPresentation, . - PresentationBackedActor_InitPresentation

    .global PresentationBackedActor_SetPlaybackParameters
PresentationBackedActor_SetPlaybackParameters:
    stmdb sp!, {r3, lr}
    add ip, r0, #0x100
    strh r1, [ip, #0xf2]
    strh r2, [ip, #0xf4]
    ldrb r1, [sp, #0x8]
    strb r3, [r0, #0x1ee]
    strb r1, [r0, #0x1ef]
    ldrb r1, [r0, #0x1ee]
    ldr r0, [r0, #0x54]
    bl GraphicsSpriteState_SetAnimationIndex
    ldmia sp!, {r3, pc}
.size PresentationBackedActor_SetPlaybackParameters, . - PresentationBackedActor_SetPlaybackParameters

