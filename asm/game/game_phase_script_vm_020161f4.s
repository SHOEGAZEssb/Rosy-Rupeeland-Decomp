; Matching retail form; see src/game/game_phase_script_vm_table_query_opcodes.c.
.text
.extern data_021e9e00
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_StoreResultAndUpdateCondition
.extern func_0206f9d4
.global func_020161f4
func_020161f4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    mov r1, r0
    ldr r0, L_02016234
    bl func_0206f9d4
    cmp r0, #0
    mov r0, r4
    beq L_02016224
    mov r1, #1
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    b L_0201622c
L_02016224:
    mov r1, #0
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
L_0201622c:
    mov r0, #0
    ldmia sp!, {r4, pc}
L_02016234: .word data_021e9e00
    .size func_020161f4, . - func_020161f4
