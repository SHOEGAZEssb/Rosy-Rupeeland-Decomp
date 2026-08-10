.text
; Matching fallback for the portable implementation in src/overlays/ov079/overlay079_recovery.c.
.extern data_020e6adc
.extern data_020e6b74
.extern ActorCollection_GetSpriteOwner
.extern Actor_GetCollection
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_ReplaceStateResources

.global func_ov079_02212b94
func_ov079_02212b94:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldrsh r1, [r5, #0xd6]
    mov r4, #0x100
    cmp r1, #0x16
    addls pc, pc, r1, lsl #0x2
    b .L_02212f44
.L_02212bb4:
    b .L_02212f44
    b .L_02212d00
    b .L_02212e48
    b .L_02212e98
    b .L_02212ef0
    b .L_02212c10
    b .L_02212c10
    b .L_02212f44
    b .L_02212c60
    b .L_02212c60
    b .L_02212f44
    b .L_02212f44
    b .L_02212f44
    b .L_02212f44
    b .L_02212f44
    b .L_02212f44
    b .L_02212f44
    b .L_02212d54
    b .L_02212f44
    b .L_02212da8
    b .L_02212f44
    b .L_02212f44
    b .L_02212cb0
.L_02212c10:
    ldr r6, [r5, #0x208]
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl GraphicsSpriteGroup_ReplaceStateResources
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
    b .L_02212f44
.L_02212c60:
    ldr r6, [r5, #0x208]
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl GraphicsSpriteGroup_ReplaceStateResources
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
    b .L_02212f44
.L_02212cb0:
    ldr r6, [r5, #0x208]
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl GraphicsSpriteGroup_ReplaceStateResources
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
    b .L_02212f44
.L_02212d00:
    ldr r4, [r5, #0x208]
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r4, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r4, {r2, r3}
    bl GraphicsSpriteGroup_ReplaceStateResources
    ldrb r1, [r5, #0xd4]
    ldr r0, [r5, #0x54]
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
    b .L_02212f44
.L_02212d54:
    ldrh r2, [r5, #0x4e]
    ldr r1, .L_02212f60
    ldrb r1, [r1, r2]
    cmp r1, #0x0
    beq .L_02212f44
    ldr r6, [r5, #0x208]
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl GraphicsSpriteGroup_ReplaceStateResources
    ldr r0, [r5, #0x54]
    mov r1, #0x11
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x3
    strh r0, [r1, #0x24]
    b .L_02212f44
.L_02212da8:
    ldrh r2, [r5, #0x4e]
    ldr r1, .L_02212f64
    ldr r6, [r5, #0x208]
    ldrb r1, [r1, r2]
    cmp r1, #0x0
    beq .L_02212dfc
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl GraphicsSpriteGroup_ReplaceStateResources
    ldr r0, [r5, #0x54]
    mov r1, #0x10
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x3
    strh r0, [r1, #0x24]
    b .L_02212f44
.L_02212dfc:
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl GraphicsSpriteGroup_ReplaceStateResources
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
    b .L_02212f44
.L_02212e48:
    ldr r6, [r5, #0x208]
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl GraphicsSpriteGroup_ReplaceStateResources
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
    b .L_02212f44
.L_02212e98:
    ldr r6, [r5, #0x208]
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl GraphicsSpriteGroup_ReplaceStateResources
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
    b .L_02212f44
.L_02212ef0:
    ldr r6, [r5, #0x208]
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl GraphicsSpriteGroup_ReplaceStateResources
    ldrb r1, [r5, #0xd4]
    ldr r0, [r5, #0x54]
    add r1, r1, #0x10
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
.L_02212f44:
    ldr r0, [r5, #0x54]
    mov r1, #0x0
    strh r4, [r0, #0x36]
    ldr r0, [r5, #0x54]
    strh r1, [r0, #0x30]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_02212f60: .word data_020e6b74
.L_02212f64: .word data_020e6adc
.size func_ov079_02212b94, . - func_ov079_02212b94
