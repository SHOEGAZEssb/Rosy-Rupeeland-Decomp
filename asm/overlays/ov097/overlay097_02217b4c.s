.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern ActorCollection_GetSpriteGroup
.extern Actor_GetOwningCollection
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_ReplaceStateResources

.global func_ov097_02217b4c
func_ov097_02217b4c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrsh r1, [r5, #0xd6]
    cmp r1, #0x1a
    beq .L_02217b6c
    cmp r1, #0x1b
    beq .L_02217bc4
    b .L_02217cd0
.L_02217b6c:
    ldr r4, [r5, #0x208]
    bl Actor_GetOwningCollection
    bl ActorCollection_GetSpriteGroup
    ldr r1, [r4, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r4, {r2, r3}
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
    b .L_02217cd0
.L_02217bc4:
    ldr r4, [r5, #0x208]
    bl Actor_GetOwningCollection
    bl ActorCollection_GetSpriteGroup
    ldr r1, [r4, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r4, {r2, r3}
    bl GraphicsSpriteGroup_ReplaceStateResources
    ldrsh r0, [r5, #0xda]
    mvn r1, #0x0
    mov r4, #0x1
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_02217c88
.L_02217bfc:
    b .L_02217c24
    b .L_02217c30
    b .L_02217c3c
    b .L_02217c80
    b .L_02217c44
    b .L_02217c4c
    b .L_02217c58
    b .L_02217c64
    b .L_02217c70
    b .L_02217c78
.L_02217c24:
    ldrb r0, [r5, #0xd4]
    add r1, r0, #0x18
    b .L_02217c88
.L_02217c30:
    ldrb r0, [r5, #0xd4]
    add r1, r0, #0x20
    b .L_02217c88
.L_02217c3c:
    mov r1, #0x28
    b .L_02217c88
.L_02217c44:
    mov r1, #0x2a
    b .L_02217c88
.L_02217c4c:
    mov r4, #0x0
    mov r1, #0x8
    b .L_02217c88
.L_02217c58:
    ldrb r0, [r5, #0xd4]
    add r1, r0, #0x2b
    b .L_02217c88
.L_02217c64:
    ldrb r0, [r5, #0xd4]
    add r1, r0, #0x20
    b .L_02217c88
.L_02217c70:
    mov r1, #0x2a
    b .L_02217c88
.L_02217c78:
    mov r1, #0x2a
    b .L_02217c88
.L_02217c80:
    ldrb r0, [r5, #0xd4]
    add r1, r0, #0x33
.L_02217c88:
    mvn r0, #0x0
    cmp r1, r0
    beq .L_02217ca0
    ldr r0, [r5, #0x54]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
.L_02217ca0:
    ldr r1, [r5, #0x54]
    cmp r4, #0x0
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x54]
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x2
    strneh r0, [r1, #0x24]
    ldreqh r0, [r1, #0x24]
    biceq r0, r0, #0x2
    streqh r0, [r1, #0x24]
.L_02217cd0:
    ldr r0, [r5, #0x54]
    mov r1, #0x100
    strh r1, [r0, #0x36]
    ldr r0, [r5, #0x54]
    mov r1, #0x0
    strh r1, [r0, #0x30]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov097_02217b4c, . - func_ov097_02217b4c
