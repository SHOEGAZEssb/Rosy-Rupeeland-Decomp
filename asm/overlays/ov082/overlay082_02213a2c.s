.text
; Matching fallback for the portable implementation in src/overlays/ov082/overlay082_recovery.c.
.extern data_020e6adc
.extern data_020e6b74
.extern ActorCollection_GetSpriteOwner
.extern Actor_GetCollection
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_020740c8

.global func_ov082_02213a2c
func_ov082_02213a2c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    mov r8, r0
    add r0, r8, #0x200
    ldrh r0, [r0, #0x98]
    mov r4, #0x100
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    movne r0, #0x1
    moveq r0, #0x0
    add r0, r8, r0, lsl #0x2
    ldr r1, [r0, #0x208]
    ldrsh r0, [r8, #0xda]
    ldmib r1, {r5, r6, r7}
    cmp r0, #0x1
    bne .L_02213ad0
    mov r0, r8
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    str r7, [sp, #0x0]
    ldr r1, [r8, #0x54]
    mov r2, r5
    mov r3, r6
    bl func_020740c8
    add r0, r8, #0x200
    ldrh r0, [r0, #0x98]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    movne r1, #0x14
    moveq r1, #0x15
    ldr r0, [r8, #0x54]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r2, [r8, #0x54]
    mov r1, #0x100
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x3
    strh r0, [r2, #0x24]
    ldr r0, [r8, #0x54]
    strh r1, [r0, #0x36]
    b .L_02213f54
.L_02213ad0:
    add r0, r8, #0x200
    ldrh r0, [r0, #0x9c]
    cmp r0, #0x0
    beq .L_02213b34
    mov r0, r8
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    str r7, [sp, #0x0]
    ldr r1, [r8, #0x54]
    mov r2, r5
    mov r3, r6
    bl func_020740c8
    ldrb r1, [r8, #0xd4]
    ldr r0, [r8, #0x54]
    add r1, r1, #0x16
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r2, [r8, #0x54]
    mov r1, r4
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x3
    strh r0, [r2, #0x24]
    ldr r0, [r8, #0x54]
    strh r1, [r0, #0x36]
    b .L_02213f54
.L_02213b34:
    ldrsh r0, [r8, #0xd6]
    cmp r0, #0x16
    addls pc, pc, r0, lsl #0x2
    b .L_02213f4c
.L_02213b44:
    b .L_02213f4c
    b .L_02213ce8
    b .L_02213c40
    b .L_02213c40
    b .L_02213c40
    b .L_02213ba0
    b .L_02213ba0
    b .L_02213ba0
    b .L_02213bf0
    b .L_02213bf0
    b .L_02213f4c
    b .L_02213ed8
    b .L_02213f4c
    b .L_02213f08
    b .L_02213f4c
    b .L_02213f4c
    b .L_02213f4c
    b .L_02213d94
    b .L_02213de8
    b .L_02213e38
    b .L_02213d44
    b .L_02213f4c
    b .L_02213c98
.L_02213ba0:
    mov r0, r8
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    str r7, [sp, #0x0]
    ldr r1, [r8, #0x54]
    mov r2, r5
    mov r3, r6
    bl func_020740c8
    ldrb r1, [r8, #0xd4]
    ldr r0, [r8, #0x54]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r8, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r8, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_02213f4c
.L_02213bf0:
    mov r0, r8
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    str r7, [sp, #0x0]
    ldr r1, [r8, #0x54]
    mov r2, r5
    mov r3, r6
    bl func_020740c8
    ldrb r1, [r8, #0xd4]
    ldr r0, [r8, #0x54]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r8, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r8, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_02213f4c
.L_02213c40:
    mov r0, r8
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    str r7, [sp, #0x0]
    ldr r1, [r8, #0x54]
    mov r2, r5
    mov r3, r6
    bl func_020740c8
    ldrb r1, [r8, #0xd4]
    ldr r0, [r8, #0x54]
    add r1, r1, #0x8
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r8, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r8, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_02213f4c
.L_02213c98:
    mov r0, r8
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    str r7, [sp, #0x0]
    ldr r1, [r8, #0x54]
    mov r2, r5
    mov r3, r6
    bl func_020740c8
    ldr r0, [r8, #0x54]
    mov r1, #0x11
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r8, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r8, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_02213f4c
.L_02213ce8:
    mov r0, r8
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    str r7, [sp, #0x0]
    ldr r1, [r8, #0x54]
    mov r2, r5
    mov r3, r6
    bl func_020740c8
    ldrb r1, [r8, #0xd4]
    ldr r0, [r8, #0x54]
    add r1, r1, #0x8
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r8, #0x54]
    mov r4, #0x0
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r8, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_02213f4c
.L_02213d44:
    mov r0, r8
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    str r7, [sp, #0x0]
    ldr r1, [r8, #0x54]
    mov r2, r5
    mov r3, r6
    bl func_020740c8
    ldr r0, [r8, #0x54]
    mov r1, #0x0
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r8, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r8, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_02213f4c
.L_02213d94:
    ldrh r1, [r8, #0x4e]
    ldr r0, .L_02213f5c
    ldrb r0, [r0, r1]
    cmp r0, #0x0
    beq .L_02213f4c
    mov r0, r8
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    str r7, [sp, #0x0]
    ldr r1, [r8, #0x54]
    mov r2, r5
    mov r3, r6
    bl func_020740c8
    ldr r0, [r8, #0x54]
    mov r1, #0x15
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r8, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x3
    strh r0, [r1, #0x24]
    b .L_02213f4c
.L_02213de8:
    mov r0, r8
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    str r7, [sp, #0x0]
    ldr r1, [r8, #0x54]
    mov r2, r5
    mov r3, r6
    bl func_020740c8
    ldr r0, [r8, #0x54]
    mov r1, #0x10
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r8, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r8, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_02213f4c
.L_02213e38:
    ldrh r1, [r8, #0x4e]
    ldr r0, .L_02213f60
    ldrb r0, [r0, r1]
    cmp r0, #0x0
    mov r0, r8
    beq .L_02213e8c
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    str r7, [sp, #0x0]
    ldr r1, [r8, #0x54]
    mov r2, r5
    mov r3, r6
    bl func_020740c8
    ldr r0, [r8, #0x54]
    mov r1, #0x14
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r8, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x3
    strh r0, [r1, #0x24]
    b .L_02213f4c
.L_02213e8c:
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    str r7, [sp, #0x0]
    ldr r1, [r8, #0x54]
    mov r2, r5
    mov r3, r6
    bl func_020740c8
    ldr r0, [r8, #0x54]
    mov r1, #0x0
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r8, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r1, [r8, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    b .L_02213f4c
.L_02213ed8:
    ldr r0, [r8, #0x54]
    mov r1, #0x12
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r8, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r1, [r8, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    b .L_02213f4c
.L_02213f08:
    mov r0, r8
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    str r7, [sp, #0x0]
    ldr r1, [r8, #0x54]
    mov r2, r5
    mov r3, r6
    bl func_020740c8
    ldrb r1, [r8, #0xd4]
    ldr r0, [r8, #0x54]
    add r1, r1, #0x16
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r8, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x3
    strh r0, [r1, #0x24]
.L_02213f4c:
    ldr r0, [r8, #0x54]
    strh r4, [r0, #0x36]
.L_02213f54:
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_02213f5c: .word data_020e6b74
.L_02213f60: .word data_020e6adc
.size func_ov082_02213a2c, . - func_ov082_02213a2c
