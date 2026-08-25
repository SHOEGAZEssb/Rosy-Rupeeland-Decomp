; Matching retail form; see src/game/game_phase_script_vm_table_query_opcodes.c.
.text
.extern data_021e9ac0
.extern GamePhaseScriptVm_Pop
.extern func_02063820
.global GamePhaseActorScriptVm_DispatchInventoryTableValue
GamePhaseActorScriptVm_DispatchInventoryTableValue:
    stmdb sp!, {r3, lr}
    bl GamePhaseScriptVm_Pop
    mov r1, r0, lsl #16
    ldr r2, L_02016168
    mov r1, r1, lsr #16
    ldr r0, [r2]
    bl func_02063820
    mov r0, #0
    ldmia sp!, {r3, pc}
L_02016168: .word data_021e9ac0
    .size GamePhaseActorScriptVm_DispatchInventoryTableValue, . - GamePhaseActorScriptVm_DispatchInventoryTableValue
