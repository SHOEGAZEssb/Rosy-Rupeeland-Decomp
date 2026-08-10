; Matching retail form; see src/game/sized_compressed_buffer.c.
.text
.extern SizedCompressedBuffer_Clear

    .global SizedCompressedBuffer_Destroy
    .type SizedCompressedBuffer_Destroy, @function
SizedCompressedBuffer_Destroy: ; 0x0202b4e4
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl SizedCompressedBuffer_Clear
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size SizedCompressedBuffer_Destroy, . - SizedCompressedBuffer_Destroy
