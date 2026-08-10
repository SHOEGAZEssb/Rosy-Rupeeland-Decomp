; Matching retail form; see src/game/game_phase_script_vm_actor_runtime_display_opcodes.c.
.text
.global GamePhaseActorScriptVm_ReturnOne
GamePhaseActorScriptVm_ReturnOne:
    mov r0, #0x1
    bx lr
.size GamePhaseActorScriptVm_ReturnOne, . - GamePhaseActorScriptVm_ReturnOne
