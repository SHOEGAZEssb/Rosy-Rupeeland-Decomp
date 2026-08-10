.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern data_020e6adc
.extern data_020e6b74
.extern ActorCollection_GetSpriteOwner
.extern Actor_GetCollection
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_ReplaceStateResources
.extern func_ov095_0221b6d8

.global func_ov095_0221b38c
func_ov095_0221b38c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    mov r7, r0
    ldrsh r1, [r7, #0xda]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_0221b4e4
.L_0221b3a8:
    b .L_0221b4e4
    b .L_0221b3b8
    b .L_0221b404
    b .L_0221b498
.L_0221b3b8:
    ldr r4, [r7, #0x20c]
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r4, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r7, #0x54]
    ldmib r4, {r2, r3}
    bl GraphicsSpriteGroup_ReplaceStateResources
    ldr r0, [r7, #0x54]
    mov r1, #0x14
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r2, [r7, #0x54]
    mov r1, #0x100
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x3
    strh r0, [r2, #0x24]
    ldr r0, [r7, #0x54]
    strh r1, [r0, #0x36]
    b .L_0221b6c8
.L_0221b404:
    bl func_ov095_0221b6d8
    cmp r0, #0x0
    beq .L_0221b438
    ldr r4, [r7, #0x20c]
    mov r0, r7
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r4, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r7, #0x54]
    ldmib r4, {r2, r3}
    bl GraphicsSpriteGroup_ReplaceStateResources
    b .L_0221b45c
.L_0221b438:
    ldr r4, [r7, #0x208]
    mov r0, r7
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r4, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r7, #0x54]
    ldmib r4, {r2, r3}
    bl GraphicsSpriteGroup_ReplaceStateResources
.L_0221b45c:
    ldrb r1, [r7, #0xd4]
    ldr r0, [r7, #0x54]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r2, [r7, #0x54]
    mov r1, #0x100
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x2
    strh r0, [r2, #0x24]
    ldr r2, [r7, #0x54]
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x1
    strh r0, [r2, #0x24]
    ldr r0, [r7, #0x54]
    strh r1, [r0, #0x36]
    b .L_0221b6c8
.L_0221b498:
    ldr r4, [r7, #0x20c]
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r4, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r7, #0x54]
    ldmib r4, {r2, r3}
    bl GraphicsSpriteGroup_ReplaceStateResources
    ldr r0, [r7, #0x54]
    mov r1, #0x15
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r2, [r7, #0x54]
    mov r1, #0x100
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x3
    strh r0, [r2, #0x24]
    ldr r0, [r7, #0x54]
    strh r1, [r0, #0x36]
    b .L_0221b6c8
.L_0221b4e4:
    ldrsh r1, [r7, #0xd6]
    mov r0, #0x0
    mov r5, r0
    mov r6, r0
    cmp r1, #0x16
    mov r4, #0x100
    addls pc, pc, r1, lsl #0x2
    b .L_0221b64c
.L_0221b504:
    b .L_0221b64c
    b .L_0221b5b0
    b .L_0221b588
    b .L_0221b588
    b .L_0221b588
    b .L_0221b560
    b .L_0221b560
    b .L_0221b560
    b .L_0221b580
    b .L_0221b580
    b .L_0221b64c
    b .L_0221b624
    b .L_0221b64c
    b .L_0221b640
    b .L_0221b64c
    b .L_0221b64c
    b .L_0221b64c
    b .L_0221b5d8
    b .L_0221b5f4
    b .L_0221b600
    b .L_0221b5d4
    b .L_0221b64c
    b .L_0221b5a8
.L_0221b560:
    add r1, r7, #0x200
    ldrh r1, [r1, #0x98]
    cmp r1, #0x0
    ldrneb r1, [r7, #0xd4]
    movne r0, #0x1
    addne r5, r1, #0x8
    ldreqb r5, [r7, #0xd4]
    b .L_0221b64c
.L_0221b580:
    ldrb r5, [r7, #0xd4]
    b .L_0221b64c
.L_0221b588:
    add r1, r7, #0x200
    ldrh r1, [r1, #0x98]
    cmp r1, #0x0
    ldrb r1, [r7, #0xd4]
    movne r0, #0x1
    addne r5, r1, #0x8
    addeq r5, r1, #0x8
    b .L_0221b64c
.L_0221b5a8:
    mov r5, #0x11
    b .L_0221b64c
.L_0221b5b0:
    add r1, r7, #0x200
    ldrh r1, [r1, #0x98]
    cmp r1, #0x0
    ldrb r1, [r7, #0xd4]
    movne r0, #0x1
    moveq r4, r0
    addne r5, r1, #0x8
    moveq r6, #0x1
    addeq r5, r1, #0x8
.L_0221b5d4:
    b .L_0221b64c
.L_0221b5d8:
    ldrh r2, [r7, #0x4e]
    ldr r1, .L_0221b6d0
    ldrb r1, [r1, r2]
    cmp r1, #0x0
    movne r5, #0x15
    movne r6, #0x1
    b .L_0221b64c
.L_0221b5f4:
    mov r5, #0x10
    mov r6, #0x1
    b .L_0221b64c
.L_0221b600:
    ldrh r2, [r7, #0x4e]
    ldr r1, .L_0221b6d4
    ldrb r1, [r1, r2]
    cmp r1, #0x0
    ldreqb r1, [r7, #0xd4]
    movne r5, #0x14
    movne r6, #0x1
    addeq r5, r1, #0x8
    b .L_0221b64c
.L_0221b624:
    add r1, r7, #0x200
    ldrh r1, [r1, #0x98]
    cmp r1, #0x0
    movne r5, #0x8
    movne r0, #0x1
    moveq r5, #0x12
    b .L_0221b64c
.L_0221b640:
    ldrb r1, [r7, #0xd4]
    mov r6, #0x1
    add r5, r1, #0x16
.L_0221b64c:
    add r0, r7, r0, lsl #0x2
    ldr r8, [r0, #0x208]
    mov r0, r7
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r8, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r7, #0x54]
    ldmib r8, {r2, r3}
    bl GraphicsSpriteGroup_ReplaceStateResources
    ldr r0, [r7, #0x54]
    and r1, r5, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r7, #0x54]
    mov r1, #0x0
    strh r4, [r0, #0x36]
    ldr r0, [r7, #0x54]
    cmp r6, #0x0
    strh r1, [r0, #0x30]
    ldr r1, [r7, #0x54]
    ldrneh r0, [r1, #0x24]
    bicne r0, r0, #0x3
    strneh r0, [r1, #0x24]
    bne .L_0221b6c8
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r7, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
.L_0221b6c8:
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_0221b6d0: .word data_020e6b74
.L_0221b6d4: .word data_020e6adc
.size func_ov095_0221b38c, . - func_ov095_0221b38c
