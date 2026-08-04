; Matching retail form; see src/game/game_phase_script_vm_table_query_opcodes.c.
.text
.extern data_021e9ac0
.extern func_02012704
.extern func_020127f8
.extern func_020636ac
.global func_020161ac
func_020161ac:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02012704
    ldr r2, L_020161f0
    mov r1, r0
    ldr r0, [r2]
    bl func_020636ac
    cmp r0, #0
    mov r0, r4
    beq L_020161e0
    mov r1, #1
    bl func_020127f8
    b L_020161e8
L_020161e0:
    mov r1, #0
    bl func_020127f8
L_020161e8:
    mov r0, #0
    ldmia sp!, {r4, pc}
L_020161f0: .word data_021e9ac0
    .size func_020161ac, . - func_020161ac
