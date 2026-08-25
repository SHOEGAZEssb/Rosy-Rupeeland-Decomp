.text

/* Exact fallback; see src/overlays/ov025/overlay025_graphics_setup.c. */
.extern data_020f4e18
.extern GraphicsBgMapResource_AddPaletteBankOffset
.extern GraphicsResourceSet_ApplyToMainBg
.extern func_020b44e8
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load


    .global func_ov025_02200014
func_ov025_02200014:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x10
    mov r1, #0x18
    str r1, [r0, #0x48]
    mov r1, #0x12
    str r1, [r0, #0x4c]
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r3, L_02200098
    ldr r0, L_0220009c
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    ldr r0, [sp, #0xc]
    mov r1, #0x8
    bl GraphicsBgMapResource_AddPaletteBankOffset
    bl func_020b44e8
    add r0, sp, #0x4
    mov r1, #0x3
    mov r2, #0x100
    bl GraphicsResourceSet_ApplyToMainBg
    ldr r1, L_022000a0
    mov r2, #0x0
    strh r2, [r1, #0x0]
    add r1, r1, #0x1000
    add r0, sp, #0x4
    strh r2, [r1, #0x0]
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r3, pc}
L_02200098: .word 0xa13d
L_0220009c: .word data_020f4e18
L_022000a0: .word 0x4000050
.size func_ov025_02200014, .-func_ov025_02200014

