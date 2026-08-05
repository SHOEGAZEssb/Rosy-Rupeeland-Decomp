; Matching retail form; see src/game/game_phase_script_vm_runtime_entity_control_opcodes.c.
.text
.extern func_02012704
.extern func_02034354
.extern func_020573fc
.global func_02018c14
func_02018c14:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl func_02012704
    mov r4, r0
    ldr r0, [r5, #0x84]
    bl func_02034354
    mov r1, r4
    bl func_020573fc
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.size func_02018c14, . - func_02018c14
