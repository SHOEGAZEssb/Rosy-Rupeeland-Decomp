; Matching retail form; see src/game/actor_registered_subclass_presentation_helpers.c.
.text
.extern Heap_Alloc
.extern data_020df9d8
.extern data_021052fc
.extern func_02009d78
.extern func_0201f864
.extern func_02050078
.extern func_020593ac
.extern func_02072b68
.extern func_020adae4
.extern func_020be328
.extern func_020be334
.extern gHeapContext
.extern gSoundContext
    .global ActorRegisteredSubclass_EmitImpactFeedback
    .type ActorRegisteredSubclass_EmitImpactFeedback, @function
ActorRegisteredSubclass_EmitImpactFeedback: ; 0x0203d6e0
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x18
    mov r5, r0
    ldr r0, [r5, #0x44]
    bl func_020be334
    mov r4, r0
    cmp r4, #0x1000
    ble .L_0203d7e8
    ldr r0, .L_0203d7f0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl func_02009d78
    ldr r1, [r0, #0x4]
    ldr r2, [r5, #0x1c]
    mvn r0, #0x7f
    sub r1, r2, r1
    sub r1, r1, #0x80000
    mov r6, r1, asr #0xc
    cmp r0, r1, asr #0xc
    movgt r6, r0
    bgt .L_0203d740
    cmp r6, #0x7f
    movgt r6, #0x7f
.L_0203d740:
    mov r0, r6
    bl func_020be328
    mov r1, #0x3
    bl func_020adae4
    rsb r3, r0, r4, asr #0x7
    cmp r3, #0x7f
    movgt r3, #0x7f
    bgt .L_0203d768
    cmp r3, #0x0
    movlt r3, #0x0
.L_0203d768:
    str r6, [sp, #0x0]
    mov r1, #0x0
    ldr r0, .L_0203d7f4
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r1, #0x1c4
    mov r2, #0x7
    bl func_020593ac
    ldr r1, .L_0203d7f8
    ldr r3, .L_0203d7fc
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0203d7e8
    ldr r3, .L_0203d800
    mov r1, #0x0
    str r3, [sp, #0x0]
    add r2, r3, #0x1
    str r2, [sp, #0x4]
    str r1, [sp, #0x8]
    mov r1, #0x80
    str r1, [sp, #0xc]
    mov r1, #0x2
    str r1, [sp, #0x10]
    mov r1, #0x1
    str r1, [sp, #0x14]
    ldr r2, [r5, #0x54]
    add r1, r5, #0x18
    ldr r2, [r2, #0x0]
    sub r3, r3, #0x1
    bl func_0201f864
.L_0203d7e8:
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, pc}
.L_0203d7f0: .word data_021052fc
.L_0203d7f4: .word gSoundContext
.L_0203d7f8: .word data_020df9d8
.L_0203d7fc: .word gHeapContext
.L_0203d800: .word 0x162c
    .size ActorRegisteredSubclass_EmitImpactFeedback, . - ActorRegisteredSubclass_EmitImpactFeedback

    .global ActorRegisteredSubclass_UpdatePresentationState
    .type ActorRegisteredSubclass_UpdatePresentationState, @function
ActorRegisteredSubclass_UpdatePresentationState: ; 0x0203d804
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrsh r0, [r4, #0xd6]
    cmp r0, #0x0
    cmpne r0, #0x1
    beq .L_0203d834
    cmp r0, #0x2
    ldreq r1, [r4, #0x54]
    ldreqh r0, [r1, #0x24]
    orreq r0, r0, #0x10
    streqh r0, [r1, #0x24]
    ldmia sp!, {r4, pc}
.L_0203d834:
    cmp r0, #0x0
    movne r1, #0x1
    ldr r0, [r4, #0x54]
    moveq r1, #0x0
    bl func_02072b68
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x11
    strh r0, [r1, #0x24]
    ldmia sp!, {r4, pc}
    .size ActorRegisteredSubclass_UpdatePresentationState, . - ActorRegisteredSubclass_UpdatePresentationState

    .global ActorRegisteredSubclass_EnterState2
    .type ActorRegisteredSubclass_EnterState2, @function
ActorRegisteredSubclass_EnterState2: ; 0x0203d86c
    stmdb sp!, {r3, lr}
    mov r1, #0x2
    strh r1, [r0, #0xd6]
    ldr r2, [r0, #0x14]
    mov r1, #0x1
    orr r2, r2, #0x6
    str r2, [r0, #0x14]
    str r1, [r0, #0x114]
    ldr ip, [r0, #0x54]
    add r1, r0, #0x18
    ldrh r3, [ip, #0x24]
    mov r2, r1
    mov r0, #0x1c
    orr r3, r3, #0x10
    strh r3, [ip, #0x24]
    bl func_02050078
    ldr r1, [r0, #0x10]
    orr r1, r1, #0x100
    str r1, [r0, #0x10]
    ldmia sp!, {r3, pc}
    .size ActorRegisteredSubclass_EnterState2, . - ActorRegisteredSubclass_EnterState2
