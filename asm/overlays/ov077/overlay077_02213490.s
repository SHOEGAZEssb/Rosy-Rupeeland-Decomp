.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.
.extern Heap_Alloc
.extern data_021052fc
.extern data_ov077_02216fc8
.extern data_ov077_02217030
.extern data_ov077_022174c8
.extern data_ov077_022174d0
.extern DisplayController_GetVerticalOffset
.extern AnimationResource_Init
.extern UtilAnimationResource_Init
.extern GamePhaseRuntime_GetActorCollection
.extern GamePhaseMetadata_GetByIndex
.extern ActorCollection_GetSpriteGroup
.extern func_ov077_02212d04
.extern func_ov077_02213768
.extern func_ov090_0221c3dc
.extern func_ov090_0221c468
.extern func_ov090_0221ca34
.extern gHeapContext

.global func_ov077_02213490
func_ov077_02213490:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x14
    mov r10, r0
    bl func_ov077_02212d04
    ldr r0, .L_0221374c
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x24]
    ldr r0, [r0, #0x0]
    sub r0, r0, #0x1
    bl GamePhaseMetadata_GetByIndex
    ldr r0, [r0, #0x40]
    ldr r1, .L_02213750
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0x1e
    cmp r0, #0x3
    movne r9, #0x1
    ldr r3, .L_02213754
    mov r0, #0x20
    mov r2, #0x4
    moveq r9, #0x0
    bl Heap_Alloc
    movs r5, r0
    beq .L_0221355c
    ldr r0, .L_0221374c
    ldr r2, [r10, #0x20c]
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    ldr r6, [r2, #0xc]
    ldr r7, [r2, #0x8]
    ldr r8, [r2, #0x4]
    bl GamePhaseRuntime_GetActorCollection
    bl ActorCollection_GetSpriteGroup
    ldr r1, .L_0221374c
    mov r4, r0
    ldr r0, [r1, #0x0]
    mov r1, #0x2
    bl GamePhaseRuntime_GetActorCollection
    bl ActorCollection_GetSpriteGroup
    mov r11, r0
    bl DisplayController_GetVerticalOffset
    mov r1, #0x2
    stmia sp, {r1, r8}
    str r7, [sp, #0x8]
    str r6, [sp, #0xc]
    str r0, [sp, #0x10]
    mov r2, r4
    mov r3, r11
    mov r0, r5
    mov r1, #0x0
    bl UtilAnimationResource_Init
    mov r5, r0
.L_0221355c:
    str r5, [r10, #0x2c4]
    cmp r9, #0x0
    ldrne r0, [r10, #0x2c4]
    ldrne r1, [r0, #0x8]
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x14
    strneh r0, [r1, #0x24]
    add r0, r10, #0x200
    ldrsb r0, [r0, #0xe4]
    mov r0, r0, lsl #0x1c
    movs r0, r0, asr #0x1c
    bne .L_02213668
    ldr r1, .L_02213758
    ldr r3, .L_02213754
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_022135b8
    ldr r1, .L_0221375c
    sub r2, r1, #0x4
    add r3, r1, #0x1
    bl AnimationResource_Init
.L_022135b8:
    mov r7, #0x0
    ldr r4, .L_0221374c
    str r0, [r10, #0x2e0]
    mov r11, r7
    mvn r5, #0x0
.L_022135cc:
    ldr r1, .L_02213758
    ldr r3, .L_02213754
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    movs r8, r0
    beq .L_02213630
    ldr r0, [r4, #0x0]
    mov r1, #0x1
    bl GamePhaseRuntime_GetActorCollection
    bl ActorCollection_GetSpriteGroup
    mov r6, r0
    ldr r0, [r4, #0x0]
    mov r1, #0x2
    bl GamePhaseRuntime_GetActorCollection
    bl ActorCollection_GetSpriteGroup
    str r11, [sp, #0x0]
    str r11, [sp, #0x4]
    str r5, [sp, #0x8]
    mov r2, r0
    ldr r3, [r10, #0x2e0]
    mov r1, r6
    mov r0, r8
    bl func_ov090_0221c468
    mov r8, r0
.L_02213630:
    add r0, r10, r7, lsl #0x2
    str r8, [r0, #0x2d4]
    cmp r9, #0x0
    beq .L_02213658
    ldr r0, [r0, #0x2d4]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x8]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x14
    strh r0, [r1, #0x24]
.L_02213658:
    add r7, r7, #0x1
    cmp r7, #0x3
    blt .L_022135cc
    b .L_02213688
.L_02213668:
    mov r2, #0x0
    str r2, [r10, #0x2e0]
    mov r1, r2
.L_02213674:
    add r0, r10, r2, lsl #0x2
    add r2, r2, #0x1
    str r1, [r0, #0x2d4]
    cmp r2, #0x3
    blt .L_02213674
.L_02213688:
    add r0, r10, #0x200
    ldrsb r0, [r0, #0xe4]
    mov r3, #0x0
    mov r0, r0, lsl #0x1c
    mov r0, r0, asr #0x1c
    cmp r0, #0x1
    bne .L_022136dc
    ldr r0, .L_02213760
    ldr r2, [r10, #0x218]
    ldr r0, [r0, #0x68]
    mov r4, #0x1
    cmp r2, r0
    ldr r0, .L_02213764
    bne .L_022136d4
    ldr r1, [r10, #0x21c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r4, #0x0
.L_022136d4:
    cmp r4, #0x0
    moveq r3, #0x1
.L_022136dc:
    cmp r3, #0x0
    beq .L_02213744
    ldr r2, [r10, #0x54]
    mov r1, #0x10
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x10
    strh r0, [r2, #0x24]
    ldr r0, [r10, #0x2c4]
    bl func_ov077_02213768
    ldr r0, [r10, #0x298]
    mov r1, #0x0
    bl func_ov090_0221c3dc
    add r0, r10, #0x200
    ldrsb r0, [r0, #0xe4]
    mov r0, r0, lsl #0x1c
    movs r0, r0, asr #0x1c
    bne .L_02213744
    mov r5, #0x0
    mov r4, r5
.L_02213728:
    add r0, r10, r5, lsl #0x2
    ldr r0, [r0, #0x2d4]
    mov r1, r4
    bl func_ov090_0221ca34
    add r5, r5, #0x1
    cmp r5, #0x3
    blt .L_02213728
.L_02213744:
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0221374c: .word data_021052fc
.L_02213750: .word data_ov077_022174c8
.L_02213754: .word gHeapContext
.L_02213758: .word data_ov077_022174d0
.L_0221375c: .word 0x129c
.L_02213760: .word data_ov077_02216fc8
.L_02213764: .word data_ov077_02217030
.size func_ov077_02213490, . - func_ov077_02213490
