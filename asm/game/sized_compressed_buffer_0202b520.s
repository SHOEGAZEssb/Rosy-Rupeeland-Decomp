; Matching retail form; see src/game/sized_compressed_buffer.c.
.text
.extern gSizedCompressedBufferTempAllocationTag
.extern gHeapContext
.extern gSizedCompressedBufferPayloadAllocationTag
.extern SizedCompressedBuffer_Clear
.extern Heap_AllocAlternateEntry
.extern GameFile_Seek
.extern GameFile_Read
.extern MI_UncompressLZ8
.extern MI_CpuCopy8
.extern func_020b4554
.extern func_020b44e8
.extern Heap_FreeAlternateEntry

    .global SizedCompressedBuffer_LoadLz8Section
    .type SizedCompressedBuffer_LoadLz8Section, @function
SizedCompressedBuffer_LoadLz8Section: ; 0x0202b520
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r4, r0
    ldr r5, [r4, #0x0]
    mov r8, r1
    mov r7, r2
    mov r6, r3
    cmp r5, #0x0
    beq .L_0202b544
    bl SizedCompressedBuffer_Clear
.L_0202b544:
    ldr r1, .L_0202b5e8
    ldr r3, .L_0202b5ec
    mov r0, r6
    mvn r2, #0x3
    bl Heap_AllocAlternateEntry
    mov r5, r0
    mov r0, r8
    mov r1, r7
    mov r2, #0x0
    bl GameFile_Seek
    mov r0, r8
    mov r1, r5
    mov r2, r6
    bl GameFile_Read
    ldr r0, [r5, #0x0]
    ldr r1, .L_0202b5f0
    mov r6, r0, lsr #0x8
    add r0, r6, r6, lsr #0x1f
    mov r0, r0, asr #0x1
    mov r0, r0, lsl #0x1
    mov r2, #0x4
    ldr r3, .L_0202b5ec
    bl Heap_AllocAlternateEntry
    str r0, [r4, #0x0]
    mov r0, r5
    ldr r1, [r4, #0x0]
    bl MI_UncompressLZ8
    sub r7, r6, #0x4
    ldr r1, [r4, #0x0]
    mov r2, r7
    add r0, r1, #0x4
    bl MI_CpuCopy8
    mov r1, r7
    ldr r0, [r4, #0x0]
    bl func_020b4554
    bl func_020b44e8
    mov r0, r5
    bl Heap_FreeAlternateEntry
    str r6, [r4, #0x4]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0202b5e8: .word gSizedCompressedBufferTempAllocationTag
.L_0202b5ec: .word gHeapContext
.L_0202b5f0: .word gSizedCompressedBufferPayloadAllocationTag
    .size SizedCompressedBuffer_LoadLz8Section, . - SizedCompressedBuffer_LoadLz8Section
