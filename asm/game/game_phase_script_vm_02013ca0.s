; Matching retail form; see src/game/game_phase_script_vm_gamework_flag_opcodes.c.
.text
.extern GameWork_ClearFlag
.extern func_02012704
.extern gGameWork

    .global func_02013ca0
func_02013ca0: ; 0x02013ca0
    stmdb sp!, {r3, lr}
    bl func_02012704
    ldr r2, L_02013cc0
    mov r1, r0
    ldr r0, [r2, #0x0]
    bl GameWork_ClearFlag
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_02013cc0: .word gGameWork
    .size func_02013ca0, . - func_02013ca0

