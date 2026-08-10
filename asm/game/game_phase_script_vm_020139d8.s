; Matching retail form; see src/game/game_phase_script_vm_actor_interaction_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_SetResult
.extern Actor_QueryRuntimeProperty

    .global GamePhaseActorScriptVm_QueryActorProperty
GamePhaseActorScriptVm_QueryActorProperty: ; 0x020139d8
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    mov r1, r0
    ldr r0, [r4, #0x84]
    bl Actor_QueryRuntimeProperty
    mov r1, r0
    mov r0, r4
    bl GamePhaseScriptVm_SetResult
    mov r0, #0x0
    ldmia sp!, {r4, pc}
    .size GamePhaseActorScriptVm_QueryActorProperty, . - GamePhaseActorScriptVm_QueryActorProperty

