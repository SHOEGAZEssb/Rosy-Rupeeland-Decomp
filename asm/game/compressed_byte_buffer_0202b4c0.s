; Matching retail form; see src/game/compressed_byte_buffer.c.
.text

    .global func_0202b4c0
    .type func_0202b4c0, @function
func_0202b4c0: ; 0x0202b4c0
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
    .size func_0202b4c0, . - func_0202b4c0
