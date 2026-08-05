; Matching retail form; see src/game/game_phase_script_vm_actor_sequence_opcodes.c.
.text
.extern func_0203c438
.global func_02016ff4
func_02016ff4:
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x84]
    bl func_0203c438
    mov r0, #0
    ldmia sp!, {r3, pc}
    .size func_02016ff4, . - func_02016ff4
