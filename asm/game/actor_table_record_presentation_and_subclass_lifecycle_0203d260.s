; Matching retail form; see src/game/actor_table_record_presentation_and_subclass_lifecycle.c.
.text
.extern Heap_Free
.extern data_020df840
.extern gActorRegisteredSubclassCounters
.extern gActorRegisteredSubclassRegistry
.extern ActorDerivedRuntime_DestroyAlternate
.extern ActorTableRecord_Init
.extern GraphicsSpriteState_SetAnimationIndex
    .global ActorTableRecord_UpdatePresentationForState
    .type ActorTableRecord_UpdatePresentationForState, @function
ActorTableRecord_UpdatePresentationForState: ; 0x0203d260
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x20c]
    mov r0, r0, lsl #0x12
    movs r0, r0, asr #0x1f
    ldmeqia sp!, {r4, pc}
    ldrb r1, [r4, #0xd4]
    ldr r0, [r4, #0x54]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldmia sp!, {r4, pc}
    .size ActorTableRecord_UpdatePresentationForState, . - ActorTableRecord_UpdatePresentationForState

    .global ActorRegisteredSubclass_Init
    .type ActorRegisteredSubclass_Init, @function
ActorRegisteredSubclass_Init: ; 0x0203d2a8
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorTableRecord_Init
    ldr r1, .L_0203d30c
    add r0, r4, #0x200
    str r1, [r4, #0x0]
    mov r1, #0x0
    strh r1, [r0, #0x18]
    mov r1, #0x78
    strh r1, [r0, #0x1a]
    mov r0, #0x2
    strh r0, [r4, #0xd6]
    ldr r1, [r4, #0x14]
    mov r0, #0x1
    orr r1, r1, #0x6
    str r1, [r4, #0x14]
    str r0, [r4, #0x114]
    ldr r1, .L_0203d310
    mov r2, #0x18
    ldrsh r3, [r1, #0x2]
    mov r0, r4
    add r3, r3, #0x1
    strh r3, [r1, #0x2]
    str r2, [r4, #0x108]
    ldmia sp!, {r4, pc}
.L_0203d30c: .word data_020df840
.L_0203d310: .word gActorRegisteredSubclassCounters
    .size ActorRegisteredSubclass_Init, . - ActorRegisteredSubclass_Init

    .global ActorRegisteredSubclass_Destroy
    .type ActorRegisteredSubclass_Destroy, @function
ActorRegisteredSubclass_Destroy: ; 0x0203d314
    stmdb sp!, {r4, lr}
    mov r2, #0x0
    mov r4, r0
    ldr r0, .L_0203d35c
    mov r1, r2
    b .L_0203d338
.L_0203d32c:
    cmp r3, r4
    streq r1, [r0, r2, lsl #0x2]
    add r2, r2, #0x1
.L_0203d338:
    cmp r2, #0x4
    bge .L_0203d34c
    ldr r3, [r0, r2, lsl #0x2]
    cmp r3, #0x0
    bne .L_0203d32c
.L_0203d34c:
    mov r0, r4
    bl ActorDerivedRuntime_DestroyAlternate
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0203d35c: .word gActorRegisteredSubclassRegistry
    .size ActorRegisteredSubclass_Destroy, . - ActorRegisteredSubclass_Destroy

    .global ActorRegisteredSubclass_DestroyAndFree
    .type ActorRegisteredSubclass_DestroyAndFree, @function
ActorRegisteredSubclass_DestroyAndFree: ; 0x0203d360
    stmdb sp!, {r4, lr}
    mov r2, #0x0
    mov r4, r0
    ldr r0, .L_0203d3b0
    mov r1, r2
    b .L_0203d384
.L_0203d378:
    cmp r3, r4
    streq r1, [r0, r2, lsl #0x2]
    add r2, r2, #0x1
.L_0203d384:
    cmp r2, #0x4
    bge .L_0203d398
    ldr r3, [r0, r2, lsl #0x2]
    cmp r3, #0x0
    bne .L_0203d378
.L_0203d398:
    mov r0, r4
    bl ActorDerivedRuntime_DestroyAlternate
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0203d3b0: .word gActorRegisteredSubclassRegistry
    .size ActorRegisteredSubclass_DestroyAndFree, . - ActorRegisteredSubclass_DestroyAndFree


