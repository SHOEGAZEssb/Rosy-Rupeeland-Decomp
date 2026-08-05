; Matching retail form; see src/game/game_phase_script_vm_runtime_motion_opcodes.c.
.text
.extern data_021052fc
.extern func_02009694
.global func_02017058
func_02017058:
    stmdb sp!, {r3, lr}
    ldr r0, L_02017078
    ldr r0, [r0]
    add r0, r0, #0x44
    add r0, r0, #0x3000
    bl func_02009694
    mov r0, #0
    ldmia sp!, {r3, pc}
L_02017078: .word data_021052fc
    .size func_02017058, . - func_02017058
