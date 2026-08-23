; Matching retail form; see src/game/actor_derived_type1_resource_init.c.
.text
.extern GameWork_TestFlag
.extern Heap_Alloc
.extern data_020c3d90
.extern data_020df48c
.extern AnimationResource_Init
.extern ActorCollection_GetSpriteOwner
.extern Actor_CreateSecondaryRenderAttachment
.extern Actor_GetCollection
.extern Actor_InitializeFromDescriptor
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_CreateState
.extern gGameWork
.extern gHeapContext

    .global ActorDerivedType1_InitializeResources
    .type ActorDerivedType1_InitializeResources, @function
ActorDerivedType1_InitializeResources: ; 0x020353a0
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x70
    ldr r6, .L_020354d0
    add r5, sp, #0x4
    mov r10, r0
    mov r9, r1
    mov r4, #0x6
.L_020353bc:
    ldmia r6!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    subs r4, r4, #0x1
    bne .L_020353bc
    ldmia r6, {r0, r1, r2}
    stmia r5, {r0, r1, r2}
    ldr r5, .L_020354d4
    mov r7, #0x0
    add r4, sp, #0x4
    mov r6, #0x10
    mov r11, #0x4
.L_020353e8:
    ldr r3, .L_020354d8
    mov r0, r6
    mov r1, r5
    mov r2, r11
    add r8, r7, r7, lsl #0x1
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02035418
    ldr r1, [r4, r8, lsl #0x2]
    add r3, r4, r8, lsl #0x2
    ldmib r3, {r2, r3}
    bl AnimationResource_Init
.L_02035418:
    add r1, r10, r7, lsl #0x2
    add r7, r7, #0x1
    str r0, [r1, #0x208]
    cmp r7, #0x9
    blt .L_020353e8
    ldr r0, .L_020354dc
    ldr r1, .L_020354e0
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_02035478
    ldr r1, .L_020354d4
    ldr r3, .L_020354d8
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02035470
    ldr r1, .L_020354e4
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl AnimationResource_Init
.L_02035470:
    str r0, [r10, #0x22c]
    b .L_02035480
.L_02035478:
    mov r0, #0x0
    str r0, [r10, #0x22c]
.L_02035480:
    mov r0, r10
    ldr r4, [r10, #0x208]
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    mov r1, #0x2
    str r1, [sp, #0x0]
    ldmib r4, {r1, r2, r3}
    bl GraphicsSpriteGroup_CreateState
    str r0, [r10, #0x54]
    mov r1, #0x0
    bl GraphicsSpriteState_SetAnimationIndex
    ldrb r2, [r9, #0x10]
    ldr r1, [r10, #0x208]
    mov r0, r10
    bl Actor_CreateSecondaryRenderAttachment
    mov r0, r10
    mov r1, r9
    bl Actor_InitializeFromDescriptor
    add sp, sp, #0x70
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_020354d0: .word data_020c3d90
.L_020354d4: .word data_020df48c
.L_020354d8: .word gHeapContext
.L_020354dc: .word gGameWork
.L_020354e0: .word 0x25d
.L_020354e4: .word 0x1046
    .size ActorDerivedType1_InitializeResources, . - ActorDerivedType1_InitializeResources

    .global ActorDerivedType1_ApplyResourceIndex
