.text
; Matching fallback for the portable implementation in src/overlays/ov058/overlay058_recovery.c.
.extern GraphicsResourceSet_Apply
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load
.extern PaletteBuffer_Write
.extern data_020f4e18
.extern gMainBgPaletteBuffer
.extern gSubBgPaletteBuffer
.extern data_ov058_0220fcfc
.extern Heap_AllocCore
.extern Heap_FreeCore
.extern GraphicsCharacterResource_GetUploadSize
.extern GraphicsBgResourceData_GetDecoded
.extern func_020b18bc
.extern func_020b1924
.extern func_020b1bfc
.extern func_020b1c64
.extern func_020b44e8
.extern func_020b57d4
.extern func_ov058_0220f228
.extern gHeapContext

.global func_ov058_0220f308
func_ov058_0220f308:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x10
    mov r5, r0
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r3, .L_0220f46c
    ldr r0, .L_0220f470
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    add r0, sp, #0x4
    mov r1, #0x2
    mov r2, #0x4000
    bl GraphicsResourceSet_Apply
    ldr r1, .L_0220f474
    ldr r3, .L_0220f478
    mov r0, #0x1000
    mov r2, #0x4
    bl Heap_AllocCore
    mov r4, r0
    mov r0, #0x0
    mov r1, r4
    mov r2, #0x1000
    bl func_020b57d4
    mov r0, r4
    mov r1, #0x0
    mov r2, #0x1000
    bl func_020b1c64
    mov r0, r4
    mov r1, #0x0
    mov r2, #0x1000
    bl func_020b1bfc
    mov r0, r4
    bl Heap_FreeCore
    mov r8, #0x0
    ldr r7, .L_0220f47c
    mov r9, r8
    mov r11, #0x20
    mov r6, #0xc
.L_0220f3b4:
    mla r4, r9, r6, r5
    ldr r0, [r4, #0x18]
    ldr r10, [r0, #0x24]
    bl GraphicsCharacterResource_GetUploadSize
    mov r2, r0
    mov r0, r10
    mov r1, r8
    bl func_020b1924
    ldr r0, [r4, #0x18]
    ldr r10, [r0, #0x24]
    bl GraphicsCharacterResource_GetUploadSize
    mov r2, r0
    mov r0, r10
    mov r1, r8
    bl func_020b18bc
    rsb r0, r9, #0xf
    mov r10, r0, lsl #0x5
    ldr r0, [r4, #0x1c]
    bl GraphicsBgResourceData_GetDecoded
    mov r1, r0
    mov r0, r7
    mov r2, r10
    mov r3, r11
    bl PaletteBuffer_Write
    ldr r0, [r4, #0x1c]
    bl GraphicsBgResourceData_GetDecoded
    mov r1, r0
    ldr r0, .L_0220f480
    mov r2, r10
    mov r3, #0x20
    bl PaletteBuffer_Write
    add r9, r9, #0x1
    cmp r9, #0x4
    add r8, r8, #0x2000
    blt .L_0220f3b4
    mov r4, #0x0
.L_0220f444:
    mov r0, r5
    mov r1, r4
    bl func_ov058_0220f228
    add r4, r4, #0x1
    cmp r4, #0x5
    blt .L_0220f444
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0220f46c: .word 0xb0a1
.L_0220f470: .word data_020f4e18
.L_0220f474: .word data_ov058_0220fcfc
.L_0220f478: .word gHeapContext
.L_0220f47c: .word gMainBgPaletteBuffer
.L_0220f480: .word gSubBgPaletteBuffer
.size func_ov058_0220f308, . - func_ov058_0220f308
