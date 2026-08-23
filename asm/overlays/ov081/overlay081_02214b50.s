.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern ActorCollection_GetSpriteGroup
.extern Actor_GetOwningCollection
.extern Actor_GetCachedTerrainHeight
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_ReplaceStateResources

.global func_ov081_02214b50
func_ov081_02214b50:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    bl Actor_GetOwningCollection
    bl ActorCollection_GetSpriteGroup
    ldr r1, [r4, #0x1f8]
    str r1, [sp, #0x0]
    ldr r1, [r4, #0x54]
    ldr r2, [r4, #0x1f0]
    ldr r3, [r4, #0x1f4]
    bl GraphicsSpriteGroup_ReplaceStateResources
    ldrsh r0, [r4, #0xd6]
    mvn r1, #0x0
    cmp r0, #0x8
    addls pc, pc, r0, lsl #0x2
    b .L_02214d14
.L_02214b90:
    b .L_02214d14
    b .L_02214cd8
    b .L_02214c20
    b .L_02214c60
    b .L_02214c88
    b .L_02214bb4
    b .L_02214bf4
    b .L_02214bb4
    b .L_02214cb0
.L_02214bb4:
    mov r0, r4
    bl Actor_GetCachedTerrainHeight
    ldr r1, [r4, #0x24]
    ldr r2, [r4, #0x54]
    cmp r1, r0
    ldreqb r1, [r4, #0xd4]
    ldrneb r0, [r4, #0xd4]
    addne r1, r0, #0x1a
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x1
    strh r0, [r2, #0x24]
    ldr r2, [r4, #0x54]
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x2
    strh r0, [r2, #0x24]
    b .L_02214d14
.L_02214bf4:
    ldr r2, [r4, #0x54]
    ldrb r1, [r4, #0xd4]
    ldrh r0, [r2, #0x24]
    add r1, r1, #0x1a
    bic r0, r0, #0x1
    strh r0, [r2, #0x24]
    ldr r2, [r4, #0x54]
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x2
    strh r0, [r2, #0x24]
    b .L_02214d14
.L_02214c20:
    mov r0, r4
    bl Actor_GetCachedTerrainHeight
    ldr r1, [r4, #0x24]
    ldr r2, [r4, #0x54]
    cmp r1, r0
    ldrb r0, [r4, #0xd4]
    addeq r1, r0, #0x8
    addne r1, r0, #0x1a
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x1
    strh r0, [r2, #0x24]
    ldr r2, [r4, #0x54]
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x2
    strh r0, [r2, #0x24]
    b .L_02214d14
.L_02214c60:
    ldr r2, [r4, #0x54]
    mov r1, #0x11
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x1
    strh r0, [r2, #0x24]
    ldr r2, [r4, #0x54]
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x2
    strh r0, [r2, #0x24]
    b .L_02214d14
.L_02214c88:
    ldr r2, [r4, #0x54]
    mov r1, #0x38
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x1
    strh r0, [r2, #0x24]
    ldr r2, [r4, #0x54]
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x2
    strh r0, [r2, #0x24]
    b .L_02214d14
.L_02214cb0:
    ldr r2, [r4, #0x54]
    ldrb r1, [r4, #0xd4]
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x1
    strh r0, [r2, #0x24]
    ldr r2, [r4, #0x54]
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x2
    strh r0, [r2, #0x24]
    b .L_02214d14
.L_02214cd8:
    mov r0, r4
    bl Actor_GetCachedTerrainHeight
    ldr r1, [r4, #0x24]
    ldr r2, [r4, #0x54]
    cmp r1, r0
    ldrb r0, [r4, #0xd4]
    addeq r1, r0, #0x8
    addne r1, r0, #0x1a
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x1
    strh r0, [r2, #0x24]
    ldr r2, [r4, #0x54]
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x2
    strh r0, [r2, #0x24]
.L_02214d14:
    mvn r0, #0x0
    cmp r1, r0
    ldrne r0, [r4, #0x54]
    ldrneb r2, [r0, #0x38]
    cmpne r1, r2
    beq .L_02214d34
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
.L_02214d34:
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.size func_ov081_02214b50, . - func_ov081_02214b50
