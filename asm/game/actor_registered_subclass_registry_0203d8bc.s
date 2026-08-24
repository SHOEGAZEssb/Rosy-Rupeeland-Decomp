; Matching retail form; see src/game/actor_registered_subclass_registry.c.
.text
.extern gGamePhaseRuntime
.extern gActorRegisteredSubclassCounters
.extern gActorRegisteredSubclassRegistry
.extern func_02007868
.extern ActorTableRecord_ApplyCollisionResponse
.extern ActorRegisteredSubclass_TriggerPrimaryInteraction
.extern ActorRegisteredSubclass_StartTimedState
    .global ActorRegisteredSubclass_ApplyCollisionAndStartTimedState
    .type ActorRegisteredSubclass_ApplyCollisionAndStartTimedState, @function
ActorRegisteredSubclass_ApplyCollisionAndStartTimedState: ; 0x0203d8bc
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr ip, [r4, #0x14]
    mov r3, r2
    tst ip, #0x2
    ldmneia sp!, {r4, pc}
    mov r2, #0x0
    bl ActorTableRecord_ApplyCollisionResponse
    ldr r0, .L_0203d90c
    mov r1, #0x6
    ldrsh r2, [r0, #0x0]
    mov r0, r4
    smulbb r1, r2, r1
    add r1, r1, #0x10
    bl ActorRegisteredSubclass_StartTimedState
    ldr r0, .L_0203d90c
    ldrsh r1, [r0, #0x0]
    add r1, r1, #0x1
    strh r1, [r0, #0x0]
    ldmia sp!, {r4, pc}
.L_0203d90c: .word gActorRegisteredSubclassCounters
    .size ActorRegisteredSubclass_ApplyCollisionAndStartTimedState, . - ActorRegisteredSubclass_ApplyCollisionAndStartTimedState

    .global ActorRegisteredSubclass_ResetRegistry
    .type ActorRegisteredSubclass_ResetRegistry, @function
ActorRegisteredSubclass_ResetRegistry: ; 0x0203d910
    mov r2, #0x0
    ldr r0, .L_0203d93c
    mov r1, r2
.L_0203d91c:
    str r1, [r0, r2, lsl #0x2]
    add r2, r2, #0x1
    cmp r2, #0x4
    blt .L_0203d91c
    ldr r0, .L_0203d940
    strh r1, [r0, #0x2]
    strh r1, [r0, #0x0]
    bx lr
.L_0203d93c: .word gActorRegisteredSubclassRegistry
.L_0203d940: .word gActorRegisteredSubclassCounters
    .size ActorRegisteredSubclass_ResetRegistry, . - ActorRegisteredSubclass_ResetRegistry

    .global ActorRegisteredSubclass_ProcessRegistry
    .type ActorRegisteredSubclass_ProcessRegistry, @function
ActorRegisteredSubclass_ProcessRegistry: ; 0x0203d944
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, .L_0203da14
    ldrsh r0, [r0, #0x2]
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, .L_0203da18
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r4, [r0, #0xea4]
    mov r0, r4
    bl func_02007868
    cmp r0, #0x0
    beq .L_0203da04
    mov r0, #0x0
    mov r6, r0
    mvn lr, #0x80000000
    ldr r2, .L_0203da1c
    mov r3, r0
    mov r1, r0
    b .L_0203d9b4
.L_0203d994:
    ldr ip, [r5, #0x54]
    ldrh ip, [ip, #0x28]
    cmp ip, lr
    strlt r3, [r2, r6, lsl #0x2]
    str r1, [r2, r6, lsl #0x2]
    movlt lr, ip
    movlt r0, r5
    add r6, r6, #0x1
.L_0203d9b4:
    cmp r6, #0x4
    bge .L_0203d9c8
    ldr r5, [r2, r6, lsl #0x2]
    cmp r5, #0x0
    bne .L_0203d994
.L_0203d9c8:
    cmp r0, #0x0
    beq .L_0203da04
    ldr r1, [r0, #0x20]
    ldr r2, [r4, #0x20]
    mov r1, r1, asr #0xc
    rsb r2, r1, r2, asr #0xc
    mul r1, r2, r2
    ldr r2, [r0, #0x1c]
    ldr r3, [r4, #0x1c]
    mov r2, r2, asr #0xc
    rsb r2, r2, r3, asr #0xc
    mla r1, r2, r2, r1
    cmp r1, #0x640
    bge .L_0203da04
    bl ActorRegisteredSubclass_TriggerPrimaryInteraction
.L_0203da04:
    ldr r0, .L_0203da14
    mov r1, #0x0
    strh r1, [r0, #0x0]
    ldmia sp!, {r4, r5, r6, pc}
.L_0203da14: .word gActorRegisteredSubclassCounters
.L_0203da18: .word gGamePhaseRuntime
.L_0203da1c: .word gActorRegisteredSubclassRegistry
    .size ActorRegisteredSubclass_ProcessRegistry, . - ActorRegisteredSubclass_ProcessRegistry

    .global ActorRegisteredSubclass_AlwaysTrue
    .type ActorRegisteredSubclass_AlwaysTrue, @function
ActorRegisteredSubclass_AlwaysTrue: ; 0x0203da20
    mov r0, #0x1
    bx lr
    .size ActorRegisteredSubclass_AlwaysTrue, . - ActorRegisteredSubclass_AlwaysTrue
