.text
; Matching fallback for the portable implementation in src/overlays/ov080/overlay080_recovery.c.
.extern data_020e6adc
.extern data_020e6b74
.extern data_020e6c0c
.extern ActorCollection_GetSpriteGroup
.extern Actor_GetOwningCollection
.extern ActorExtendedType2_GetDescriptorValue25
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_ReplaceStateResources

.global func_ov080_02212bec
func_ov080_02212bec:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    add r0, r7, #0x200
    ldrh r0, [r0, #0xa0]
    mov r4, #0x0
    mov r5, #0x0
    cmp r0, #0x0
    ldrsh r0, [r7, #0xd6]
    movne r6, #0x1
    moveq r6, r4
    cmp r0, #0x16
    addls pc, pc, r0, lsl #0x2
    b .L_02212d50
.L_02212c20:
    b .L_02212d50
    b .L_02212cd8
    b .L_02212cd8
    b .L_02212cd8
    b .L_02212cd8
    b .L_02212c9c
    b .L_02212c9c
    b .L_02212c7c
    b .L_02212cd0
    b .L_02212cd0
    b .L_02212d50
    b .L_02212d40
    b .L_02212d50
    b .L_02212d48
    b .L_02212d50
    b .L_02212d50
    b .L_02212d50
    b .L_02212cf4
    b .L_02212d10
    b .L_02212d1c
    b .L_02212cec
    b .L_02212d50
    b .L_02212ce4
.L_02212c7c:
    ldrh r1, [r7, #0x4e]
    ldr r0, .L_02212ddc
    ldrb r0, [r0, r1]
    cmp r0, #0x0
    ldrneb r0, [r7, #0xd4]
    movne r5, #0x1
    addne r4, r0, #0x15
    bne .L_02212d50
.L_02212c9c:
    mov r0, r7
    bl ActorExtendedType2_GetDescriptorValue25
    mvn r1, #0x0
    cmp r0, r1
    beq .L_02212cc8
    ldrsh r0, [r7, #0xda]
    cmp r0, #0x1
    ldreqb r0, [r7, #0xd4]
    addeq r4, r0, #0x16
    ldrneb r4, [r7, #0xd4]
    b .L_02212d50
.L_02212cc8:
    ldrb r4, [r7, #0xd4]
    b .L_02212d50
.L_02212cd0:
    ldrb r4, [r7, #0xd4]
    b .L_02212d50
.L_02212cd8:
    ldrb r0, [r7, #0xd4]
    add r4, r0, #0x8
    b .L_02212d50
.L_02212ce4:
    mov r4, #0x11
    b .L_02212d50
.L_02212cec:
    mov r4, r5
    b .L_02212d50
.L_02212cf4:
    ldrh r1, [r7, #0x4e]
    ldr r0, .L_02212de0
    ldrb r0, [r0, r1]
    cmp r0, #0x0
    movne r4, #0x15
    movne r5, #0x1
    b .L_02212d50
.L_02212d10:
    mov r4, #0x10
    mov r5, #0x1
    b .L_02212d50
.L_02212d1c:
    ldrh r1, [r7, #0x4e]
    ldr r0, .L_02212de4
    ldrb r0, [r0, r1]
    cmp r0, #0x0
    ldreqb r0, [r7, #0xd4]
    movne r4, #0x14
    movne r5, #0x1
    addeq r4, r0, #0x8
    b .L_02212d50
.L_02212d40:
    mov r4, #0x12
    b .L_02212d50
.L_02212d48:
    mov r4, #0x16
    mov r5, #0x1
.L_02212d50:
    add r0, r7, r6, lsl #0x2
    ldr r6, [r0, #0x208]
    mov r0, r7
    bl Actor_GetOwningCollection
    bl ActorCollection_GetSpriteGroup
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r7, #0x54]
    ldmib r6, {r2, r3}
    bl GraphicsSpriteGroup_ReplaceStateResources
    ldr r0, [r7, #0x54]
    ldrb r1, [r0, #0x38]
    cmp r4, r1
    beq .L_02212d90
    and r1, r4, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
.L_02212d90:
    ldr r0, [r7, #0x54]
    mov r1, #0x100
    strh r1, [r0, #0x36]
    ldr r0, [r7, #0x54]
    mov r1, #0x0
    strh r1, [r0, #0x30]
    ldr r1, [r7, #0x54]
    cmp r5, #0x0
    ldrneh r0, [r1, #0x24]
    bicne r0, r0, #0x3
    bne .L_02212dd4
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r7, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
.L_02212dd4:
    strh r0, [r1, #0x24]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02212ddc: .word data_020e6c0c
.L_02212de0: .word data_020e6b74
.L_02212de4: .word data_020e6adc
.size func_ov080_02212bec, . - func_ov080_02212bec
