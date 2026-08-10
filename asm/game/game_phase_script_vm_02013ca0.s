; Matching retail form; see src/game/game_phase_script_vm_gamework_flag_opcodes.c.
.text
.extern GameWork_ClearFlag
.extern GamePhaseScriptVm_Pop
.extern gGameWork

    .global GamePhaseActorScriptVm_ClearGameWorkFlag
GamePhaseActorScriptVm_ClearGameWorkFlag: ; 0x02013ca0
    stmdb sp!, {r3, lr}
    bl GamePhaseScriptVm_Pop
    ldr r2, L_02013cc0
    mov r1, r0
    ldr r0, [r2, #0x0]
    bl GameWork_ClearFlag
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_02013cc0: .word gGameWork
    .size GamePhaseActorScriptVm_ClearGameWorkFlag, . - GamePhaseActorScriptVm_ClearGameWorkFlag

