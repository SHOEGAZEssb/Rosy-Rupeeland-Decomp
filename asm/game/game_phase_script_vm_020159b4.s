; Matching retail form; see src/game/game_phase_script_vm_data_table_opcodes.c.
.text
.extern data_021f3d68
.extern GamePhaseScriptVm_Pop
.extern RuntimeRecordTable_ActivateByKey

    .global GamePhaseActorScriptVm_UpdateDataTableValue
GamePhaseActorScriptVm_UpdateDataTableValue: ; 0x020159b4
    stmdb sp!, {r3, lr}
    bl GamePhaseScriptVm_Pop
    mov r1, r0
    ldr r0, L_020159d0
    bl RuntimeRecordTable_ActivateByKey
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_020159d0: .word data_021f3d68
    .size GamePhaseActorScriptVm_UpdateDataTableValue, . - GamePhaseActorScriptVm_UpdateDataTableValue

