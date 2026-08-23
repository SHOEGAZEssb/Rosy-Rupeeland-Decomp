; Matching retail form; see src/game/game_phase_script_vm_data_table_opcodes.c.
.text
.extern data_021f3d68
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_StoreResultAndUpdateCondition
.extern RuntimeRecordTable_FindByKey

    .global GamePhaseActorScriptVm_GetDataTableRecordByte
GamePhaseActorScriptVm_GetDataTableRecordByte: ; 0x0201593c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r5
    bl GamePhaseScriptVm_Pop
    mov r1, r0
    ldr r0, L_02015978
    bl RuntimeRecordTable_FindByKey
    add r0, r0, r4
    ldrb r1, [r0, #0xc]
    mov r0, r5
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_02015978: .word data_021f3d68
    .size GamePhaseActorScriptVm_GetDataTableRecordByte, . - GamePhaseActorScriptVm_GetDataTableRecordByte

