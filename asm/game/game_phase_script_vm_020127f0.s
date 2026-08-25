; Matching retail form; see src/game/game_phase_script_vm_runtime.c.
.text

    .global GamePhaseScriptVm_NoOpHook
GamePhaseScriptVm_NoOpHook: ; 0x020127f0
    mov r0, #0x0
    bx lr
    .size GamePhaseScriptVm_NoOpHook, . - GamePhaseScriptVm_NoOpHook
