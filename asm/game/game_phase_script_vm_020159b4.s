; Matching retail form; see src/game/game_phase_script_vm_data_table_opcodes.c.
.text
.extern data_021f3d68
.extern func_02012704
.extern func_02079ac0

    .global func_020159b4
func_020159b4: ; 0x020159b4
    stmdb sp!, {r3, lr}
    bl func_02012704
    mov r1, r0
    ldr r0, L_020159d0
    bl func_02079ac0
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_020159d0: .word data_021f3d68
    .size func_020159b4, . - func_020159b4

