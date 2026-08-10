; Matching retail form; see src/game/game_phase_script_vm_lifecycle.c.
.text
.extern GamePhaseScriptVm_CopyState

    .global GamePhaseScriptVm_Assign
GamePhaseScriptVm_Assign: ; 0x0201264c
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r4, r1
    ldmeqia sp!, {r4, pc}
    bl GamePhaseScriptVm_CopyState
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size GamePhaseScriptVm_Assign, . - GamePhaseScriptVm_Assign

