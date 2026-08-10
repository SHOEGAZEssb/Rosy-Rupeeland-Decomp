; Matching retail form; see src/game/zeroed_compressed_buffer.c.
.text
.extern ZeroedCompressedBuffer_Clear

    .global ZeroedCompressedBuffer_Destroy
    .type ZeroedCompressedBuffer_Destroy, @function
ZeroedCompressedBuffer_Destroy: ; 0x0202b60c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ZeroedCompressedBuffer_Clear
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size ZeroedCompressedBuffer_Destroy, . - ZeroedCompressedBuffer_Destroy
