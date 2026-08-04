; Matching retail form; see src/game/game_phase_script_vm_utility_opcodes.c.
.text
.extern data_021e9ac0
.extern func_02012704
.extern func_020127f8
.extern func_02063670
.global func_02015e64
func_02015e64:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02012704
    mov r1, r0, lsl #16
    ldr r2, L_02015e98
    mov r1, r1, lsr #16
    ldr r0, [r2]
    bl func_02063670
    mov r1, r0
    mov r0, r4
    bl func_020127f8
    mov r0, #0
    ldmia sp!, {r4, pc}
L_02015e98: .word data_021e9ac0
    .size func_02015e64, . - func_02015e64
