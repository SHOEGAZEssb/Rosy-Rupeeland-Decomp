; Matching retail form; see src/game/game_phase_script_vm_u16_table_update_opcodes.c.
.text
.extern data_021e9ac0
.extern GamePhaseScriptVm_Pop
.extern func_020638b0
.global GamePhaseActorScriptVm_DispatchInventoryTableTriple
GamePhaseActorScriptVm_DispatchInventoryTableTriple:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    mov r0, r6
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r6
    bl GamePhaseScriptVm_Pop
    mov r1, r4, lsl #16
    mov r2, r1, lsr #16
    mov r1, r5, lsl #16
    mov r0, r0, lsl #16
    mov r3, r1, lsr #16
    mov r1, r0, lsr #16
    ldr r0, L_02016140
    ldr r0, [r0]
    bl func_020638b0
    mov r0, #0
    ldmia sp!, {r4, r5, r6, pc}
L_02016140: .word data_021e9ac0
    .size GamePhaseActorScriptVm_DispatchInventoryTableTriple, . - GamePhaseActorScriptVm_DispatchInventoryTableTriple
