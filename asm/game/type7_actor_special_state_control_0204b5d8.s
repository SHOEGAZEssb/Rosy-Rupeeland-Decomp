; Matching retail form; see src/game/type7_actor_special_state_control.c.
.extern VecFx32Object_SetComponents
.extern AttachmentController_SetEnabled
.extern Type7Actor_GetStateCode
.extern Type7Actor_UpdateAttachmentControllerAnimation
.extern Type7MarkerPresentation_SelectAnimation
.extern Type7MarkerPresentation_ReloadResources
.extern Sound_PlayOwnedEffect
.extern GraphicsSpriteState_SetAnimationIndex
.extern gGameWork
.extern gSoundContext
.text
    .global Type7Actor_EnterSpecialPresentationState
Type7Actor_EnterSpecialPresentationState: ; 0x0204b5d8
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Type7Actor_GetStateCode
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r1, [r4, #0x268]
    add r0, r4, #0x2a8
    orr r1, r1, #0x200000
    str r1, [r4, #0x268]
    mov r1, #0x0
    bl AttachmentController_SetEnabled
    ldr r0, [r4, #0x54]
    ldrb r2, [r4, #0xd4]
    ldrb r1, [r0, #0x38]
    cmp r2, r1
    bne .L_0204b624
    add r1, r2, #0x8
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
.L_0204b624:
    ldr r0, [r4, #0x54]
    mov r1, #0x100
    strh r1, [r0, #0x36]
    ldr lr, [r4, #0x54]
    mov r1, #0x0
    ldrh r0, [lr, #0x24]
    mov r2, r1
    mov r3, r1
    orr ip, r0, #0x20
    add r0, r4, #0x38
    strh ip, [lr, #0x24]
    bl VecFx32Object_SetComponents
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl VecFx32Object_SetComponents
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x98
    bl VecFx32Object_SetComponents
    ldmia sp!, {r4, pc}
.size Type7Actor_EnterSpecialPresentationState, . - Type7Actor_EnterSpecialPresentationState

    .global Type7Actor_LeaveSpecialPresentationState
Type7Actor_LeaveSpecialPresentationState: ; 0x0204b680
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x268]
    tst r1, #0x200000
    beq .L_0204b6ac
    bic r1, r1, #0x200000
    str r1, [r4, #0x268]
    ldr r1, [r4, #0xd0]
    orr r1, r1, #0x1000
    str r1, [r4, #0xd0]
    bl Type7Actor_UpdateAttachmentControllerAnimation
.L_0204b6ac:
    ldr r3, [r4, #0x54]
    add r0, r4, #0x200
    ldrh r2, [r3, #0x24]
    mov r1, #0x1e
    bic r2, r2, #0x20
    strh r2, [r3, #0x24]
    strh r1, [r0, #0xa6]
    ldmia sp!, {r4, pc}
.size Type7Actor_LeaveSpecialPresentationState, . - Type7Actor_LeaveSpecialPresentationState

    .global Type7Actor_EnterFlag40000State
Type7Actor_EnterFlag40000State: ; 0x0204b6cc
    ldr r2, [r0, #0x268]
    ldr ip, .L_0204b6e8
    orr r2, r2, #0x40000
    str r2, [r0, #0x268]
    mov r1, #0x0
    add r0, r0, #0x2a8
    bx ip
.L_0204b6e8: .word AttachmentController_SetEnabled
.size Type7Actor_EnterFlag40000State, . - Type7Actor_EnterFlag40000State

    .global Type7Actor_StartAnimation19Interaction
Type7Actor_StartAnimation19Interaction: ; 0x0204b6ec
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldr r3, [r4, #0x294]
    mov r6, r1
    mov r5, r2
    cmp r3, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    bl Type7Actor_GetStateCode
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x38
    bl VecFx32Object_SetComponents
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl VecFx32Object_SetComponents
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x98
    bl VecFx32Object_SetComponents
    cmp r5, #0x0
    movne r0, #0x1
    str r6, [r4, #0x110]
    moveq r0, #0x0
    str r0, [r4, #0x114]
    mov r0, r4
    ldr r2, [r0, #0x0]
    ldr r1, [r4, #0x294]
    ldr r2, [r2, #0x74]
    blx r2
    add r0, r4, #0x200
    ldrsh r0, [r0, #0xb6]
    cmp r0, #0x0
    beq .L_0204b790
    add r0, r4, #0x2a8
    bl Type7MarkerPresentation_ReloadResources
.L_0204b790:
    add r0, r4, #0x2a8
    mov r1, #0x19
    bl Type7MarkerPresentation_SelectAnimation
    add r0, r4, #0x2a8
    mov r1, #0x1
    bl AttachmentController_SetEnabled
    add r0, r4, #0x2a8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldmia sp!, {r4, r5, r6, pc}
.size Type7Actor_StartAnimation19Interaction, . - Type7Actor_StartAnimation19Interaction

    .global Type7Actor_PlayStateSound
Type7Actor_PlayStateSound: ; 0x0204b7bc
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    ldr r2, .L_0204b810
    mov lr, #0x0
    ldr r2, [r2, #0x0]
    mov ip, #0x100
    add r2, r2, #0x100
    ldrsh r4, [r2, #0xd0]
    ldr r2, .L_0204b814
    mov r3, r0
    str lr, [sp, #0x0]
    orr r0, r1, r4
    str ip, [sp, #0x4]
    mov r0, r0, lsl #0x10
    mov ip, r0, lsr #0x10
    ldr r0, [r2, #0x0]
    mov r1, ip, asr #0x7
    and r2, ip, #0x7f
    bl Sound_PlayOwnedEffect
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
.L_0204b810: .word gGameWork
.L_0204b814: .word gSoundContext
.size Type7Actor_PlayStateSound, . - Type7Actor_PlayStateSound

    .global Type7Actor_NoopTrackedResourceInteraction
Type7Actor_NoopTrackedResourceInteraction: ; 0x0204b818
    bx lr
.size Type7Actor_NoopTrackedResourceInteraction, . - Type7Actor_NoopTrackedResourceInteraction

