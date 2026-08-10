; Matching retail form; see src/game/game_phase_script_vm_lifecycle.c.
.text
.extern data_020d56b4
.extern GamePhaseScriptVm_Reset

    .global GamePhaseScriptVm_Init
GamePhaseScriptVm_Init: ; 0x02012564
    stmdb sp!, {r4, lr}
    ldr r1, L_02012580
    mov r4, r0
    str r1, [r4, #0x0]
    bl GamePhaseScriptVm_Reset
    mov r0, r4
    ldmia sp!, {r4, pc}
L_02012580: .word data_020d56b4
    .size GamePhaseScriptVm_Init, . - GamePhaseScriptVm_Init

