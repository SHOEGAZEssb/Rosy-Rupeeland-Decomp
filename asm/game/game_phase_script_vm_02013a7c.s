; Matching retail form; see src/game/game_phase_script_vm_actor_interaction_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern ActorCollection_FindActorByDescriptorValue
.extern Actor_SetRuntimeProperty
.extern Actor_GetCollection

    .global GamePhaseActorScriptVm_SetIndexedActorProperty
GamePhaseActorScriptVm_SetIndexedActorProperty: ; 0x02013a7c
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    bl GamePhaseScriptVm_Pop
    mov r6, r0
    mov r0, r7
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    mov r0, r7
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    ldr r0, [r7, #0x84]
    bl Actor_GetCollection
    mov r1, r4
    bl ActorCollection_FindActorByDescriptorValue
    mov r1, r5
    mov r2, r6
    bl Actor_SetRuntimeProperty
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    .size GamePhaseActorScriptVm_SetIndexedActorProperty, . - GamePhaseActorScriptVm_SetIndexedActorProperty

