; Matching retail form; see src/game/game_phase_script_vm_gamework_flag_opcodes.c.
.text
.extern GameWork_TestFlag
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_SetResult
.extern gGameWork

    .global GamePhaseActorScriptVm_TestGameWorkFlag
GamePhaseActorScriptVm_TestGameWorkFlag: ; 0x02013cc4
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    ldr r2, L_02013cf4
    mov r1, r0
    ldr r0, [r2, #0x0]
    bl GameWork_TestFlag
    mov r1, r0
    mov r0, r4
    bl GamePhaseScriptVm_SetResult
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_02013cf4: .word gGameWork
    .size GamePhaseActorScriptVm_TestGameWorkFlag, . - GamePhaseActorScriptVm_TestGameWorkFlag

