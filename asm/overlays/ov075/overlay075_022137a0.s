.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern VecFx32Object_Assign
.extern Actor_ClearTransientContactState
.extern Actor_GetCachedTerrainHeight
.extern func_020593dc
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_ov075_02212d80
.extern func_ov075_02212e04
.extern func_ov075_02213cc0
.extern func_ov075_02213cfc
.extern func_ov075_02213f08
.extern gSoundContext

.global func_ov075_022137a0
func_ov075_022137a0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x38
    mov r7, r0
    ldr r0, [r7, #0x14]
    tst r0, #0x200000
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02213bf8
    ldr r1, [r7, #0x260]
    add r0, r7, #0x28
    bic r1, r1, #0x3
    str r1, [r7, #0x260]
    ldr r2, [r7, #0x14]
    add r1, r7, #0x18
    orr r2, r2, #0x6
    bic r2, r2, #0x800000
    str r2, [r7, #0x14]
    bl VecFx32Object_Assign
    mov r0, r7
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x18]
    blx r1
    mov r0, r7
    bl func_ov075_02213f08
    mov r0, r7
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    bne .L_02213840
    mov r0, r7
    bl func_ov075_02212d80
    cmp r0, #0x0
    bne .L_02213840
    mov r0, r7
    bl func_ov075_02212e04
    cmp r0, #0x0
    moveq r0, #0x1
    beq .L_02213844
.L_02213840:
    mov r0, #0x0
.L_02213844:
    cmp r0, #0x0
    bne .L_0221399c
    ldr r2, [r7, #0x54]
    mov r0, r7
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x10
    strh r1, [r2, #0x24]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    beq .L_02213950
    mov r5, #0x1
    mov r6, #0x0
    add r4, r7, #0x200
    b .L_022138b0
.L_02213884:
    ldr r0, [r7, #0x2a4]
    ldr r0, [r0, r6, lsl #0x2]
    cmp r0, #0x0
    beq .L_022138ac
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    moveq r5, #0x0
    beq .L_022138bc
.L_022138ac:
    add r6, r6, #0x1
.L_022138b0:
    ldrsh r0, [r4, #0xa8]
    cmp r6, r0
    blt .L_02213884
.L_022138bc:
    ldr r0, [r7, #0xd0]
    cmp r5, #0x0
    bicne r0, r0, #0x20000
    orreq r0, r0, #0x20000
    mov r6, #0x0
    str r0, [r7, #0xd0]
    add r8, r7, #0x200
    mov r4, r6
    b .L_02213940
.L_022138e0:
    ldr r0, [r7, #0x2a4]
    ldr r0, [r0, r6, lsl #0x2]
    cmp r0, #0x0
    beq .L_0221393c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    beq .L_0221393c
    ldr r0, [r7, #0x2a4]
    cmp r5, #0x0
    ldreq r1, [r0, r6, lsl #0x2]
    ldreq r0, [r1, #0xd0]
    orreq r0, r0, #0x20000
    streq r0, [r1, #0xd0]
    beq .L_0221393c
    ldr r1, [r0, r6, lsl #0x2]
    ldr r0, [r1, #0xd0]
    bic r0, r0, #0x20000
    str r0, [r1, #0xd0]
    ldr r0, [r7, #0x2a4]
    ldr r0, [r0, r6, lsl #0x2]
    str r4, [r0, #0x1fc]
.L_0221393c:
    add r6, r6, #0x1
.L_02213940:
    ldrsh r0, [r8, #0xa8]
    cmp r6, r0
    blt .L_022138e0
    b .L_02213ba8
.L_02213950:
    mov r0, r7
    bl func_ov075_02212d80
    cmp r0, #0x0
    beq .L_02213ba8
    mov r0, r7
    ldr r2, [r0, #0x0]
    add r1, sp, #0x8
    ldr r2, [r2, #0xc8]
    blx r2
    ldr r0, [r7, #0x21c]
    tst r0, #0x1
    add r0, r7, r0, asr #0x1
    ldrne r2, [r0, #0x0]
    ldrne r1, [r7, #0x218]
    ldrne r2, [r2, r1]
    add r1, sp, #0x8
    ldreq r2, [r7, #0x218]
    blx r2
    b .L_02213ba8
.L_0221399c:
    ldr r0, [r7, #0x298]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_02213ba8
.L_022139ac:
    b .L_022139bc
    b .L_02213a5c
    b .L_02213ad4
    b .L_02213b54
.L_022139bc:
    ldr r2, [r7, #0x54]
    add r0, r7, #0x200
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x10
    strh r1, [r2, #0x24]
    ldrsh r1, [r0, #0x5a]
    cmp r1, #0x0
    subne r1, r1, #0x1
    strneh r1, [r0, #0x5a]
    bne .L_02213a44
    mov r0, r7
    bl func_ov075_02213cfc
    mov r0, #0x1
    str r0, [r7, #0x298]
    ldr r0, [r7, #0x54]
    mov r1, #0x14
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r2, [r7, #0x54]
    mov r0, r7
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x3
    strh r1, [r2, #0x24]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8c]
    blx r1
    mov r2, #0x0
    mov r0, #0x100
    str r2, [sp, #0x0]
    str r0, [sp, #0x4]
    add r1, r0, #0xe9
    ldr r0, .L_02213c00
    mov r3, r7
    ldr r0, [r0, #0x0]
    bl func_020593dc
.L_02213a44:
    mov r0, #0x10000
    ldr r1, [r7, #0x5c]
    rsb r0, r0, #0x0
    and r0, r1, r0
    str r0, [r7, #0x5c]
    b .L_02213ba8
.L_02213a5c:
    ldr r1, [r7, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x10
    strh r0, [r1, #0x24]
    ldr r0, [r7, #0x54]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_02213abc
    mov r0, #0x2
    str r0, [r7, #0x298]
    ldr r1, [r7, #0x2ac]
    ldr r0, [r7, #0x54]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r7, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r1, [r7, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
.L_02213abc:
    mov r0, #0x10000
    ldr r1, [r7, #0x5c]
    rsb r0, r0, #0x0
    and r0, r1, r0
    str r0, [r7, #0x5c]
    b .L_02213ba8
.L_02213ad4:
    ldr r0, [r7, #0x260]
    orr r0, r0, #0x3
    str r0, [r7, #0x260]
    ldr r0, [r7, #0x14]
    bic r0, r0, #0x2
    bic r0, r0, #0x4
    str r0, [r7, #0x14]
    ldr r1, [r7, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x10
    strh r0, [r1, #0x24]
    ldr r0, [r7, #0x54]
    ldrb r0, [r0, #0x38]
    cmp r0, #0x1
    ble .L_02213b18
    cmp r0, #0x6
    blt .L_02213b38
.L_02213b18:
    mov r0, #0x10000
    ldr r1, [r7, #0x5c]
    rsb r0, r0, #0x0
    and r0, r1, r0
    orr r0, r0, #0x3fc
    orr r0, r0, #0xfc00
    str r0, [r7, #0x5c]
    b .L_02213ba8
.L_02213b38:
    mov r0, #0x10000
    ldr r1, [r7, #0x5c]
    rsb r0, r0, #0x0
    and r0, r1, r0
    orr r0, r0, #0x4
    str r0, [r7, #0x5c]
    b .L_02213ba8
.L_02213b54:
    ldr r1, [r7, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x10
    strh r0, [r1, #0x24]
    ldr r0, [r7, #0x54]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_02213b94
    mov r0, #0x0
    str r0, [r7, #0x298]
    ldr r1, [r7, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x10
    strh r0, [r1, #0x24]
.L_02213b94:
    mov r0, #0x10000
    ldr r1, [r7, #0x5c]
    rsb r0, r0, #0x0
    and r0, r1, r0
    str r0, [r7, #0x5c]
.L_02213ba8:
    mov r0, r7
    bl func_ov075_02213cc0
    ldr r0, [r7, #0x298]
    cmp r0, #0x2
    bne .L_02213bf0
    mov r0, r7
    bl Actor_GetCachedTerrainHeight
    ldr r1, [r7, #0x24]
    cmp r1, r0
    ble .L_02213bf0
    mov r0, r7
    bl Actor_GetCachedTerrainHeight
    ldr r1, [r7, #0x24]
    add r0, r0, #0x10000
    cmp r1, r0
    ldrlt r0, [r7, #0x14]
    orrlt r0, r0, #0x800000
    strlt r0, [r7, #0x14]
.L_02213bf0:
    mov r0, r7
    bl Actor_ClearTransientContactState
.L_02213bf8:
    add sp, sp, #0x38
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_02213c00: .word gSoundContext
.size func_ov075_022137a0, . - func_ov075_022137a0
