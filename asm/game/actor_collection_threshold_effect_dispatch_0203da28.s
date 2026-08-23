; Matching retail form; see src/game/actor_collection_threshold_effect_dispatch.c.
.text
.extern data_020df9e8
.extern data_020dfa20
.extern data_020e8380
.extern data_021052fc
.extern GamePhaseRuntime_GetActorCollection
.extern RuntimePresentationManager_GetGraphics3dPresentation
.extern func_020a2614
    .global ActorCollection_DispatchType2ThresholdEffects
    .type ActorCollection_DispatchType2ThresholdEffects, @function
ActorCollection_DispatchType2ThresholdEffects: ; 0x0203da28
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r9, #0x0
    mov r10, r0
    ldr r6, .L_0203db70
    mov r11, #0x3
    mov r5, r9
    ldr r7, .L_0203db74
    ldr r4, .L_0203db78
    b .L_0203db50
.L_0203da4c:
    ldr r0, [r4, #0x0]
    mov r1, #0x1
    bl GamePhaseRuntime_GetActorCollection
    ldr r8, [r0, r9, lsl #0x2]
    cmp r8, #0x0
    beq .L_0203db4c
    ldrb r0, [r8, #0x4d]
    cmp r0, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0203db4c
    ldr r0, [r8, #0x10]
    tst r0, #0x4
    beq .L_0203db4c
    tst r0, #0x1000000
    bne .L_0203db4c
    ldrh r1, [r8, #0x4e]
    mov r0, #0x30
    mla r0, r1, r0, r7
    ldrsh r0, [r0, #0x2e]
    mov r0, r0, lsl #0x10
    cmp r10, r0, asr #0x1c
    blt .L_0203db4c
    ldr r2, .L_0203db7c
    ldr r0, [r8, #0x218]
    ldr r2, [r2, #0x38]
    mov r1, #0x1
    cmp r0, r2
    bne .L_0203dad8
    ldr r3, [r8, #0x21c]
    ldr r2, [r6, #0x4]
    cmp r3, r2
    cmpne r0, #0x0
    moveq r1, #0x0
.L_0203dad8:
    cmp r1, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0203db4c
    str r5, [r8, #0x1fc]
    mov r0, r8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    bne .L_0203db4c
    mov r0, r8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x104]
    blx r1
    ldr r0, [r4, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    str r11, [sp, #0x0]
    ldr r2, [r8, #0x1c]
    ldr r3, [r8, #0x20]
    ldr r8, [r8, #0x24]
    mov r1, #0x1
    mov r8, r8, asr #0xc
    mov r2, r2, asr #0xc
    rsb r3, r8, r3, asr #0xc
    bl func_020a2614
.L_0203db4c:
    add r9, r9, #0x1
.L_0203db50:
    ldr r0, [r4, #0x0]
    mov r1, #0x1
    bl GamePhaseRuntime_GetActorCollection
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe74]
    cmp r9, r0
    blt .L_0203da4c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0203db70: .word data_020dfa20
.L_0203db74: .word data_020e8380
.L_0203db78: .word data_021052fc
.L_0203db7c: .word data_020df9e8
    .size ActorCollection_DispatchType2ThresholdEffects, . - ActorCollection_DispatchType2ThresholdEffects
