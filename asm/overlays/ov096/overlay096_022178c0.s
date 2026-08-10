.text
; Matching fallback for the portable implementation in src/overlays/ov096/overlay096_recovery.c.
.extern data_ov096_02218b08
.extern data_ov096_02218b18
.extern data_ov096_02218b20
.extern ActorCollection_GetSpriteOwner
.extern Actor_GetCollection
.extern ActorExtendedType2_UpdateFrame
.extern ActorExtendedType2_GetDescriptorValue2A
.extern func_020593dc
.extern func_02072b68
.extern func_020740c8
.extern func_ov096_02217e88
.extern func_ov096_0221811c
.extern gSoundContext

.global func_ov096_022178c0
func_ov096_022178c0:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r0, [r4, #0x14]
    tst r0, #0x200000
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02217e70
    ldrb r0, [r4, #0x29a]
    mov ip, #0x1
    cmp r0, #0x0
    subne r0, r0, #0x1
    strneb r0, [r4, #0x29a]
    ldr r0, .L_02217e78
    ldr r3, [r4, #0x218]
    ldr r1, [r0, #0x18]
    mov r0, #0x0
    cmp r3, r1
    ldr r1, .L_02217e7c
    bne .L_02217928
    ldr r2, [r4, #0x21c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_02217928:
    cmp ip, #0x0
    bne .L_02217968
    ldr r1, .L_02217e78
    ldr r3, [r4, #0x220]
    ldr r1, [r1, #0x10]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_02217e80
    bne .L_02217960
    ldr r2, [r4, #0x224]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_02217960:
    cmp ip, #0x0
    moveq r0, #0x1
.L_02217968:
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    strb r0, [r4, #0x298]
    ldrb r0, [r4, #0x29b]
    bic r0, r0, #0x1
    strb r0, [r4, #0x29b]
    ldr r0, [r4, #0x260]
    bic r0, r0, #0x8000
    str r0, [r4, #0x260]
    ldrb r0, [r4, #0x298]
    cmp r0, #0x0
    ldrb r0, [r4, #0x299]
    bne .L_02217b90
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_02217dd4
.L_022179ac:
    b .L_02217dd4
    b .L_022179c4
    b .L_022179ec
    b .L_02217a6c
    b .L_02217abc
    b .L_02217b10
.L_022179c4:
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r0, [r4, #0x54]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_02217dd4
.L_022179ec:
    mov r0, #0x3
    strb r0, [r4, #0x299]
    ldr r2, [r4, #0x54]
    mov r0, r4
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x3
    strh r1, [r2, #0x24]
    ldr r5, [r4, #0x208]
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r5, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r4, #0x54]
    ldmib r5, {r2, r3}
    bl func_020740c8
    ldr r0, [r4, #0x54]
    mov r1, #0x13
    bl func_02072b68
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r0, #0x100
    str r0, [sp, #0x4]
    add r1, r0, #0x43
    ldr r0, .L_02217e84
    mov r2, #0x2
    ldr r0, [r0, #0x0]
    mov r3, r4
    bl func_020593dc
    ldr r0, [r4, #0x260]
    orr r0, r0, #0x8000
    str r0, [r4, #0x260]
    b .L_02217dd4
.L_02217a6c:
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r0, [r4, #0x54]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_02217aac
    mov r1, #0x0
    strb r1, [r4, #0x299]
    ldr r0, [r4, #0xd0]
    orr r0, r0, #0x1000
    str r0, [r4, #0xd0]
    str r1, [r4, #0xc8]
.L_02217aac:
    ldr r0, [r4, #0x260]
    orr r0, r0, #0x8000
    str r0, [r4, #0x260]
    b .L_02217dd4
.L_02217abc:
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r0, [r4, #0x54]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_02217b00
    mov r0, #0x5
    strb r0, [r4, #0x299]
    ldr r0, [r4, #0x54]
    mov r1, #0x17
    bl func_02072b68
    mov r0, r4
    bl func_ov096_0221811c
.L_02217b00:
    ldr r0, [r4, #0x260]
    orr r0, r0, #0x8000
    str r0, [r4, #0x260]
    b .L_02217dd4
.L_02217b10:
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r0, [r4, #0x54]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_02217b80
    mov r0, #0x3
    strb r0, [r4, #0x299]
    ldr r2, [r4, #0x54]
    mov r0, r4
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x3
    strh r1, [r2, #0x24]
    ldr r5, [r4, #0x208]
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r5, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r4, #0x54]
    ldmib r5, {r2, r3}
    bl func_020740c8
    ldr r0, [r4, #0x54]
    mov r1, #0x13
    bl func_02072b68
.L_02217b80:
    ldr r0, [r4, #0x260]
    orr r0, r0, #0x8000
    str r0, [r4, #0x260]
    b .L_02217dd4
.L_02217b90:
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_02217dd4
.L_02217b9c:
    b .L_02217bb4
    b .L_02217c28
    b .L_02217cb0
    b .L_02217cc0
    b .L_02217cfc
    b .L_02217d50
.L_02217bb4:
    mov r0, #0x1
    strb r0, [r4, #0x299]
    ldr r2, [r4, #0x54]
    mov r0, r4
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x3
    strh r1, [r2, #0x24]
    ldr r5, [r4, #0x208]
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r5, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r4, #0x54]
    ldmib r5, {r2, r3}
    bl func_020740c8
    ldr r0, [r4, #0x54]
    mov r1, #0x14
    bl func_02072b68
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r0, #0x100
    str r0, [sp, #0x4]
    add r1, r0, #0x43
    ldr r0, .L_02217e84
    mov r2, #0x3
    ldr r0, [r0, #0x0]
    mov r3, r4
    bl func_020593dc
    b .L_02217dd4
.L_02217c28:
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r2, [r4, #0x54]
    ldrh r1, [r2, #0x24]
    and r0, r1, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_02217ca0
    bic r0, r1, #0x1
    strh r0, [r2, #0x24]
    ldr r3, [r4, #0x54]
    mov r1, #0x2
    ldrh r2, [r3, #0x24]
    mov r0, r4
    orr r2, r2, #0x2
    strh r2, [r3, #0x24]
    strb r1, [r4, #0x299]
    ldr r5, [r4, #0x208]
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r5, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r4, #0x54]
    ldmib r5, {r2, r3}
    bl func_020740c8
    ldr r0, [r4, #0x54]
    mov r1, #0x15
    bl func_02072b68
.L_02217ca0:
    ldr r0, [r4, #0x260]
    orr r0, r0, #0x8000
    str r0, [r4, #0x260]
    b .L_02217dd4
.L_02217cb0:
    ldr r0, [r4, #0x260]
    orr r0, r0, #0x8000
    str r0, [r4, #0x260]
    b .L_02217dd4
.L_02217cc0:
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r0, [r4, #0x54]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    movne r0, #0x0
    strneb r0, [r4, #0x299]
    ldr r0, [r4, #0x260]
    orr r0, r0, #0x8000
    str r0, [r4, #0x260]
    b .L_02217dd4
.L_02217cfc:
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r0, [r4, #0x54]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_02217d40
    mov r0, #0x5
    strb r0, [r4, #0x299]
    ldr r0, [r4, #0x54]
    mov r1, #0x17
    bl func_02072b68
    mov r0, r4
    bl func_ov096_0221811c
.L_02217d40:
    ldr r0, [r4, #0x260]
    orr r0, r0, #0x8000
    str r0, [r4, #0x260]
    b .L_02217dd4
.L_02217d50:
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r2, [r4, #0x54]
    ldrh r1, [r2, #0x24]
    and r0, r1, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_02217dc8
    bic r0, r1, #0x1
    strh r0, [r2, #0x24]
    ldr r3, [r4, #0x54]
    mov r1, #0x2
    ldrh r2, [r3, #0x24]
    mov r0, r4
    orr r2, r2, #0x2
    strh r2, [r3, #0x24]
    strb r1, [r4, #0x299]
    ldr r5, [r4, #0x208]
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r5, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r4, #0x54]
    ldmib r5, {r2, r3}
    bl func_020740c8
    ldr r0, [r4, #0x54]
    mov r1, #0x15
    bl func_02072b68
.L_02217dc8:
    ldr r0, [r4, #0x260]
    orr r0, r0, #0x8000
    str r0, [r4, #0x260]
.L_02217dd4:
    mov r0, r4
    bl func_ov096_02217e88
    cmp r0, #0x0
    bne .L_02217dfc
    ldrb r0, [r4, #0x29b]
    mov r1, #0x100
    orr r0, r0, #0x1
    strb r0, [r4, #0x29b]
    ldr r0, [r4, #0x54]
    strh r1, [r0, #0x36]
.L_02217dfc:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    bne .L_02217e68
    mov r0, r4
    bl func_ov096_02217e88
    cmp r0, #0x0
    ldr r1, [r4, #0x260]
    mov r0, r4
    beq .L_02217e4c
    bic r1, r1, #0x2000
    str r1, [r4, #0x260]
    bl ActorExtendedType2_GetDescriptorValue2A
    cmp r0, #0x0
    ldreq r0, [r4, #0x10]
    biceq r0, r0, #0x1f0000
    streq r0, [r4, #0x10]
    b .L_02217e68
.L_02217e4c:
    orr r1, r1, #0x2000
    str r1, [r4, #0x260]
    bl ActorExtendedType2_GetDescriptorValue2A
    cmp r0, #0x0
    ldreq r0, [r4, #0x10]
    orreq r0, r0, #0x1f0000
    streq r0, [r4, #0x10]
.L_02217e68:
    mov r0, r4
    bl ActorExtendedType2_UpdateFrame
.L_02217e70:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
.L_02217e78: .word data_ov096_02218b08
.L_02217e7c: .word data_ov096_02218b20
.L_02217e80: .word data_ov096_02218b18
.L_02217e84: .word gSoundContext
.size func_ov096_022178c0, . - func_ov096_022178c0
