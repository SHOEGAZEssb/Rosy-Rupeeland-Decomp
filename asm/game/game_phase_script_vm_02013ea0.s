; Matching retail form; see src/game/game_phase_script_vm_actor_action_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop

    .global GamePhaseActorScriptVm_DiscardValue
GamePhaseActorScriptVm_DiscardValue: ; 0x02013ea0
    stmdb sp!, {r3, lr}
    bl GamePhaseScriptVm_Pop
    mov r0, #0x0
    ldmia sp!, {r3, pc}
    .size GamePhaseActorScriptVm_DiscardValue, . - GamePhaseActorScriptVm_DiscardValue

