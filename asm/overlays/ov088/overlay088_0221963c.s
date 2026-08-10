.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern func_020593dc
.extern GraphicsSpriteState_SetAnimationIndex
.extern gSoundContext

.global func_ov088_0221963c
func_ov088_0221963c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    add r0, r5, #0x200
    ldrh r1, [r0, #0x1a]
    tst r1, #0x2
    beq .L_022196b8
    bic r1, r1, #0x2
    strh r1, [r0, #0x1a]
    mov r1, #0x2
    strh r1, [r5, #0xd6]
    mov r1, #0xb4
    strh r1, [r0, #0x40]
    mov r1, #0x1
    strh r1, [r5, #0xda]
    mov r1, #0x0
    strh r1, [r0, #0x70]
    ldr r1, [r5, #0x238]
    ldrh r4, [r1, #0x26]
    cmp r4, #0x0
    beq .L_022196b8
    ldrsh r2, [r0, #0x70]
    mov r1, #0x100
    ldr r0, .L_022198a8
    str r2, [sp, #0x0]
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r5
    mov r1, r4, asr #0x7
    and r2, r4, #0x7f
    bl func_020593dc
.L_022196b8:
    ldrsh r0, [r5, #0xd6]
    mvn r2, #0x0
    mov r4, r2
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_02219794
.L_022196d0:
    b .L_02219794
    b .L_022196e8
    b .L_0221972c
    b .L_02219738
    b .L_02219748
    b .L_02219788
.L_022196e8:
    add r0, r5, #0x200
    ldrh r0, [r0, #0x1a]
    tst r0, #0x2000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_0221971c
    ldrsh r0, [r5, #0xda]
    cmp r0, #0x0
    ldreqb r0, [r5, #0xd4]
    addeq r4, r0, #0x18
    addeq r2, r0, #0x8
    beq .L_02219794
.L_0221971c:
    ldrb r0, [r5, #0xd4]
    add r4, r0, #0x8
    mov r2, r4
    b .L_02219794
.L_0221972c:
    ldrb r4, [r5, #0xd4]
    mov r2, r4
    b .L_02219794
.L_02219738:
    ldrb r0, [r5, #0xd4]
    add r4, r0, #0x8
    mov r2, r4
    b .L_02219794
.L_02219748:
    add r0, r5, #0x200
    ldrh r0, [r0, #0x1a]
    tst r0, #0x2000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_0221977c
    ldrsh r0, [r5, #0xda]
    cmp r0, #0x0
    ldreqb r0, [r5, #0xd4]
    addeq r4, r0, #0x18
    addeq r2, r0, #0x8
    beq .L_02219794
.L_0221977c:
    ldrb r4, [r5, #0xd4]
    mov r2, r4
    b .L_02219794
.L_02219788:
    ldrb r0, [r5, #0xd4]
    add r4, r0, #0x20
    add r2, r0, #0x8
.L_02219794:
    mvn r0, #0x0
    cmp r2, r0
    ldrne r0, [r5, #0x54]
    ldrneb r1, [r0, #0x38]
    cmpne r2, r1
    beq .L_022197b4
    and r1, r2, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
.L_022197b4:
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r0, [r5, #0x224]
    cmp r0, #0x0
    mvnne r1, #0x0
    cmpne r4, r1
    ldrneb r1, [r0, #0x38]
    cmpne r4, r1
    beq .L_02219814
    and r1, r4, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r5, #0x228]
    cmp r0, #0x0
    beq .L_02219814
    ldrb r1, [r5, #0xd4]
    add r1, r1, #0x28
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
.L_02219814:
    ldr r1, [r5, #0x224]
    cmp r1, #0x0
    beq .L_0221983c
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x224]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
.L_0221983c:
    ldr r1, [r5, #0x228]
    cmp r1, #0x0
    beq .L_02219864
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x228]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
.L_02219864:
    ldr r0, [r5, #0x22c]
    cmp r0, #0x0
    beq .L_022198a0
    ldrb r1, [r5, #0xd4]
    add r1, r1, #0x10
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r5, #0x22c]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x22c]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
.L_022198a0:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
.L_022198a8: .word gSoundContext
.size func_ov088_0221963c, . - func_ov088_0221963c
