; Matching retail form; see src/game/game_phase_script_vm_runtime_control_opcodes.c.
.text
.extern data_021052fc
.extern func_02007f0c
.extern func_02012704
.extern func_0202d68c
.global func_02017638
func_02017638:
    stmdb sp!, {r4, lr}
    bl func_02012704
    ldr r1, L_02017664
    mov r4, r0
    ldr r0, [r1]
    mov r1, #2
    bl func_02007f0c
    mov r1, r4
    bl func_0202d68c
    mov r0, #0
    ldmia sp!, {r4, pc}
L_02017664: .word data_021052fc
    .size func_02017638, . - func_02017638
