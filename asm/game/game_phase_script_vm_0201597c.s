; Matching retail form; see src/game/game_phase_script_vm_data_table_opcodes.c.
.text
.extern data_021f3d68
.extern func_02012704
.extern func_020127f8
.extern func_02079ba4

    .global func_0201597c
func_0201597c: ; 0x0201597c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02012704
    mov r1, r0
    ldr r0, L_020159b0
    bl func_02079ba4
    cmp r0, #0x0
    movne r1, #0x1
    moveq r1, #0x0
    mov r0, r4
    bl func_020127f8
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_020159b0: .word data_021f3d68
    .size func_0201597c, . - func_0201597c

