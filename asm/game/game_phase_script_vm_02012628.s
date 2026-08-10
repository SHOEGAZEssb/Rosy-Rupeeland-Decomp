; Matching retail form; see src/game/game_phase_script_vm_lifecycle.c.
.text
.extern GamePhaseScriptVm_Reset

    .global GamePhaseScriptVm_ResetWithScript
GamePhaseScriptVm_ResetWithScript: ; 0x02012628
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl GamePhaseScriptVm_Reset
    str r5, [r6, #0x8]
    str r5, [r6, #0x4]
    str r4, [r6, #0x80]
    ldmia sp!, {r4, r5, r6, pc}
    .size GamePhaseScriptVm_ResetWithScript, . - GamePhaseScriptVm_ResetWithScript

