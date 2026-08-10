; Matching retail form; see src/game/game_phase_script_vm_actor_interaction_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern Actor_SetRuntimeProperty

    .global GamePhaseActorScriptVm_SetActorProperty
GamePhaseActorScriptVm_SetActorProperty: ; 0x02013a04
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r5
    bl GamePhaseScriptVm_Pop
    mov r1, r0
    ldr r0, [r5, #0x84]
    mov r2, r4
    bl Actor_SetRuntimeProperty
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
    .size GamePhaseActorScriptVm_SetActorProperty, . - GamePhaseActorScriptVm_SetActorProperty

