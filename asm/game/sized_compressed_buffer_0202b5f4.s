; Matching retail form; see src/game/sized_compressed_buffer.c.
.text

    .global SizedCompressedBuffer_GetData
    .type SizedCompressedBuffer_GetData, @function
SizedCompressedBuffer_GetData: ; 0x0202b5f4
    ldr r0, [r0, #0x0]
    bx lr
    .size SizedCompressedBuffer_GetData, . - SizedCompressedBuffer_GetData
