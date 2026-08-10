; Matching retail form; see src/game/compressed_byte_buffer.c.
.text

    .global CompressedByteBuffer_GetByte
    .type CompressedByteBuffer_GetByte, @function
CompressedByteBuffer_GetByte: ; 0x0202b3f0
    ldr r0, [r0, #0x0]
    ldrb r0, [r0, r1]
    bx lr
    .size CompressedByteBuffer_GetByte, . - CompressedByteBuffer_GetByte
