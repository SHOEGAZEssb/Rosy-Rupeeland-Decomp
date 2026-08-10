.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern data_020e6adc
.extern data_020e6b74
.extern data_020e6ca4
.extern data_ov075_02217290
.extern data_ov075_02217358
.extern ActorCollection_GetSpriteOwner
.extern Actor_GetCollection
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_ReplaceStateResources

.global func_ov075_02215a70
func_ov075_02215a70:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    mov r7, r0
    ldrsh r1, [r7, #0xda]
    mov r0, #0x0
    mov r5, r0
    cmp r1, #0x1
    ldreqb r1, [r7, #0xd4]
    mov r6, r0
    mov r4, #0x100
    moveq r6, #0x1
    addeq r5, r1, #0x16
    beq .L_02215bfc
    ldrsh r1, [r7, #0xd6]
    cmp r1, #0x16
    addls pc, pc, r1, lsl #0x2
    b .L_02215bfc
.L_02215ab4:
    b .L_02215bfc
    b .L_02215b88
    b .L_02215b74
    b .L_02215b74
    b .L_02215b74
    b .L_02215b10
    b .L_02215b10
    b .L_02215b10
    b .L_02215b6c
    b .L_02215b6c
    b .L_02215bfc
    b .L_02215be8
    b .L_02215bfc
    b .L_02215bf0
    b .L_02215bfc
    b .L_02215bfc
    b .L_02215bfc
    b .L_02215b9c
    b .L_02215bb8
    b .L_02215bc4
    b .L_02215b98
    b .L_02215bfc
    b .L_02215b80
.L_02215b10:
    ldr r1, .L_02215c7c
    ldr r3, [r7, #0x218]
    ldr r1, [r1, #0xc8]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_02215c80
    bne .L_02215b40
    ldr r2, [r7, #0x21c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_02215b40:
    cmp ip, #0x0
    bne .L_02215b5c
    ldrh r2, [r7, #0x4e]
    ldr r1, .L_02215c84
    ldrb r1, [r1, r2]
    cmp r1, #0x0
    movne r5, #0x1
.L_02215b5c:
    cmp r5, #0x0
    movne r0, #0x1
    ldrb r5, [r7, #0xd4]
    b .L_02215bfc
.L_02215b6c:
    ldrb r5, [r7, #0xd4]
    b .L_02215bfc
.L_02215b74:
    ldrb r1, [r7, #0xd4]
    add r5, r1, #0x8
    b .L_02215bfc
.L_02215b80:
    mov r5, #0x11
    b .L_02215bfc
.L_02215b88:
    ldrb r1, [r7, #0xd4]
    mov r4, r0
    mov r6, #0x1
    add r5, r1, #0x8
.L_02215b98:
    b .L_02215bfc
.L_02215b9c:
    ldrh r2, [r7, #0x4e]
    ldr r1, .L_02215c88
    ldrb r1, [r1, r2]
    cmp r1, #0x0
    movne r5, #0x15
    movne r6, #0x1
    b .L_02215bfc
.L_02215bb8:
    mov r5, #0x10
    mov r6, #0x1
    b .L_02215bfc
.L_02215bc4:
    ldrh r2, [r7, #0x4e]
    ldr r1, .L_02215c8c
    ldrb r1, [r1, r2]
    cmp r1, #0x0
    ldreqb r1, [r7, #0xd4]
    movne r5, #0x14
    movne r6, #0x1
    addeq r5, r1, #0x8
    b .L_02215bfc
.L_02215be8:
    mov r5, #0x12
    b .L_02215bfc
.L_02215bf0:
    ldrb r1, [r7, #0xd4]
    mov r6, #0x1
    add r5, r1, #0x16
.L_02215bfc:
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
    bne .L_02215c70
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r7, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
.L_02215c70:
    strh r0, [r1, #0x24]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_02215c7c: .word data_ov075_02217290
.L_02215c80: .word data_ov075_02217358
.L_02215c84: .word data_020e6ca4
.L_02215c88: .word data_020e6b74
.L_02215c8c: .word data_020e6adc
.size func_ov075_02215a70, . - func_ov075_02215a70
