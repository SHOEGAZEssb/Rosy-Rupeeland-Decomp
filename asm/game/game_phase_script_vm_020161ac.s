; Matching retail form; see src/game/game_phase_script_vm_table_query_opcodes.c.
.text
.extern data_021e9ac0
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_StoreResultAndUpdateCondition
.extern InventoryManager_ContainsId
.global func_020161ac
func_020161ac:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    ldr r2, L_020161f0
    mov r1, r0
    ldr r0, [r2]
    bl InventoryManager_ContainsId
    cmp r0, #0
    mov r0, r4
    beq L_020161e0
    mov r1, #1
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    b L_020161e8
L_020161e0:
    mov r1, #0
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
L_020161e8:
    mov r0, #0
    ldmia sp!, {r4, pc}
L_020161f0: .word data_021e9ac0
    .size func_020161ac, . - func_020161ac
