; Matching retail form; see src/game/game_phase_script_vm_lifecycle.c.
.text
.extern gGamePhaseScriptVmVTable
.extern GamePhaseScriptVm_ResetWithScript

    .global GamePhaseScriptVm_InitWithScript
GamePhaseScriptVm_InitWithScript: ; 0x02012608
    stmdb sp!, {r4, lr}
    ldr r3, L_02012624
    mov r4, r0
    str r3, [r4, #0x0]
    bl GamePhaseScriptVm_ResetWithScript
    mov r0, r4
    ldmia sp!, {r4, pc}
L_02012624: .word gGamePhaseScriptVmVTable
    .size GamePhaseScriptVm_InitWithScript, . - GamePhaseScriptVm_InitWithScript
