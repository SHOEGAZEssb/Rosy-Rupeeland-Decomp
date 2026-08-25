.text

/* Exact fallback; see src/overlays/ov023/overlay023_graphics_setup.c. */
.extern data_020f4e18
.extern GraphicsResourceSet_ApplyToMainBg
.extern func_020b44e8
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load


    .global func_ov023_021fe270
func_ov023_021fe270:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x10
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r3, L_021fe2c4
    ldr r0, L_021fe2c8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x4
    add r0, sp, #0x4
    sub r3, r3, #0x3
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    add r0, sp, #0x4
    mov r1, #0x1
    mov r2, #0x0
    bl GraphicsResourceSet_ApplyToMainBg
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r3, pc}
L_021fe2c4: .word 0x803c
L_021fe2c8: .word data_020f4e18
.size func_ov023_021fe270, .-func_ov023_021fe270

