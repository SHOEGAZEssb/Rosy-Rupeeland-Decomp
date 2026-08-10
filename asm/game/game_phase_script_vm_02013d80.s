; Matching retail form; see src/game/game_phase_script_vm_actor_local_state_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_SetResult

    .global func_02013d80
func_02013d80: ; 0x02013d80
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r5
    bl GamePhaseScriptVm_Pop
    mov r1, #0x1
    and r1, r0, r1, lsl r4
    mov r0, r5
    bl GamePhaseScriptVm_SetResult
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
    .size func_02013d80, . - func_02013d80

