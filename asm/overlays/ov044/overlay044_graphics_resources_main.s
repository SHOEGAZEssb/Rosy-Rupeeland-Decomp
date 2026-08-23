.text
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load
.extern GraphicsBgMapResource_AddPaletteBankOffset
.extern func_020b44e8
.extern func_02072048
.extern GraphicsResourceSet_Apply
.extern GraphicsBgMapResource_UploadToSubBg
.extern func_ov044_0220c3e4
.extern GraphicsResourceSet_Destroy
.extern data_020f4e18

    .global func_ov044_0220c2e4
func_ov044_0220c2e4:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x1c
    mov r4, r0
    add r0, sp, #0x10
    bl GraphicsResourceSet_Init
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r3, .L_0220c3d4
    ldr r0, .L_0220c3d8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x10
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    ldr r0, [sp, #0x18]
    mov r1, #0x8
    bl GraphicsBgMapResource_AddPaletteBankOffset
    bl func_020b44e8
    add r0, sp, #0x10
    mov r1, #0x3
    mov r2, #0x100
    bl func_02072048
    add r0, sp, #0x10
    mov r1, #0x3
    mov r2, #0x100
    bl GraphicsResourceSet_Apply
    ldr r3, .L_0220c3dc
    ldr r1, .L_0220c3d8
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, sp, #0x10
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    ldr r3, .L_0220c3e0
    ldr r1, .L_0220c3d8
    str r3, [sp, #0x0]
    sub r2, r3, #0x8
    ldr r1, [r1, #0x0]
    add r0, sp, #0x4
    sub r3, r3, #0x7
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    mov r1, #0x0
    add r0, sp, #0x10
    mov r2, r1
    bl GraphicsResourceSet_Apply
    ldr r0, [sp, #0xc]
    mov r1, #0x2
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToSubBg
    mov r0, r4
    bl func_ov044_0220c3e4
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add r0, sp, #0x10
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x1c
    ldmia sp!, {r3, r4, pc}
.L_0220c3d4: .word 0x8006
.L_0220c3d8: .word data_020f4e18
.L_0220c3dc: .word 0x8014
.L_0220c3e0: .word 0x801a
.size func_ov044_0220c2e4, . - func_ov044_0220c2e4
