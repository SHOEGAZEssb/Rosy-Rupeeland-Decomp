; Matching retail form; see src/game/game_phase_script_vm_table_query_opcodes.c.
.text
.extern data_021e9ac0
.extern func_02012704
.extern func_02063820
.global func_02016144
func_02016144:
    stmdb sp!, {r3, lr}
    bl func_02012704
    mov r1, r0, lsl #16
    ldr r2, L_02016168
    mov r1, r1, lsr #16
    ldr r0, [r2]
    bl func_02063820
    mov r0, #0
    ldmia sp!, {r3, pc}
L_02016168: .word data_021e9ac0
    .size func_02016144, . - func_02016144
