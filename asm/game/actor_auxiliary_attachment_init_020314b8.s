; Matching retail form; see src/game/actor_auxiliary_attachment_init.c.
.text
.extern data_020f4e18
.extern ActorCollection_GetSpriteGroup
.extern Actor_GetOwningCollection
.extern GraphicsArchive_FindCharacterResource
.extern GraphicsArchive_FindPaletteResource
.extern GraphicsArchive_FindCellResource
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_CreateState

    .global Actor_CreateAuxiliaryRenderAttachment
    .type Actor_CreateAuxiliaryRenderAttachment, @function
Actor_CreateAuxiliaryRenderAttachment: ; 0x020314b8
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    ldr r0, [r4, #0x14]
    tst r0, #0x2000000
    moveq r0, #0x0
    streq r0, [r4, #0xa8]
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, .L_02031554
    ldr r1, .L_02031558
    ldr r0, [r0, #0x0]
    bl GraphicsArchive_FindCharacterResource
    ldr r1, .L_02031554
    mov r7, r0
    ldr r0, [r1, #0x0]
    ldr r1, .L_0203155c
    bl GraphicsArchive_FindPaletteResource
    ldr r1, .L_02031554
    mov r6, r0
    ldr r0, [r1, #0x0]
    ldr r1, .L_02031560
    bl GraphicsArchive_FindCellResource
    mov r5, r0
    mov r0, r4
    bl Actor_GetOwningCollection
    bl ActorCollection_GetSpriteGroup
    mov ip, #0x2
    mov r1, r7
    mov r2, r6
    mov r3, r5
    str ip, [sp, #0x0]
    bl GraphicsSpriteGroup_CreateState
    str r0, [r4, #0xa8]
    mov r1, #0x0
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r4, #0xa8]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0xa
    strh r0, [r1, #0x24]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02031554: .word data_020f4e18
.L_02031558: .word 0x1386
.L_0203155c: .word 0x1001
.L_02031560: .word 0x1387
    .size Actor_CreateAuxiliaryRenderAttachment, . - Actor_CreateAuxiliaryRenderAttachment
