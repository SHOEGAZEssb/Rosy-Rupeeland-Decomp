; Matching retail form; see src/game/game_phase_script_vm_actor_interaction_opcodes.c.
.text

    .global GamePhaseActorScriptVm_NoOp
GamePhaseActorScriptVm_NoOp: ; 0x020139d0
    mov r0, #0x0
    bx lr
    .size GamePhaseActorScriptVm_NoOp, . - GamePhaseActorScriptVm_NoOp

