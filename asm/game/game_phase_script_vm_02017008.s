; Matching retail form; see src/game/game_phase_script_vm_runtime_motion_opcodes.c.
.text
.extern data_021052fc
.extern ActorMotion_SetOscillation
.extern func_02012704
.global func_02017008
func_02017008:
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
    ldr r0, L_02017054
    ldr r0, [r0]
    add r0, r0, #0x44
    add r0, r0, #0x3000
    bl ActorMotion_SetOscillation
    mov r0, #0
    ldmia sp!, {r4, r5, r6, pc}
L_02017054: .word data_021052fc
    .size func_02017008, . - func_02017008
