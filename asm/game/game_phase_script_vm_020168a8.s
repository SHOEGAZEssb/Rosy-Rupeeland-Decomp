; Matching retail form; see src/game/game_phase_script_vm_runtime_misc_opcodes.c.
.text
.extern data_021052fc
.extern func_0204cc30
.global func_020168a8
func_020168a8:
    stmdb sp!, {r3, lr}
    ldr r0, L_020168cc
    ldr r0, [r0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    ldr r0, [r0, #0x270]
    bl func_0204cc30
    mov r0, #0
    ldmia sp!, {r3, pc}
L_020168cc: .word data_021052fc
    .size func_020168a8, . - func_020168a8
