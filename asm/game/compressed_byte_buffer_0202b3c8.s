; Matching retail form; see src/game/compressed_byte_buffer.c.
.text
.extern Heap_FreeAlternateEntry

    .global CompressedByteBuffer_Destroy
    .type CompressedByteBuffer_Destroy, @function
CompressedByteBuffer_Destroy: ; 0x0202b3c8
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_0202b3e0
    bl Heap_FreeAlternateEntry
.L_0202b3e0:
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size CompressedByteBuffer_Destroy, . - CompressedByteBuffer_Destroy
