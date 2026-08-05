; Matching retail form; see src/game/game_phase_script_vm_actor_bounds_opcode.c.
.text
.global func_020188e4
func_020188e4:
    ldrsh r1, [r0, #0x6]
    ldrsh r0, [r0, #0x2]
    sub r0, r1, r0
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    bx lr
.size func_020188e4, . - func_020188e4
