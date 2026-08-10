; Matching retail form; see src/game/game_phase_script_vm_runtime_control_opcodes.c.
.text
.extern data_021052fc
.extern GamePhaseAreaScene_SetEnabled
.extern func_02012704
.global func_02017668
func_02017668:
    stmdb sp!, {r3, lr}
    bl func_02012704
    ldr r2, L_02017690
    mov r1, r0
    ldr r0, [r2]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xfb8]
    bl GamePhaseAreaScene_SetEnabled
    mov r0, #0
    ldmia sp!, {r3, pc}
L_02017690: .word data_021052fc
    .size func_02017668, . - func_02017668
