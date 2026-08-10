; Matching retail form; see src/game/zeroed_compressed_buffer.c.
.text
.extern gSizedCompressedBufferTempAllocationTag
.extern gHeapContext
.extern gZeroedCompressedBufferPayloadAllocationTag
.extern ZeroedCompressedBuffer_Clear
.extern func_02003e20
.extern GameFile_Seek
.extern GameFile_Read
.extern func_020b58f0
.extern MI_UncompressLZ8
.extern MI_CpuCopy8
.extern func_020b4554
.extern func_020b44e8
.extern func_02003e38

    .global ZeroedCompressedBuffer_LoadLz8Section
    .type ZeroedCompressedBuffer_LoadLz8Section, @function
ZeroedCompressedBuffer_LoadLz8Section: ; 0x0202b648
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r4, r0
    ldr r5, [r4, #0x0]
    mov r8, r1
    mov r7, r2
    mov r6, r3
    cmp r5, #0x0
    beq .L_0202b66c
    bl ZeroedCompressedBuffer_Clear
.L_0202b66c:
    ldr r1, .L_0202b71c
    ldr r3, .L_0202b720
    mov r0, r6
    mvn r2, #0x3
    bl func_02003e20
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
    ldr r1, .L_0202b724
    mov r6, r0, lsr #0x8
    add r0, r6, r6, lsr #0x1f
    mov r0, r0, asr #0x1
    ldr r3, .L_0202b720
    str r6, [r4, #0x4]
    mov r0, r0, lsl #0x1
    mov r2, #0x4
    bl func_02003e20
    str r0, [r4, #0x0]
    mov r1, #0x0
    mov r2, r6
    bl func_020b58f0
    ldr r1, [r4, #0x0]
    mov r0, r5
    bl MI_UncompressLZ8
    ldr r1, [r4, #0x0]
    sub r6, r6, #0x4
    mov r2, r6
    add r0, r1, #0x4
    bl MI_CpuCopy8
    ldr r0, [r4, #0x0]
    mov r1, r6
    bl func_020b4554
    bl func_020b44e8
    mov r0, r5
    bl func_02003e38
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0202b71c: .word gSizedCompressedBufferTempAllocationTag
.L_0202b720: .word gHeapContext
.L_0202b724: .word gZeroedCompressedBufferPayloadAllocationTag
    .size ZeroedCompressedBuffer_LoadLz8Section, . - ZeroedCompressedBuffer_LoadLz8Section
