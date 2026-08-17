.text
; Matching fallback for the portable implementation in src/overlays/ov054/overlay054_recovery.c.
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load
.extern PaletteBuffer_Write
.extern data_020f4e18
.extern gMainBgPaletteBuffer
.extern func_02070638
.extern GraphicsBgResourceData_GetDecoded
.extern func_02070e0c
.extern func_02070f34
.extern func_020b44e8
.extern func_ov054_0220eb1c

.global func_ov054_0220ea34
func_ov054_0220ea34:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x10
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r3, .L_0220eb0c
    ldr r0, .L_0220eb10
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    ldr r0, [sp, #0xc]
    mov r1, #0xf
    bl func_02070f34
    mov r0, #0x0
    mov r1, r0
    str r0, [sp, #0x0]
    mov r2, #0x1a
    mov r3, #0x2
    bl func_ov054_0220eb1c
    bl func_020b44e8
    ldr r0, [sp, #0x4]
    mov r1, #0x1
    mov r2, #0x0
    bl func_02070638
    ldr r0, [sp, #0xc]
    mov r1, #0x1
    mov r2, #0x0
    bl func_02070e0c
    ldr r0, [sp, #0x8]
    bl GraphicsBgResourceData_GetDecoded
    mov r1, r0
    ldr r0, .L_0220eb14
    mov r2, #0x1e0
    mov r3, #0x20
    bl PaletteBuffer_Write
    ldr r2, .L_0220eb18
    mov r3, #0x4000000
    ldrh r1, [r2, #0x0]
    add r0, sp, #0x4
    bic r1, r1, #0x3
    strh r1, [r2, #0x0]
    ldr r2, [r3, #0x0]
    ldr r1, [r3, #0x0]
    and r2, r2, #0x1f00
    mov ip, r2, lsr #0x8
    bic r2, r1, #0x1f00
    orr r1, ip, #0x2
    orr r1, r2, r1, lsl #0x8
    str r1, [r3, #0x0]
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r3, pc}
.L_0220eb0c: .word 0x8025
.L_0220eb10: .word data_020f4e18
.L_0220eb14: .word gMainBgPaletteBuffer
.L_0220eb18: .word 0x400000a
.size func_ov054_0220ea34, . - func_ov054_0220ea34
