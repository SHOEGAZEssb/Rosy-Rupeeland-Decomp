; Matching retail form; see src/game/sized_compressed_buffer.c.
.text

    .global SizedCompressedBuffer_Init
    .type SizedCompressedBuffer_Init, @function
SizedCompressedBuffer_Init: ; 0x0202b4d4
    mov r1, #0x0
    str r1, [r0, #0x0]
    str r1, [r0, #0x4]
    bx lr
    .size SizedCompressedBuffer_Init, . - SizedCompressedBuffer_Init
