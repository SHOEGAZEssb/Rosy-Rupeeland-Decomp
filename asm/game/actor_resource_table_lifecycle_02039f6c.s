; Matching retail form; see src/game/actor_resource_table_lifecycle.c.
.text
.extern Heap_Alloc
.extern Heap_Free
.extern gActorFeedbackResourcePointerArrayAllocationTag
.extern gActorFeedbackAnimationResourceAllocationTag
.extern data_020e9fa0
.extern data_021052fc
.extern gActorInteractionResourceState
.extern AnimationResource_Init
.extern func_02028388
.extern gHeapContext

    .global ActorFeedbackResources_Load
    .type ActorFeedbackResources_Load, @function
ActorFeedbackResources_Load: ; 0x02039f6c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    ldr r0, .L_0203a038
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x24]
    ldr r0, [r0, #0x0]
    sub r0, r0, #0x1
    bl func_02028388
    ldr r0, [r0, #0x40]
    ldr r1, .L_0203a03c
    mov r0, r0, lsl #0x14
    mov r2, r0, asr #0x14
    mov r0, #0x78
    mla r5, r2, r0, r1
    ldr r4, .L_0203a040
    ldr r1, .L_0203a044
    ldr r3, .L_0203a048
    mov r0, #0x3c
    mov r2, #0x4
    str r5, [r4, #0x4]
    bl Heap_Alloc
    mov r7, #0x0
    str r0, [r4, #0x8]
    mov r11, #0x10
    mov r5, r7
.L_02039fcc:
    ldr r1, [r4, #0x4]
    mov r0, r7, lsl #0x3
    ldrsh r8, [r1, r0]
    add r0, r1, r7, lsl #0x3
    ldrsh r10, [r0, #0x4]
    cmp r8, #0x0
    ldrsh r9, [r0, #0x2]
    ldr r6, [r4, #0x8]
    beq .L_0203a024
    ldr r1, .L_0203a04c
    ldr r3, .L_0203a048
    mov r0, r11
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0203a01c
    mov r1, r8
    mov r2, r9
    mov r3, r10
    bl AnimationResource_Init
.L_0203a01c:
    str r0, [r6, r7, lsl #0x2]
    b .L_0203a028
.L_0203a024:
    str r5, [r6, r7, lsl #0x2]
.L_0203a028:
    add r7, r7, #0x1
    cmp r7, #0xf
    blt .L_02039fcc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0203a038: .word data_021052fc
.L_0203a03c: .word data_020e9fa0
.L_0203a040: .word gActorInteractionResourceState
.L_0203a044: .word gActorFeedbackResourcePointerArrayAllocationTag
.L_0203a048: .word gHeapContext
.L_0203a04c: .word gActorFeedbackAnimationResourceAllocationTag
    .size ActorFeedbackResources_Load, . - ActorFeedbackResources_Load

    .global ActorFeedbackResources_Unload
    .type ActorFeedbackResources_Unload, @function
ActorFeedbackResources_Unload: ; 0x0203a050
    stmdb sp!, {r3, r4, r5, lr}
    ldr r4, .L_0203a0b0
    mov r5, #0x0
    str r5, [r4, #0x4]
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
.L_0203a06c:
    ldr r0, [r4, #0x8]
    ldr r0, [r0, r5, lsl #0x2]
    cmp r0, #0x0
    beq .L_0203a088
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0203a088:
    add r5, r5, #0x1
    cmp r5, #0xf
    blt .L_0203a06c
    ldr r0, .L_0203a0b0
    ldr r0, [r0, #0x8]
    bl Heap_Free
    ldr r0, .L_0203a0b0
    mov r1, #0x0
    str r1, [r0, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_0203a0b0: .word gActorInteractionResourceState
    .size ActorFeedbackResources_Unload, . - ActorFeedbackResources_Unload

    .global ActorFeedbackResources_GetResource
    .type ActorFeedbackResources_GetResource, @function
ActorFeedbackResources_GetResource: ; 0x0203a0b4
    cmp r0, #0x0
    ldrne r1, .L_0203a0d0
    subne r0, r0, #0x1
    ldrne r1, [r1, #0x8]
    ldrne r0, [r1, r0, lsl #0x2]
    moveq r0, #0x0
    bx lr
.L_0203a0d0: .word gActorInteractionResourceState
    .size ActorFeedbackResources_GetResource, . - ActorFeedbackResources_GetResource

    .global ActorFeedbackResources_GetPackedSound
    .type ActorFeedbackResources_GetPackedSound, @function
ActorFeedbackResources_GetPackedSound: ; 0x0203a0d4
    ldr r1, .L_0203a0ec
    sub r0, r0, #0x1
    ldr r1, [r1, #0x4]
    add r0, r1, r0, lsl #0x3
    ldrh r0, [r0, #0x6]
    bx lr
.L_0203a0ec: .word gActorInteractionResourceState
    .size ActorFeedbackResources_GetPackedSound, . - ActorFeedbackResources_GetPackedSound
