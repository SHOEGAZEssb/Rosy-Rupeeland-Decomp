; Matching retail form; see src/game/game_phase_script_vm_runtime_control_opcodes.c.
.text
.global GamePhaseActorScriptVm_RuntimeControlNoOp
GamePhaseActorScriptVm_RuntimeControlNoOp:
    mov r0, #0
    bx lr
    .size GamePhaseActorScriptVm_RuntimeControlNoOp, . - GamePhaseActorScriptVm_RuntimeControlNoOp
