.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.
.extern data_020e6adc
.extern data_020e6b74
.extern data_020e6c0c
.extern data_020e6ca4
.extern data_ov078_02215c88
.extern data_ov078_02215d18
.extern ActorCollection_GetSpriteOwner
.extern Actor_GetCollection
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_020740c8

.global func_ov078_02212bc0
func_ov078_02212bc0:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldrsh r1, [r5, #0xd6]
    mov r4, #0x100
    cmp r1, #0x1b
    addls pc, pc, r1, lsl #0x2
    b .L_0221324c
.L_02212be0:
    b .L_0221324c
    b .L_02212f04
    b .L_02212d74
    b .L_02212d74
    b .L_02212d74
    b .L_02212c50
    b .L_02212c50
    b .L_02212ea8
    b .L_02212d24
    b .L_02212d24
    b .L_0221324c
    b .L_0221324c
    b .L_0221324c
    b .L_022131b0
    b .L_022131f8
    b .L_0221324c
    b .L_0221324c
    b .L_02212fb0
    b .L_02213004
    b .L_02213054
    b .L_02212f60
    b .L_02212dcc
    b .L_02212e24
    b .L_022130f4
    b .L_0221324c
    b .L_02213148
    b .L_022131a0
    b .L_022131a0
.L_02212c50:
    ldr r0, .L_02213268
    mov r3, #0x1
    ldr r2, [r5, #0x218]
    ldr r0, [r0, #0x90]
    mov ip, r3
    cmp r2, r0
    ldr r0, .L_0221326c
    bne .L_02212c84
    ldr r1, [r5, #0x21c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq ip, #0x0
.L_02212c84:
    cmp ip, #0x0
    ldreqh r1, [r5, #0x4e]
    ldreq r0, .L_02213270
    ldr r6, [r5, #0x208]
    ldreqb r0, [r0, r1]
    cmpeq r0, #0x0
    moveq r3, #0x0
    cmp r3, #0x0
    mov r0, r5
    beq .L_02212cd8
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl func_020740c8
    ldrb r1, [r5, #0xd4]
    ldr r0, [r5, #0x54]
    bl GraphicsSpriteState_SetAnimationIndex
    b .L_02212d00
.L_02212cd8:
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl func_020740c8
    ldrb r1, [r5, #0xd4]
    ldr r0, [r5, #0x54]
    bl GraphicsSpriteState_SetAnimationIndex
.L_02212d00:
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_0221324c
.L_02212d24:
    ldr r6, [r5, #0x208]
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl func_020740c8
    ldrb r1, [r5, #0xd4]
    ldr r0, [r5, #0x54]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_0221324c
.L_02212d74:
    ldr r6, [r5, #0x208]
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl func_020740c8
    ldrb r1, [r5, #0xd4]
    ldr r0, [r5, #0x54]
    add r1, r1, #0x8
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_0221324c
.L_02212dcc:
    ldr r6, [r5, #0x208]
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl func_020740c8
    ldrb r1, [r5, #0xd4]
    ldr r0, [r5, #0x54]
    add r1, r1, #0x45
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_0221324c
.L_02212e24:
    ldr r6, [r5, #0x208]
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl func_020740c8
    add r0, r5, #0x200
    ldrsb r0, [r0, #0x7e]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02212e78
    ldrb r1, [r5, #0xd4]
    ldr r0, [r5, #0x54]
    add r1, r1, #0x25
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    b .L_02212e84
.L_02212e78:
    ldr r0, [r5, #0x54]
    mov r1, #0x11
    bl GraphicsSpriteState_SetAnimationIndex
.L_02212e84:
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_0221324c
.L_02212ea8:
    ldrh r2, [r5, #0x4e]
    ldr r1, .L_02213274
    ldrb r1, [r1, r2]
    cmp r1, #0x0
    beq .L_0221324c
    ldr r6, [r5, #0x208]
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl func_020740c8
    ldrb r1, [r5, #0xd4]
    ldr r0, [r5, #0x54]
    add r1, r1, #0x1e
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x3
    strh r0, [r1, #0x24]
    b .L_0221324c
.L_02212f04:
    ldr r4, [r5, #0x208]
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r4, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r4, {r2, r3}
    bl func_020740c8
    ldrb r1, [r5, #0xd4]
    ldr r0, [r5, #0x54]
    add r1, r1, #0x8
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r5, #0x54]
    mov r4, #0x0
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_0221324c
.L_02212f60:
    ldr r6, [r5, #0x208]
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl func_020740c8
    ldr r0, [r5, #0x54]
    mov r1, #0x0
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_0221324c
.L_02212fb0:
    ldrh r2, [r5, #0x4e]
    ldr r1, .L_02213278
    ldrb r1, [r1, r2]
    cmp r1, #0x0
    beq .L_0221324c
    ldr r6, [r5, #0x208]
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl func_020740c8
    ldr r0, [r5, #0x54]
    mov r1, #0x11
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x3
    strh r0, [r1, #0x24]
    b .L_0221324c
.L_02213004:
    ldr r6, [r5, #0x208]
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl func_020740c8
    ldr r0, [r5, #0x54]
    mov r1, #0x13
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_0221324c
.L_02213054:
    ldrh r2, [r5, #0x4e]
    ldr r1, .L_0221327c
    ldr r6, [r5, #0x208]
    ldrb r1, [r1, r2]
    cmp r1, #0x0
    beq .L_022130a8
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl func_020740c8
    ldr r0, [r5, #0x54]
    mov r1, #0x10
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x3
    strh r0, [r1, #0x24]
    b .L_0221324c
.L_022130a8:
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl func_020740c8
    ldr r0, [r5, #0x54]
    mov r1, #0x0
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    b .L_0221324c
.L_022130f4:
    ldrh r2, [r5, #0x4e]
    ldr r1, .L_02213278
    ldrb r1, [r1, r2]
    cmp r1, #0x0
    beq .L_0221324c
    ldr r6, [r5, #0x208]
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl func_020740c8
    ldr r0, [r5, #0x54]
    mov r1, #0x11
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x3
    strh r0, [r1, #0x24]
    b .L_0221324c
.L_02213148:
    ldr r6, [r5, #0x208]
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl func_020740c8
    ldrb r1, [r5, #0xd4]
    ldr r0, [r5, #0x54]
    add r1, r1, #0x8
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_0221324c
.L_022131a0:
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1d4]
    blx r1
    b .L_02213260
.L_022131b0:
    ldr r6, [r5, #0x208]
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl func_020740c8
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x3
    strh r0, [r1, #0x24]
    ldrb r1, [r5, #0xd4]
    ldr r0, [r5, #0x54]
    add r1, r1, #0x16
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    b .L_0221324c
.L_022131f8:
    ldr r6, [r5, #0x208]
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl func_020740c8
    ldrb r1, [r5, #0xd4]
    ldr r0, [r5, #0x54]
    add r1, r1, #0x1e
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
.L_0221324c:
    ldr r0, [r5, #0x54]
    mov r1, #0x0
    strh r4, [r0, #0x36]
    ldr r0, [r5, #0x54]
    strh r1, [r0, #0x30]
.L_02213260:
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_02213268: .word data_ov078_02215c88
.L_0221326c: .word data_ov078_02215d18
.L_02213270: .word data_020e6ca4
.L_02213274: .word data_020e6c0c
.L_02213278: .word data_020e6b74
.L_0221327c: .word data_020e6adc
.size func_ov078_02212bc0, . - func_ov078_02212bc0
