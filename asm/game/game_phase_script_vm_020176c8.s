; Matching retail form; see src/game/game_phase_script_vm_runtime_control_opcodes.c.
.text
.extern data_021052fc
.extern func_02008570
.global func_020176c8
func_020176c8:
    stmdb sp!, {r3, lr}
    ldr r0, L_020176e8
    mov r1, #1
    ldr r0, [r0]
    mov r2, r1
    bl func_02008570
    mov r0, #0
    ldmia sp!, {r3, pc}
L_020176e8: .word data_021052fc
    .size func_020176c8, . - func_020176c8
