; Matching retail form; see src/game/compressed_byte_buffer.c.
.text

    .global CompressedByteBuffer_IsEmpty
    .type CompressedByteBuffer_IsEmpty, @function
CompressedByteBuffer_IsEmpty: ; 0x0202b4c0
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
    .size CompressedByteBuffer_IsEmpty, . - CompressedByteBuffer_IsEmpty
