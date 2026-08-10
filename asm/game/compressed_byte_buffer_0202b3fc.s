; Matching retail form; see src/game/compressed_byte_buffer.c.
.text

    .global CompressedByteBuffer_SetByte
    .type CompressedByteBuffer_SetByte, @function
CompressedByteBuffer_SetByte: ; 0x0202b3fc
    ldr r0, [r0, #0x0]
    strb r2, [r0, r1]
    bx lr
    .size CompressedByteBuffer_SetByte, . - CompressedByteBuffer_SetByte
