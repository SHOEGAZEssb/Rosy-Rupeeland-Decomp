.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern ActorCollection_GetSpriteOwner
.extern Actor_GetCollection
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_ReplaceStateResources

.global func_ov081_02212fe4
func_ov081_02212fe4:
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
    bl GraphicsSpriteGroup_ReplaceStateResources
    ldrsh r0, [r6, #0xd6]
    mvn r2, #0x0
    mov r4, #0x2
    cmp r0, #0x8
    mov r5, #0x1
    addls pc, pc, r0, lsl #0x2
    b .L_0221308c
.L_0221302c:
    b .L_0221308c
    b .L_0221307c
    b .L_02213068
    b .L_02213068
    b .L_02213068
    b .L_02213050
    b .L_02213050
    b .L_02213050
    b .L_02213074
.L_02213050:
    ldrsh r0, [r6, #0xda]
    cmp r0, #0x1
    ldreqb r0, [r6, #0xd4]
    addeq r2, r0, #0x19
    ldrneb r2, [r6, #0xd4]
    b .L_0221308c
.L_02213068:
    ldrb r0, [r6, #0xd4]
    add r2, r0, #0x8
    b .L_0221308c
.L_02213074:
    ldrb r2, [r6, #0xd4]
    b .L_0221308c
.L_0221307c:
    ldrb r0, [r6, #0xd4]
    mov r5, #0x3
    mov r4, #0x0
    add r2, r0, #0x8
.L_0221308c:
    mvn r0, #0x0
    cmp r2, r0
    beq .L_022130d4
    ldr r0, [r6, #0x54]
    ldrb r1, [r0, #0x38]
    cmp r2, r1
    beq .L_022130b0
    and r1, r2, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
.L_022130b0:
    ldr r2, [r6, #0x54]
    mvn r0, r5
    ldrh r1, [r2, #0x24]
    and r0, r1, r0
    strh r0, [r2, #0x24]
    ldr r1, [r6, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, r4
    strh r0, [r1, #0x24]
.L_022130d4:
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.size func_ov081_02212fe4, . - func_ov081_02212fe4
