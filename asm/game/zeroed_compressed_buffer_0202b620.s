; Matching retail form; see src/game/zeroed_compressed_buffer.c.
.text
.extern Heap_FreeAlternateEntry

    .global ZeroedCompressedBuffer_Clear
    .type ZeroedCompressedBuffer_Clear, @function
ZeroedCompressedBuffer_Clear: ; 0x0202b620
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_0202b638
    bl Heap_FreeAlternateEntry
.L_0202b638:
    mov r0, #0x0
    str r0, [r4, #0x0]
    str r0, [r4, #0x4]
    ldmia sp!, {r4, pc}
    .size ZeroedCompressedBuffer_Clear, . - ZeroedCompressedBuffer_Clear
