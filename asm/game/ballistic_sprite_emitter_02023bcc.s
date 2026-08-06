; Matching retail form; see src/game/ballistic_sprite_emitter.c.
.text
.extern data_020d66b8

    .global func_02023bcc
    .type func_02023bcc, @function
func_02023bcc: ; 0x02023bcc
    ldr r2, .L_02023be8
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    str r1, [r0, #0xc]
    bx lr
.L_02023be8: .word data_020d66b8
    .size func_02023bcc, . - func_02023bcc
