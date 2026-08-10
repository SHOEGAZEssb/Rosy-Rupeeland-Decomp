; Matching retail form; see src/game/game_phase_script_vm_actor_interaction_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_SetResult
.extern ActorCollection_FindActorByDescriptorValue
.extern Actor_QueryRuntimeProperty
.extern Actor_GetCollection

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
    bl Actor_GetCollection
    mov r1, r4
    bl ActorCollection_FindActorByDescriptorValue
    mov r1, r5
    bl Actor_QueryRuntimeProperty
    mov r1, r0
    mov r0, r6
    bl GamePhaseScriptVm_SetResult
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
    .size GamePhaseActorScriptVm_QueryIndexedActorProperty, . - GamePhaseActorScriptVm_QueryIndexedActorProperty

