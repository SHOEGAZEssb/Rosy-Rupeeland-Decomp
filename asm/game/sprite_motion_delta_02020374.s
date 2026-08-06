; Matching retail form; see src/game/sprite_motion_delta.c.
.text
.extern func_020befec

.global func_02020374
    .type func_02020374, @function
func_02020374: ; 0x02020374
    stmdb sp!, {r4, lr}
    mov r4, r0
    stmia r4, {r1, r2}
    strh r3, [r4, #0xc]
    ldr r1, [r4, #0x0]
    ldr r0, [r4, #0x4]
    sub r0, r1, r0
    str r0, [r4, #0x8]
    ldrsh r1, [r4, #0xc]
    bl func_020befec
    str r0, [r4, #0x8]
    mov r1, #0x1
    mov r0, r4
    strh r1, [r4, #0xe]
    ldmia sp!, {r4, pc}
    .size func_02020374, .-func_02020374
