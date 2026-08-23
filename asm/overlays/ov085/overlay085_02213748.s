.text
; Matching fallback for the portable implementation in src/overlays/ov085/overlay085_recovery.c.
.extern ActorCollection_GetSpriteGroup
.extern Actor_GetOwningCollection
.extern Actor_GetCachedTerrainHeight
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_ReplaceStateResources

.global func_ov085_02213748
func_ov085_02213748:
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
    b .L_022138b4
.L_02213788:
    b .L_022138b4
    b .L_02213868
    b .L_022137e0
    b .L_02213814
    b .L_02213830
    b .L_022137ac
    b .L_022137ac
    b .L_0221384c
    b .L_0221389c
.L_022137ac:
    mov r0, r4
    bl Actor_GetCachedTerrainHeight
    ldr r1, [r4, #0x24]
    ldr r2, [r4, #0x54]
    cmp r1, r0
    ldreqb r1, [r4, #0xd4]
    ldrneb r0, [r4, #0xd4]
    addne r1, r0, #0x1a
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x2
    bic r0, r0, #0x1
    strh r0, [r2, #0x24]
    b .L_022138b4
.L_022137e0:
    mov r0, r4
    bl Actor_GetCachedTerrainHeight
    ldr r1, [r4, #0x24]
    ldr r2, [r4, #0x54]
    cmp r1, r0
    ldrb r0, [r4, #0xd4]
    addeq r1, r0, #0x8
    addne r1, r0, #0x1a
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x2
    bic r0, r0, #0x1
    strh r0, [r2, #0x24]
    b .L_022138b4
.L_02213814:
    ldr r2, [r4, #0x54]
    mov r1, #0x11
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x2
    bic r0, r0, #0x1
    strh r0, [r2, #0x24]
    b .L_022138b4
.L_02213830:
    ldr r2, [r4, #0x54]
    mov r1, #0x38
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x2
    bic r0, r0, #0x1
    strh r0, [r2, #0x24]
    b .L_022138b4
.L_0221384c:
    ldr r2, [r4, #0x54]
    ldrb r1, [r4, #0xd4]
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x2
    bic r0, r0, #0x1
    strh r0, [r2, #0x24]
    b .L_022138b4
.L_02213868:
    mov r0, r4
    bl Actor_GetCachedTerrainHeight
    ldr r1, [r4, #0x24]
    ldr r2, [r4, #0x54]
    cmp r1, r0
    ldrb r0, [r4, #0xd4]
    addeq r1, r0, #0x8
    addne r1, r0, #0x1a
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x2
    bic r0, r0, #0x1
    strh r0, [r2, #0x24]
    b .L_022138b4
.L_0221389c:
    ldr r2, [r4, #0x54]
    mov r1, #0x37
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x2
    bic r0, r0, #0x1
    strh r0, [r2, #0x24]
.L_022138b4:
    mvn r0, #0x0
    cmp r1, r0
    ldrne r0, [r4, #0x54]
    ldrneb r2, [r0, #0x38]
    cmpne r1, r2
    beq .L_022138d4
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
.L_022138d4:
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.size func_ov085_02213748, . - func_ov085_02213748
