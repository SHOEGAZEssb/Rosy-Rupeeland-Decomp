; Matching retail form; see src/game/compressed_byte_buffer.c.
.text

    .global CompressedByteBuffer_Init
    .type CompressedByteBuffer_Init, @function
CompressedByteBuffer_Init: ; 0x0202b3bc
    mov r1, #0x0
    str r1, [r0, #0x0]
    bx lr
    .size CompressedByteBuffer_Init, . - CompressedByteBuffer_Init
