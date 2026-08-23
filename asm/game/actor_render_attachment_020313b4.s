; Matching retail form; see src/game/actor_render_attachment.c.
.text
.extern data_021052fc
.extern GamePhaseRuntime_GetActorCollection
.extern ActorCollection_GetSpriteGroup
.extern Actor_GetOwningCollection
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_CreateState

    .global Actor_CreateSecondaryRenderAttachment
    .type Actor_CreateSecondaryRenderAttachment, @function
Actor_CreateSecondaryRenderAttachment: ; 0x020313b4
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r1, [r4, #0x14]
    mov r6, r2
    tst r1, #0x1
    beq .L_02031458
    bl Actor_GetOwningCollection
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe84]
    cmp r0, #0x1
    bne .L_02031458
    ldr r0, .L_02031460
    ldr r5, [r4, #0x54]
    ldr r0, [r0, #0x0]
    mov r1, #0x2
    bl GamePhaseRuntime_GetActorCollection
    bl ActorCollection_GetSpriteGroup
    str r6, [sp, #0x0]
    ldr r1, [r5, #0x14]
    ldr r2, [r5, #0x18]
    ldr r3, [r5, #0x1c]
    bl GraphicsSpriteGroup_CreateState
    str r0, [r4, #0x58]
    ldr r1, [r4, #0x54]
    ldrb r1, [r1, #0x38]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r4, #0x54]
    ldr r1, [r4, #0x58]
    ldrsh r2, [r0, #0x2e]
    ldrsh r0, [r0, #0x2c]
    strh r0, [r1, #0x2c]
    strh r2, [r1, #0x2e]
    ldr r1, [r4, #0x58]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x54]
    ldr r0, [r4, #0x58]
    ldrb r1, [r1, #0x3a]
    strb r1, [r0, #0x3a]
.L_02031458:
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_02031460: .word data_021052fc
    .size Actor_CreateSecondaryRenderAttachment, . - Actor_CreateSecondaryRenderAttachment

