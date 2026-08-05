; Matching retail form; see src/game/game_phase_script_vm_runtime_motion_opcodes.c.
.text
.extern data_021052fc
.extern func_020095cc
.extern func_02012704
.global func_0201707c
func_0201707c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    bl func_02012704
    mov r5, r0
    mov r0, r6
    bl func_02012704
    mov r4, r0
    mov r0, r6
    bl func_02012704
    mov r2, r4
    mov r3, r5
    mov r1, r0
    ldr r0, L_020170c8
    ldr r0, [r0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl func_020095cc
    mov r0, #0
    ldmia sp!, {r4, r5, r6, pc}
L_020170c8: .word data_021052fc
    .size func_0201707c, . - func_0201707c
