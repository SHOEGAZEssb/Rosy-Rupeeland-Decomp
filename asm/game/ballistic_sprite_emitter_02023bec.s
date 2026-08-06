; Matching retail form; see src/game/ballistic_sprite_emitter.c.
.text
.extern data_020d66b8
.extern func_02023c0c

    .global func_02023bec
    .type func_02023bec, @function
func_02023bec: ; 0x02023bec
    stmdb sp!, {r4, lr}
    ldr r1, .L_02023c08
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_02023c0c
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02023c08: .word data_020d66b8
    .size func_02023bec, . - func_02023bec
