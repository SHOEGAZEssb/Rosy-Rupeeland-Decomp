; Matching retail form; see src/game/game_phase_progress_controller.c.
.text
.extern GameWork_SetFlag
.extern GameWork_TestFlag
.extern data_020d3a59
.extern gActorRuntimeCollection
.extern ActorRuntimeCollection_QueueValue
.extern ActorRuntimeCollection_GetBusyState
.extern gGameWork

    .global GamePhaseProgressController_QueuePresentationMode
    .type GamePhaseProgressController_QueuePresentationMode, @function
GamePhaseProgressController_QueuePresentationMode: ; 0x02027788
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x8]
    mov r4, r1
    cmp r0, #0x0
    beq .L_02027800
    ldr r0, .L_02027808
    bl ActorRuntimeCollection_GetBusyState
    cmp r0, #0x0
    bne .L_02027800
    cmp r4, #0x3
    bne .L_020277dc
    ldr r0, .L_0202780c
    ldr r1, .L_02027810
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne .L_020277dc
    ldr r0, .L_0202780c
    ldr r1, .L_02027810
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
.L_020277dc:
    ldr r1, .L_0202780c
    ldr r0, .L_02027808
    ldr r2, [r1, #0x0]
    ldr r1, .L_02027814
    add r2, r2, #0x100
    strh r4, [r2, #0xe2]
    bl ActorRuntimeCollection_QueueValue
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_02027800:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_02027808: .word gActorRuntimeCollection
.L_0202780c: .word gGameWork
.L_02027810: .word 0x401
.L_02027814: .word data_020d3a59
    .size GamePhaseProgressController_QueuePresentationMode, . - GamePhaseProgressController_QueuePresentationMode

