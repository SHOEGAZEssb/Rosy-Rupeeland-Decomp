; Matching retail form; see src/game/game_phase_script_vm_indexed_global_query_opcode.c.
.text
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_SetResult
.extern func_02063698
.extern data_021e9ac0
.global GamePhaseActorScriptVm_QueryGlobalContextByIndex
GamePhaseActorScriptVm_QueryGlobalContextByIndex: ; 0x0201af88
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    mov r0, r0, lsl #0x10
    ldr r2, L_0201afbc
    mov r1, r0, lsr #0x10
    ldr r0, [r2, #0x0]
    bl func_02063698
    mov r1, r0
    mov r0, r4
    bl GamePhaseScriptVm_SetResult
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_0201afbc: .word data_021e9ac0
.size GamePhaseActorScriptVm_QueryGlobalContextByIndex, . - GamePhaseActorScriptVm_QueryGlobalContextByIndex
