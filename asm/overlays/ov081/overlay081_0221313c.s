.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern gActorRuntimeCollection
.extern ActorRuntimeCollection_GetPendingAttachmentFlag
.extern ActorDerivedRuntime_HandlePairActive
.extern func_0204cfa4
.extern func_020593dc
.extern func_020adc90
.extern gSoundContext

.global func_ov081_0221313c
func_ov081_0221313c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x8
    mov r6, r0
    ldr r0, .L_02213364
    mov r5, r1
    mov r4, r2
    bl ActorRuntimeCollection_GetPendingAttachmentFlag
    cmp r0, #0x0
    ldreq r0, [r6, #0x114]
    cmpeq r0, #0x0
    bne .L_0221334c
    ldrb r0, [r5, #0x4d]
    cmp r0, #0x1
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    bne .L_022131d0
    cmp r0, #0x2
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    bne .L_022131d0
    cmp r0, #0x7
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    bne .L_022131d0
    cmp r0, #0x9
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    bne .L_022131d0
    cmp r0, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0221334c
.L_022131d0:
    ldr r3, [r5, #0x1c]
    ldr r2, [r6, #0x1c]
    ldr r1, [r5, #0x20]
    ldr r0, [r6, #0x20]
    sub r8, r3, r2
    sub r9, r1, r0
    mov r0, r8
    mov r1, r9
    bl func_0204cfa4
    mov r7, r0
    cmp r7, #0x1000
    ble .L_0221334c
    mov r0, r8
    mov r1, r7
    bl func_020adc90
    add r0, r0, r0, lsl #0x1
    add r2, r0, r0, lsr #0x1f
    mov r1, r7
    mov r0, r9
    mov r7, r2, asr #0x1
    bl func_020adc90
    ldr r1, [r6, #0xd0]
    add r0, r0, r0, lsl #0x1
    tst r1, #0x10
    addne r1, r7, r7, lsr #0x1f
    add r0, r0, r0, lsr #0x1f
    movne r7, r1, asr #0x1
    mov r0, r0, asr #0x1
    addne r0, r0, r0, lsr #0x1f
    ldrb r1, [r5, #0x4d]
    movne r0, r0, asr #0x1
    cmp r1, #0x9
    moveq r2, #0x1
    movne r2, #0x0
    cmp r2, #0x0
    beq .L_0221329c
    ldr r2, [r5, #0x9c]
    add r1, r7, r7, lsr #0x1f
    add r2, r2, r1, asr #0x1
    str r2, [r5, #0x9c]
    ldr r2, [r5, #0xa0]
    add r0, r0, r0, lsr #0x1f
    add r2, r2, r0, asr #0x1
    str r2, [r5, #0xa0]
    ldr r2, [r6, #0x8c]
    sub r1, r2, r1, asr #0x1
    str r1, [r6, #0x8c]
    ldr r1, [r6, #0x90]
    sub r0, r1, r0, asr #0x1
    str r0, [r6, #0x90]
    b .L_022132ec
.L_0221329c:
    cmp r1, #0x3
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    beq .L_022132d4
    ldr r2, [r6, #0x8c]
    add r1, r7, r7, lsr #0x1f
    sub r1, r2, r1, asr #0x1
    str r1, [r6, #0x8c]
    ldr r1, [r6, #0x90]
    add r0, r0, r0, lsr #0x1f
    sub r0, r1, r0, asr #0x1
    str r0, [r6, #0x90]
    b .L_022132ec
.L_022132d4:
    ldr r1, [r6, #0x9c]
    sub r1, r1, r7
    str r1, [r6, #0x9c]
    ldr r1, [r6, #0xa0]
    sub r0, r1, r0
    str r0, [r6, #0xa0]
.L_022132ec:
    cmp r4, #0x0
    bne .L_0221333c
    ldr r0, [r6, #0xd0]
    tst r0, #0x10
    bne .L_0221333c
    add r0, r6, #0x200
    ldrh r2, [r0, #0x3a]
    ldr r0, .L_02213368
    cmp r2, r0
    beq .L_0221333c
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r1, #0x100
    ldr r0, .L_0221336c
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r6
    mov r1, r2, asr #0x7
    and r2, r2, #0x7f
    bl func_020593dc
.L_0221333c:
    ldr r1, [r6, #0x234]
    mvn r0, #0x0
    cmp r1, r0
    strne r1, [r6, #0x230]
.L_0221334c:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl ActorDerivedRuntime_HandlePairActive
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02213364: .word gActorRuntimeCollection
.L_02213368: .word 0xffff
.L_0221336c: .word gSoundContext
.size func_ov081_0221313c, . - func_ov081_0221313c
