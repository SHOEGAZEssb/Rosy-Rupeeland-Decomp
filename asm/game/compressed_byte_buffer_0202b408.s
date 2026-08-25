; Matching retail form; see src/game/compressed_byte_buffer.c.
.text
.extern gSizedCompressedBufferTempAllocationTag
.extern gHeapContext
.extern data_020deb34
.extern Heap_AllocAlternateEntry
.extern GameFile_Seek
.extern GameFile_Read
.extern MI_UncompressLZ8
.extern MI_CpuCopy8
.extern func_020b4554
.extern func_020b44e8
.extern Heap_FreeAlternateEntry

    .global CompressedByteBuffer_LoadLz8Payload
    .type CompressedByteBuffer_LoadLz8Payload, @function
CompressedByteBuffer_LoadLz8Payload: ; 0x0202b408
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r1
    mov r6, r3
    mov r4, r0
    mov r7, r2
    ldr r1, .L_0202b4b4
    ldr r3, .L_0202b4b8
    mov r0, r6
    mvn r2, #0x3
    bl Heap_AllocAlternateEntry
    mov r5, r0
    mov r0, r8
    mov r1, r7
    mov r2, #0x0
    bl GameFile_Seek
    mov r0, r8
    mov r2, r6
    mov r1, r5
    bl GameFile_Read
    ldr r0, [r5, #0x0]
    ldr r1, .L_0202b4bc
    mov r6, r0, lsr #0x8
    mov r0, r6
    mov r2, #0x4
    ldr r3, .L_0202b4b8
    bl Heap_AllocAlternateEntry
    str r0, [r4, #0x0]
    mov r0, r5
    ldr r1, [r4, #0x0]
    bl MI_UncompressLZ8
    sub r6, r6, #0x4
    ldr r1, [r4, #0x0]
    mov r2, r6
    add r0, r1, #0x4
    bl MI_CpuCopy8
    ldr r0, [r4, #0x0]
    mov r1, r6
    bl func_020b4554
    bl func_020b44e8
    mov r0, r5
    bl Heap_FreeAlternateEntry
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0202b4b4: .word gSizedCompressedBufferTempAllocationTag
.L_0202b4b8: .word gHeapContext
.L_0202b4bc: .word data_020deb34
    .size CompressedByteBuffer_LoadLz8Payload, . - CompressedByteBuffer_LoadLz8Payload
