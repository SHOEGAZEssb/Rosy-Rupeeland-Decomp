; Matching retail form; see src/game/game_phase_script_vm_actor_flag_opcodes.c.
.text
.extern func_02012704
.extern func_020127f8
.extern func_020adc40

    .global func_020137c8
func_020137c8: ; 0x020137c8
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02012704
    bl func_020adc40
    mov r1, r0
    mov r0, r4
    bl func_020127f8
    mov r0, #0x0
    ldmia sp!, {r4, pc}
    .size func_020137c8, . - func_020137c8

