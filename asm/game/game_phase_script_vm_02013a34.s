; Matching retail form; see src/game/game_phase_script_vm_actor_interaction_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_StoreResultAndUpdateCondition
.extern ActorCollection_FindActorByRuntimeId
.extern Actor_QueryRuntimeProperty
.extern Actor_GetOwningCollection

    .global GamePhaseActorScriptVm_QueryIndexedActorProperty
GamePhaseActorScriptVm_QueryIndexedActorProperty: ; 0x02013a34
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    mov r0, r6
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    ldr r0, [r6, #0x84]
    bl Actor_GetOwningCollection
    mov r1, r4
    bl ActorCollection_FindActorByRuntimeId
    mov r1, r5
    bl Actor_QueryRuntimeProperty
    mov r1, r0
    mov r0, r6
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
    .size GamePhaseActorScriptVm_QueryIndexedActorProperty, . - GamePhaseActorScriptVm_QueryIndexedActorProperty

