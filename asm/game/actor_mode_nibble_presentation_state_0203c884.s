; Matching retail form; see src/game/actor_mode_nibble_presentation_state.c.
.text
.extern GraphicsSpriteState_SetAnimationIndex
    .global ActorModeNibble_UpdatePresentationState
    .type ActorModeNibble_UpdatePresentationState, @function
ActorModeNibble_UpdatePresentationState: ; 0x0203c884
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrsh r0, [r4, #0xd6]
    cmp r0, #0x0
    beq .L_0203c8a4
    cmp r0, #0x1
    beq .L_0203c8d4
    ldmia sp!, {r4, pc}
.L_0203c8a4:
    ldr r0, [r4, #0x54]
    mov r1, #0x0
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldmia sp!, {r4, pc}
.L_0203c8d4:
    ldr r0, [r4, #0x54]
    ldr r1, [r0, #0x1c]
    ldr r1, [r1, #0x20]
    ldr r1, [r1, #0x4]
    sub r1, r1, #0x1
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    add r0, r4, #0x200
    ldrh r0, [r0, #0x8]
    ldr r1, [r4, #0x54]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x1c
    cmp r0, #0x4
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldreqh r0, [r1, #0x24]
    biceq r0, r0, #0x3
    streqh r0, [r1, #0x24]
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldmia sp!, {r4, pc}
    .size ActorModeNibble_UpdatePresentationState, . - ActorModeNibble_UpdatePresentationState

    .global ActorModeNibble_GetField108
    .type ActorModeNibble_GetField108, @function
ActorModeNibble_GetField108: ; 0x0203c944
    ldr r0, [r0, #0x108]
    bx lr

    .size ActorModeNibble_GetField108, . - ActorModeNibble_GetField108

