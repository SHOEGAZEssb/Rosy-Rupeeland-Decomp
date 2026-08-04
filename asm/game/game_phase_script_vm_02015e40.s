; Matching retail form; see src/game/game_phase_script_vm_utility_opcodes.c.
.text
.extern func_02012704
.extern func_020127f8
.extern func_020be328
.global func_02015e40
func_02015e40:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02012704
    bl func_020be328
    mov r1, r0
    mov r0, r4
    bl func_020127f8
    mov r0, #0
    ldmia sp!, {r4, pc}
    .size func_02015e40, . - func_02015e40
