; Matching retail form; see src/game/actor_interaction_runtime_lifecycle.c.
.text
.extern Heap_Alloc
.extern Heap_Free
.extern gInteractionRecordAllocatorPoolAllocationTag
.extern gActorInteractionResourceState
.extern gActorFeedbackPresentations
.extern gActorExtendedLinkSourceCount
.extern gActorExtendedLinkDestinationCount
.extern gActorExtendedType2ReentryAngleAccumulator
.extern gInteractionRecordAllocatorPool
.extern ActorTargetSelection_Reset
.extern ActorTargetSelection_ClearCandidates
.extern ActorDerivedType1_SetSingletonFieldE4To20E
.extern ActorFeedbackResources_Load
.extern ActorFeedbackResources_Unload
.extern ActorRegisteredSubclass_ResetRegistry
.extern ActorExtendedPairing_UpdateLinks
.extern InteractionTimingState_Reset
.extern InteractionRecordAllocatorPool_Init
.extern InteractionRecordAllocatorPool_DestroyContents
.extern Type7ActorRegistry_Populate
.extern Type7ActorRegistry_Clear
.extern GridEffectActorRegistry_LoadSharedResource
.extern GridEffectActorRegistry_UnloadSharedResource
.extern func_020534cc
.extern func_0205355c
.extern func_0205929c
.extern func_02059344
.extern gGameWork
.extern gHeapContext
.extern gSoundContext
    .global ActorInteractionRuntime_Init
    .type ActorInteractionRuntime_Init, @function
ActorInteractionRuntime_Init: ; 0x0203aac4
    stmdb sp!, {r3, lr}
    ldr r1, .L_0203ab50
    ldr r3, .L_0203ab54
    mov r0, #0x40
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0203aae8
    bl InteractionRecordAllocatorPool_Init
.L_0203aae8:
    ldr r1, .L_0203ab58
    str r0, [r1, #0x0]
    bl ActorFeedbackResources_Load
    ldr r0, .L_0203ab5c
    mov r3, #0x90
    mvn r2, #0x0
.L_0203ab00:
    ldr r1, [r0, #0x0]
    add r1, r1, r3, lsl #0x1
    add r3, r3, #0x1
    strh r2, [r1, #0x4c]
    cmp r3, #0x9b
    ble .L_0203ab00
    ldr r1, .L_0203ab60
    mov r2, #0x0
    ldr r0, .L_0203ab64
    strh r2, [r1, #0x0]
    strh r2, [r0, #0x0]
    bl ActorRegisteredSubclass_ResetRegistry
    mov r2, #0x0
    ldr r0, .L_0203ab68
    mov r1, r2
.L_0203ab3c:
    str r1, [r0, r2, lsl #0x2]
    add r2, r2, #0x1
    cmp r2, #0x6
    blt .L_0203ab3c
    ldmia sp!, {r3, pc}
.L_0203ab50: .word gInteractionRecordAllocatorPoolAllocationTag
.L_0203ab54: .word gHeapContext
.L_0203ab58: .word gInteractionRecordAllocatorPool
.L_0203ab5c: .word gGameWork
.L_0203ab60: .word gActorExtendedLinkDestinationCount
.L_0203ab64: .word gActorExtendedLinkSourceCount
.L_0203ab68: .word gActorFeedbackPresentations
    .size ActorInteractionRuntime_Init, . - ActorInteractionRuntime_Init

    .global ActorInteractionRuntime_Start
    .type ActorInteractionRuntime_Start, @function
ActorInteractionRuntime_Start: ; 0x0203ab6c
    stmdb sp!, {r3, lr}
    bl ActorTargetSelection_Reset
    ldr r1, .L_0203aba4
    mov r2, #0x0
    ldr r0, .L_0203aba8
    strh r2, [r1, #0x0]
    strh r2, [r0, #0x0]
    bl ActorExtendedPairing_UpdateLinks
    bl InteractionTimingState_Reset
    bl Type7ActorRegistry_Populate
    bl GridEffectActorRegistry_LoadSharedResource
    bl func_020534cc
    bl ActorDerivedType1_SetSingletonFieldE4To20E
    ldmia sp!, {r3, pc}
.L_0203aba4: .word gActorExtendedType2ReentryAngleAccumulator
.L_0203aba8: .word gActorInteractionResourceState
    .size ActorInteractionRuntime_Start, . - ActorInteractionRuntime_Start

    .global ActorInteractionRuntime_NoOp
    .type ActorInteractionRuntime_NoOp, @function
ActorInteractionRuntime_NoOp: ; 0x0203abac
    bx lr
    .size ActorInteractionRuntime_NoOp, . - ActorInteractionRuntime_NoOp

    .global ActorFeedback_DestroyPresentations
    .type ActorFeedback_DestroyPresentations, @function
ActorFeedback_DestroyPresentations: ; 0x0203abb0
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, #0x0
    ldr r5, .L_0203abf0
    mov r4, r6
.L_0203abc0:
    ldr r0, [r5, r6, lsl #0x2]
    cmp r0, #0x0
    beq .L_0203abe0
    beq .L_0203abdc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0203abdc:
    str r4, [r5, r6, lsl #0x2]
.L_0203abe0:
    add r6, r6, #0x1
    cmp r6, #0x6
    blt .L_0203abc0
    ldmia sp!, {r4, r5, r6, pc}
.L_0203abf0: .word gActorFeedbackPresentations
    .size ActorFeedback_DestroyPresentations, . - ActorFeedback_DestroyPresentations

    .global ActorInteractionRuntime_Shutdown
    .type ActorInteractionRuntime_Shutdown, @function
ActorInteractionRuntime_Shutdown: ; 0x0203abf4
    stmdb sp!, {r4, lr}
    ldr r0, .L_0203ac94
    mov r1, #0x1f
    ldr r0, [r0, #0x0]
    bl func_02059344
    cmp r0, #0x0
    beq .L_0203ac24
    ldr r0, .L_0203ac94
    mov r1, #0x1f
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl func_0205929c
.L_0203ac24:
    ldr r0, .L_0203ac94
    mov r1, #0x20
    ldr r0, [r0, #0x0]
    bl func_02059344
    cmp r0, #0x0
    beq .L_0203ac50
    ldr r0, .L_0203ac94
    mov r1, #0x20
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl func_0205929c
.L_0203ac50:
    bl func_0205355c
    bl GridEffectActorRegistry_UnloadSharedResource
    bl Type7ActorRegistry_Clear
    ldr r0, .L_0203ac98
    ldr r4, [r0, #0x0]
    cmp r4, #0x0
    beq .L_0203ac7c
    mov r0, r4
    bl InteractionRecordAllocatorPool_DestroyContents
    mov r0, r4
    bl Heap_Free
.L_0203ac7c:
    ldr r0, .L_0203ac98
    mov r1, #0x0
    str r1, [r0, #0x0]
    bl ActorTargetSelection_ClearCandidates
    bl ActorFeedbackResources_Unload
    ldmia sp!, {r4, pc}
.L_0203ac94: .word gSoundContext
.L_0203ac98: .word gInteractionRecordAllocatorPool
    .size ActorInteractionRuntime_Shutdown, . - ActorInteractionRuntime_Shutdown

