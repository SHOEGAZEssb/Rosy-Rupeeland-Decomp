; Matching retail form; see src/game/game_phase_script_vm_table_query_opcodes.c.
.text
.extern data_021e9ac0
.extern func_020127f8
.extern func_020636f0
.global func_0201616c
func_0201616c:
    stmdb sp!, {r4, lr}
    ldr r1, L_020161a8
    mov r4, r0
    ldr r0, [r1]
    bl func_020636f0
    cmp r0, #0
    mov r0, r4
    beq L_02016198
    mov r1, #1
    bl func_020127f8
    b L_020161a0
L_02016198:
    mov r1, #0
    bl func_020127f8
L_020161a0:
    mov r0, #0
    ldmia sp!, {r4, pc}
L_020161a8: .word data_021e9ac0
    .size func_0201616c, . - func_0201616c
