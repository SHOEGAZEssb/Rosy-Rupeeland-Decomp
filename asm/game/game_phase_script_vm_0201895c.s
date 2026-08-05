; Matching retail form; see src/game/game_phase_script_vm_actor_bounds_opcode.c.
.text
.extern func_020188e4
.global func_0201895c
func_0201895c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrsh ip, [r4, #0x4]
    ldrsh r3, [r4, #0x0]
    mov r5, r2
    sub r2, ip, r3
    mov r2, r2, lsl #0x10
    strh r1, [r4, #0x0]
    add r1, r1, r2, asr #0x10
    strh r1, [r4, #0x4]
    bl func_020188e4
    strh r5, [r4, #0x2]
    add r0, r5, r0
    strh r0, [r4, #0x6]
    ldmia sp!, {r3, r4, r5, pc}
.size func_0201895c, . - func_0201895c
