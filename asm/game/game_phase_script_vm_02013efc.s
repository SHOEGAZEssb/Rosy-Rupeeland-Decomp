; Matching retail form; see src/game/game_phase_script_vm_effect_state_opcodes.c.
.text

    .global GamePhaseActorScriptVm_ClearFlag2
GamePhaseActorScriptVm_ClearFlag2: ; 0x02013efc
    ldr r1, [r0, #0x8c]
    bic r1, r1, #0x2
    str r1, [r0, #0x8c]
    mov r0, #0x0
    bx lr
    .size GamePhaseActorScriptVm_ClearFlag2, . - GamePhaseActorScriptVm_ClearFlag2

