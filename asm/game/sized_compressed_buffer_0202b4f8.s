; Matching retail form; see src/game/sized_compressed_buffer.c.
.text
.extern Heap_FreeAlternateEntry

    .global SizedCompressedBuffer_Clear
    .type SizedCompressedBuffer_Clear, @function
SizedCompressedBuffer_Clear: ; 0x0202b4f8
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_0202b510
    bl Heap_FreeAlternateEntry
.L_0202b510:
    mov r0, #0x0
    str r0, [r4, #0x0]
    str r0, [r4, #0x4]
    ldmia sp!, {r4, pc}
    .size SizedCompressedBuffer_Clear, . - SizedCompressedBuffer_Clear
