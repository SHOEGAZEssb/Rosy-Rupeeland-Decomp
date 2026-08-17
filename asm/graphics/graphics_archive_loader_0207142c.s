.text
; Matching fallback for the documented portable reader in
; src/graphics/graphics_archive_loader.c. This preserves MWCC's retail register
; schedule while keeping FS, heap, LZ8, and cache-flush calls at NDS boundaries.
.extern CheckedFS_InitFile
.extern CheckedFS_OpenFileFast
.extern CheckedFS_SeekFile
.extern CheckedFS_ReadFile
.extern CheckedFS_CloseFile
.extern Heap_AllocCore
.extern Heap_FreeCore
.extern MI_UncompressLZ8
.extern func_020b4554
.extern data_020e68f0
.extern data_020e68f8
.extern data_020e6900
.extern gHeapContext

.global GraphicsArchive_LoadIndexedPayload
GraphicsArchive_LoadIndexedPayload:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x48
    mov r8, r1
    mov r9, r0
    ldr r1, .L_mask
    mov r4, r8, lsr #0xc
    add r0, sp, #0
    mov r7, r2
    and r8, r8, r1
    bl CheckedFS_InitFile
    add r1, r9, r4, lsl #3
    add r0, sp, #0
    ldmia r1, {r1, r2}
    bl CheckedFS_OpenFileFast
    cmp r0, #0
    beq .L_failure
    add r0, r9, r4, lsl #2
    ldr r0, [r0, #0x78]
    add r0, r0, r8, lsl #3
    ldr r1, [r0, #4]
    bic r0, r1, #0x80000000
    str r0, [r7]
    ands r5, r1, #0x80000000
    ldr r0, [r7]
    beq .L_allocate_plain
    ldr r1, .L_compressed_tag
    ldr r3, .L_heap
    mvn r2, #3
    bl Heap_AllocCore
    b .L_read
.L_allocate_plain:
    ldr r1, .L_plain_tag
    ldr r3, .L_heap
    mov r2, #4
    bl Heap_AllocCore
.L_read:
    mov r6, r0
    add r0, r9, r4, lsl #2
    ldr r1, [r0, #0x78]
    add r0, sp, #0
    ldr r1, [r1, r8, lsl #3]
    mov r2, #0
    bl CheckedFS_SeekFile
    ldr r2, [r7]
    add r0, sp, #0
    mov r1, r6
    bl CheckedFS_ReadFile
    ldr r1, [r7]
    cmp r1, r0
    bne .L_failure
    add r0, sp, #0
    bl CheckedFS_CloseFile
    cmp r5, #0
    beq .L_flush
    ldr r0, [r6]
    ldr r1, .L_expanded_tag
    mov r0, r0, lsr #8
    ldr r3, .L_heap
    mov r2, #4
    str r0, [r7]
    bl Heap_AllocCore
    mov r4, r0
    mov r0, r6
    mov r1, r4
    bl MI_UncompressLZ8
    mov r0, r6
    bl Heap_FreeCore
    mov r6, r4
.L_flush:
    ldr r1, [r7]
    mov r0, r6
    bl func_020b4554
    mov r0, r6
    b .L_return
.L_failure:
    mov r0, #0
.L_return:
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_mask: .word 0xfff
.L_compressed_tag: .word data_020e68f0
.L_heap: .word gHeapContext
.L_plain_tag: .word data_020e68f8
.L_expanded_tag: .word data_020e6900
.size GraphicsArchive_LoadIndexedPayload, . - GraphicsArchive_LoadIndexedPayload
