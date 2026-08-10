; Matching retail form; see src/game/zeroed_compressed_buffer.c.
.text

    .global ZeroedCompressedBuffer_GetData
    .type ZeroedCompressedBuffer_GetData, @function
ZeroedCompressedBuffer_GetData: ; 0x0202b728
    ldr r0, [r0, #0x0]
    bx lr
    .size ZeroedCompressedBuffer_GetData, . - ZeroedCompressedBuffer_GetData
