; Matching retail form; see src/game/game_phase_script_vm_gamework_flag_opcodes.c.
.text
.extern GameWork_TestFlag
.extern func_02012704
.extern func_020127f8
.extern gGameWork

    .global func_02013cc4
func_02013cc4: ; 0x02013cc4
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02012704
    ldr r2, L_02013cf4
    mov r1, r0
    ldr r0, [r2, #0x0]
    bl GameWork_TestFlag
    mov r1, r0
    mov r0, r4
    bl func_020127f8
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_02013cf4: .word gGameWork
    .size func_02013cc4, . - func_02013cc4

