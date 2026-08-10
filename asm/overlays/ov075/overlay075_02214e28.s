.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern ActorCollection_GetSpriteOwner
.extern Actor_GetCollection
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_020740c8

.global func_ov075_02214e28
func_ov075_02214e28:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r6, r0
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r6, #0x1f8]
    str r1, [sp, #0x0]
    ldr r1, [r6, #0x54]
    ldr r2, [r6, #0x1f0]
    ldr r3, [r6, #0x1f4]
    bl func_020740c8
    ldr r2, [r6, #0x54]
    mvn r1, #0x0
    ldrh r0, [r2, #0x24]
    mov r4, #0x2
    mov r5, #0x1
    bic r0, r0, #0x10
    strh r0, [r2, #0x24]
    ldrsh r0, [r6, #0xd6]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_02214ec8
.L_02214e80:
    b .L_02214e90
    b .L_02214ea4
    b .L_02214eb4
    b .L_02214ebc
.L_02214e90:
    ldr r2, [r6, #0x54]
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x10
    strh r0, [r2, #0x24]
    b .L_02214ec8
.L_02214ea4:
    mov r1, #0x12
    mov r4, #0x0
    mov r5, #0x3
    b .L_02214ec8
.L_02214eb4:
    ldrb r1, [r6, #0xd4]
    b .L_02214ec8
.L_02214ebc:
    mov r1, #0x13
    mov r4, #0x0
    mov r5, #0x3
.L_02214ec8:
    mvn r0, #0x0
    cmp r1, r0
    beq .L_02214f10
    ldr r0, [r6, #0x54]
    ldrb r2, [r0, #0x38]
    cmp r1, r2
    beq .L_02214eec
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
.L_02214eec:
    ldr r2, [r6, #0x54]
    mvn r0, r5
    ldrh r1, [r2, #0x24]
    and r0, r1, r0
    strh r0, [r2, #0x24]
    ldr r1, [r6, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, r4
    strh r0, [r1, #0x24]
.L_02214f10:
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.size func_ov075_02214e28, . - func_ov075_02214e28
