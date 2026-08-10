; Matching retail form; see src/game/game_phase_script_vm_u16_table_update_opcodes.c.
.text
.extern data_021e9ac0
.extern GamePhaseScriptVm_Pop
.extern func_02063724
.global func_020160b0
func_020160b0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r5
    bl GamePhaseScriptVm_Pop
    mov r1, r0, lsl #16
    ldr r3, L_020160ec
    mov r2, r4, lsl #16
    ldr r0, [r3]
    mov r1, r1, lsr #16
    mov r2, r2, lsr #16
    bl func_02063724
    mov r0, #0
    ldmia sp!, {r3, r4, r5, pc}
L_020160ec: .word data_021e9ac0
    .size func_020160b0, . - func_020160b0
