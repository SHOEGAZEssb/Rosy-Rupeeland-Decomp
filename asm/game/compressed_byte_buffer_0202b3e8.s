; Matching retail form; see src/game/compressed_byte_buffer.c.
.text

    .global CompressedByteBuffer_GetData
    .type CompressedByteBuffer_GetData, @function
CompressedByteBuffer_GetData: ; 0x0202b3e8
    ldr r0, [r0, #0x0]
    bx lr
    .size CompressedByteBuffer_GetData, . - CompressedByteBuffer_GetData
