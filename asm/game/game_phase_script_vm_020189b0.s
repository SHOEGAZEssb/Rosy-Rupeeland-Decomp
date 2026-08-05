; Matching retail form; see src/game/game_phase_script_vm_actor_bounds_opcode.c.
.text
.global func_020189b0
func_020189b0:
    ldrsh r3, [r0, #0x0]
    sub r3, r3, r1
    strh r3, [r0, #0x0]
    ldrsh r3, [r0, #0x4]
    add r1, r3, r1
    strh r1, [r0, #0x4]
    ldrsh r1, [r0, #0x2]
    sub r1, r1, r2
    strh r1, [r0, #0x2]
    ldrsh r1, [r0, #0x6]
    add r1, r1, r2
    strh r1, [r0, #0x6]
    bx lr
.size func_020189b0, . - func_020189b0
