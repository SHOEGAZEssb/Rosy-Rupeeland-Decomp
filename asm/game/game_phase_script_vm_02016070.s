; Matching retail form; see src/game/game_phase_script_vm_u16_table_update_opcodes.c.
.text
.extern data_021e9ac0
.extern func_02012704
.extern func_0206370c
.global func_02016070
func_02016070:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl func_02012704
    mov r4, r0
    mov r0, r5
    bl func_02012704
    mov r1, r0, lsl #16
    ldr r3, L_020160ac
    mov r2, r4, lsl #16
    ldr r0, [r3]
    mov r1, r1, lsr #16
    mov r2, r2, lsr #16
    bl func_0206370c
    mov r0, #0
    ldmia sp!, {r3, r4, r5, pc}
L_020160ac: .word data_021e9ac0
    .size func_02016070, . - func_02016070
