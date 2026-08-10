; Matching retail form; see src/game/game_phase_script_vm_actor_bounds_opcode.c.
.text
.global S16Bounds_GetWidth
S16Bounds_GetWidth:
    ldrsh r1, [r0, #0x4]
    ldrsh r0, [r0, #0x0]
    sub r0, r1, r0
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    bx lr
.size S16Bounds_GetWidth, . - S16Bounds_GetWidth
