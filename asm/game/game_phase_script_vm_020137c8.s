; Matching retail form; see src/game/game_phase_script_vm_actor_flag_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_SetResult
.extern func_020adc40

    .global GamePhaseActorScriptVm_ComputeFixedPointRoot
GamePhaseActorScriptVm_ComputeFixedPointRoot: ; 0x020137c8
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    bl func_020adc40
    mov r1, r0
    mov r0, r4
    bl GamePhaseScriptVm_SetResult
    mov r0, #0x0
    ldmia sp!, {r4, pc}
    .size GamePhaseActorScriptVm_ComputeFixedPointRoot, . - GamePhaseActorScriptVm_ComputeFixedPointRoot

