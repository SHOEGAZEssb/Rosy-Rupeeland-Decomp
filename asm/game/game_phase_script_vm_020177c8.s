; Matching retail form; see src/game/game_phase_script_vm_global_object_query_opcodes.c.
.text
.extern data_021f5128
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_SetResult
.extern func_0207a99c
.global func_020177c8
func_020177c8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r5
    bl GamePhaseScriptVm_Pop
    ldr r2, L_02017814
    mov r1, r0
    ldr r0, [r2]
    mov r2, r4
    mov r4, #0
    bl func_0207a99c
    cmp r0, #0
    movne r4, #1
    mov r0, r5
    mov r1, r4
    bl GamePhaseScriptVm_SetResult
    mov r0, #0
    ldmia sp!, {r3, r4, r5, pc}
L_02017814: .word data_021f5128
    .size func_020177c8, . - func_020177c8
