; Matching retail form; see src/game/game_phase_script_vm_global_state_query_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_SetResult
.extern GamePhaseMetadata_GetByIndex
.global GamePhaseActorScriptVm_GetOneBasedPhaseRecordByte4c
GamePhaseActorScriptVm_GetOneBasedPhaseRecordByte4c: ; 0x0201b070
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    sub r0, r0, #0x1
    bl GamePhaseMetadata_GetByIndex
    ldrsb r1, [r0, #0x4c]
    mov r0, r4
    bl GamePhaseScriptVm_SetResult
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size GamePhaseActorScriptVm_GetOneBasedPhaseRecordByte4c, . - GamePhaseActorScriptVm_GetOneBasedPhaseRecordByte4c
