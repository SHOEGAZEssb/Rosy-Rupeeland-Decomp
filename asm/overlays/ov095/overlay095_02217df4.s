.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern ActorCollection_GetSpriteOwner
.extern Actor_GetCollection
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_020740c8

.global func_ov095_02217df4
func_ov095_02217df4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    ldrsh r1, [r6, #0xd6]
    mvn r4, #0x0
    mov r5, #0x100
    cmp r1, #0x1a
    beq .L_02217e1c
    cmp r1, #0x1b
    beq .L_02217e68
    b .L_02218094
.L_02217e1c:
    ldr r4, [r6, #0x208]
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r4, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r6, #0x54]
    ldmib r4, {r2, r3}
    bl func_020740c8
    ldr r1, [r6, #0x54]
    ldrb r2, [r6, #0xd4]
    ldrh r0, [r1, #0x24]
    add r4, r2, #0x10
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r6, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_02218094
.L_02217e68:
    ldr r7, [r6, #0x208]
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r7, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r6, #0x54]
    ldmib r7, {r2, r3}
    bl func_020740c8
    ldr r1, [r6, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r6, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldrsh r0, [r6, #0xda]
    cmp r0, #0x18
    addls pc, pc, r0, lsl #0x2
    b .L_02218094
.L_02217eb8:
    b .L_02217f1c
    b .L_02217f28
    b .L_02217f30
    b .L_02217f38
    b .L_02217f44
    b .L_02217f5c
    b .L_02217f70
    b .L_02217f9c
    b .L_02217fa4
    b .L_02217fac
    b .L_02217fc4
    b .L_02217fcc
    b .L_02217fe4
    b .L_02217fec
    b .L_02218004
    b .L_0221800c
    b .L_02218024
    b .L_0221803c
    b .L_02218044
    b .L_02218050
    b .L_02218058
    b .L_02218060
    b .L_02218078
    b .L_02218080
    b .L_02218078
.L_02217f1c:
    ldrb r0, [r6, #0xd4]
    add r4, r0, #0x18
    b .L_02218094
.L_02217f28:
    mov r4, #0x28
    b .L_02218094
.L_02217f30:
    mov r4, #0x28
    b .L_02218094
.L_02217f38:
    ldrb r0, [r6, #0xd4]
    add r4, r0, #0x20
    b .L_02218094
.L_02217f44:
    ldr r1, [r6, #0xa8]
    mov r4, #0x28
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x10
    strh r0, [r1, #0x24]
    b .L_02218094
.L_02217f5c:
    ldr r1, [r6, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x10
    strh r0, [r1, #0x24]
    b .L_02218094
.L_02217f70:
    ldr r1, [r6, #0x54]
    mov r5, #0x2c0
    ldrh r0, [r1, #0x24]
    mov r4, #0x28
    bic r0, r0, #0x10
    strh r0, [r1, #0x24]
    ldr r1, [r6, #0xa8]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x10
    strh r0, [r1, #0x24]
    b .L_02218094
.L_02217f9c:
    mov r4, #0x39
    b .L_02218094
.L_02217fa4:
    mov r4, #0x30
    b .L_02218094
.L_02217fac:
    ldr r1, [r6, #0x54]
    mov r4, #0x3a
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_02218094
.L_02217fc4:
    mov r4, #0x3b
    b .L_02218094
.L_02217fcc:
    ldr r1, [r6, #0x54]
    mov r4, #0x3c
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_02218094
.L_02217fe4:
    mov r4, #0x2a
    b .L_02218094
.L_02217fec:
    ldr r1, [r6, #0x54]
    mov r4, #0x2b
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_02218094
.L_02218004:
    mov r4, #0x2c
    b .L_02218094
.L_0221800c:
    ldr r1, [r6, #0x54]
    mov r4, #0x2d
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_02218094
.L_02218024:
    ldr r1, [r6, #0x54]
    mov r4, #0x2d
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_02218094
.L_0221803c:
    mov r4, #0x2c
    b .L_02218094
.L_02218044:
    mov r5, #0x300
    mov r4, #0x28
    b .L_02218094
.L_02218050:
    mov r4, #0x2b
    b .L_02218094
.L_02218058:
    mov r4, #0x2a
    b .L_02218094
.L_02218060:
    ldr r1, [r6, #0x54]
    mov r4, #0x2e
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_02218094
.L_02218078:
    mov r4, #0x2e
    b .L_02218094
.L_02218080:
    ldr r1, [r6, #0x54]
    mov r4, #0x2f
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
.L_02218094:
    ldr r0, [r6, #0xd0]
    tst r0, #0x1000
    bne .L_022180b8
    mvn r0, #0x0
    cmp r4, r0
    ldrne r0, [r6, #0x54]
    ldrneb r0, [r0, #0x38]
    cmpne r4, r0
    beq .L_022180c4
.L_022180b8:
    ldr r0, [r6, #0x54]
    and r1, r4, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
.L_022180c4:
    ldr r0, [r6, #0x54]
    mov r1, #0x0
    strh r5, [r0, #0x36]
    ldr r0, [r6, #0x54]
    strh r1, [r0, #0x30]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.size func_ov095_02217df4, . - func_ov095_02217df4
