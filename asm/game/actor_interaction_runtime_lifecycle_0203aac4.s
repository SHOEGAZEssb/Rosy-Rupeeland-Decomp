; Matching retail form; see src/game/actor_interaction_runtime_lifecycle.c.
.text
.extern Heap_Alloc
.extern Heap_Free
.extern data_020df4f8
.extern data_021056e4
.extern gActorFeedbackPresentations
.extern data_02105728
.extern data_0210572a
.extern data_02105774
.extern data_02105778
.extern func_02034e58
.extern func_02034ea8
.extern func_02039e80
.extern func_02039f6c
.extern func_0203a050
.extern func_0203d910
.extern func_02043c24
.extern func_02045004
.extern func_020451b8
.extern func_020451d4
.extern func_020454f8
.extern func_02045598
.extern func_0204fafc
.extern func_0204fb2c
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
    bl func_020451b8
.L_0203aae8:
    ldr r1, .L_0203ab58
    str r0, [r1, #0x0]
    bl func_02039f6c
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
    bl func_0203d910
    mov r2, #0x0
    ldr r0, .L_0203ab68
    mov r1, r2
.L_0203ab3c:
    str r1, [r0, r2, lsl #0x2]
    add r2, r2, #0x1
    cmp r2, #0x6
    blt .L_0203ab3c
    ldmia sp!, {r3, pc}
.L_0203ab50: .word data_020df4f8
.L_0203ab54: .word gHeapContext
.L_0203ab58: .word data_02105778
.L_0203ab5c: .word gGameWork
.L_0203ab60: .word data_0210572a
.L_0203ab64: .word data_02105728
.L_0203ab68: .word gActorFeedbackPresentations
    .size ActorInteractionRuntime_Init, . - ActorInteractionRuntime_Init

    .global ActorInteractionRuntime_Start
    .type ActorInteractionRuntime_Start, @function
ActorInteractionRuntime_Start: ; 0x0203ab6c
    stmdb sp!, {r3, lr}
    bl func_02034e58
    ldr r1, .L_0203aba4
    mov r2, #0x0
    ldr r0, .L_0203aba8
    strh r2, [r1, #0x0]
    strh r2, [r0, #0x0]
    bl func_02043c24
    bl func_02045004
    bl func_020454f8
    bl func_0204fafc
    bl func_020534cc
    bl func_02039e80
    ldmia sp!, {r3, pc}
.L_0203aba4: .word data_02105774
.L_0203aba8: .word data_021056e4
    .size ActorInteractionRuntime_Start, . - ActorInteractionRuntime_Start

    .global func_0203abac
    .type func_0203abac, @function
func_0203abac: ; 0x0203abac
    bx lr
    .size func_0203abac, . - func_0203abac

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
    bl func_0204fb2c
    bl func_02045598
    ldr r0, .L_0203ac98
    ldr r4, [r0, #0x0]
    cmp r4, #0x0
    beq .L_0203ac7c
    mov r0, r4
    bl func_020451d4
    mov r0, r4
    bl Heap_Free
.L_0203ac7c:
    ldr r0, .L_0203ac98
    mov r1, #0x0
    str r1, [r0, #0x0]
    bl func_02034ea8
    bl func_0203a050
    ldmia sp!, {r4, pc}
.L_0203ac94: .word gSoundContext
.L_0203ac98: .word data_02105778
    .size ActorInteractionRuntime_Shutdown, . - ActorInteractionRuntime_Shutdown

