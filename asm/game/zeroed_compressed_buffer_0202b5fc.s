; Matching retail form; see src/game/zeroed_compressed_buffer.c.
.text

    .global ZeroedCompressedBuffer_Init
    .type ZeroedCompressedBuffer_Init, @function
ZeroedCompressedBuffer_Init: ; 0x0202b5fc
    mov r1, #0x0
    str r1, [r0, #0x0]
    str r1, [r0, #0x4]
    bx lr
    .size ZeroedCompressedBuffer_Init, . - ZeroedCompressedBuffer_Init
