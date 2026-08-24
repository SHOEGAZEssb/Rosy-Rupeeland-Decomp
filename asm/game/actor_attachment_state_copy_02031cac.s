; Matching retail form; see src/game/actor_attachment_state_copy.c.
.text
.extern DisplayController_GetSubScreenVerticalOffset
.extern RectS16_InitComponents
.extern GamePhaseRegion_ContainsPoint
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteState_SetFrameIndex

    .global ActorAttachment_CopyTouchState
    .type ActorAttachment_CopyTouchState, @function
ActorAttachment_CopyTouchState: ; 0x02031cac
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r5, r0
    ldr r0, [r5, #0x58]
    mov r4, r1
    cmp r0, #0x0
    beq .L_02031f3c
    bl DisplayController_GetSubScreenVerticalOffset
    ldr r2, [r4, #0x8]
    mov r1, #0x0
    add ip, r2, r0
    ldr r2, [r5, #0x58]
    ldr r0, [r4, #0x4]
    mov r3, #0xc0
    strh r0, [r2, #0x2c]
    strh ip, [r2, #0x2e]
    str r3, [sp, #0x0]
    add r0, sp, #0x4
    mov r2, r1
    mov r3, #0x100
    bl RectS16_InitComponents
    ldrsh r1, [sp, #0x4]
    ldrsh r0, [r5, #0x6c]
    ldrsh r3, [sp, #0x6]
    ldrsh r2, [sp, #0x8]
    sub r0, r1, r0
    strh r0, [sp, #0x4]
    ldrsh r0, [r5, #0x6e]
    ldrsh r1, [sp, #0xa]
    sub r0, r3, r0
    strh r0, [sp, #0x6]
    ldrsh r0, [r5, #0x68]
    sub r0, r2, r0
    strh r0, [sp, #0x8]
    ldrsh r0, [r5, #0x6a]
    sub r0, r1, r0
    strh r0, [sp, #0xa]
    bl DisplayController_GetSubScreenVerticalOffset
    ldmib r4, {r1, r2}
    add r2, r2, r0
    add r0, sp, #0x4
    bl GamePhaseRegion_ContainsPoint
    ldr r1, [r5, #0x58]
    cmp r0, #0x0
    ldrneh r0, [r1, #0x24]
    bicne r0, r0, #0x8
    ldreqh r0, [r1, #0x24]
    orreq r0, r0, #0x8
    strh r0, [r1, #0x24]
    ldr r0, [r5, #0x58]
    ldr r2, [r5, #0x54]
    ldrb r1, [r0, #0x38]
    ldrb r2, [r2, #0x38]
    cmp r2, r1
    beq .L_02031d90
    and r1, r2, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
.L_02031d90:
    ldr r0, [r5, #0x58]
    ldr r2, [r5, #0x54]
    ldrb r1, [r0, #0x39]
    ldrb r2, [r2, #0x39]
    cmp r2, r1
    beq .L_02031db0
    and r1, r2, #0xff
    bl GraphicsSpriteState_SetFrameIndex
.L_02031db0:
    ldr r0, [r5, #0x54]
    ldr r1, [r5, #0x58]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x2
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x2
    ldreqh r0, [r1, #0x24]
    biceq r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r0, [r5, #0x54]
    ldr r1, [r5, #0x58]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x4
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x4
    ldreqh r0, [r1, #0x24]
    biceq r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r0, [r5, #0x54]
    ldr r1, [r5, #0x58]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x10
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x10
    ldreqh r0, [r1, #0x24]
    biceq r0, r0, #0x10
    strh r0, [r1, #0x24]
    ldr r0, [r5, #0x54]
    ldr r1, [r5, #0x58]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x40
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x40
    ldreqh r0, [r1, #0x24]
    biceq r0, r0, #0x40
    strh r0, [r1, #0x24]
    ldr r0, [r5, #0x54]
    ldr r1, [r5, #0x58]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x80
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x80
    ldreqh r0, [r1, #0x24]
    biceq r0, r0, #0x80
    strh r0, [r1, #0x24]
    ldr r0, [r5, #0x54]
    ldr r1, [r5, #0x58]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x20
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x20
    ldreqh r0, [r1, #0x24]
    biceq r0, r0, #0x20
    strh r0, [r1, #0x24]
    ldr r0, [r5, #0x54]
    ldr r1, [r5, #0x58]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x200
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x200
    ldreqh r0, [r1, #0x24]
    biceq r0, r0, #0x20
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x54]
    ldr r0, [r5, #0x58]
    ldrsh r1, [r1, #0x36]
    strh r1, [r0, #0x36]
    ldr r0, [r5, #0x54]
    ldr r1, [r5, #0x58]
    ldrsh r2, [r0, #0x34]
    ldrsh r0, [r0, #0x32]
    strh r0, [r1, #0x32]
    strh r2, [r1, #0x34]
    ldr r1, [r5, #0x54]
    ldr r0, [r5, #0x58]
    ldrb r1, [r1, #0x3a]
    strb r1, [r0, #0x3a]
    ldr r1, [r5, #0x54]
    ldr r0, [r5, #0x58]
    ldrh r1, [r1, #0x28]
    strh r1, [r0, #0x28]
    ldr r1, [r5, #0x54]
    ldr r0, [r5, #0x58]
    ldrsh r1, [r1, #0x30]
    strh r1, [r0, #0x30]
.L_02031f3c:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
    .size ActorAttachment_CopyTouchState, . - ActorAttachment_CopyTouchState

