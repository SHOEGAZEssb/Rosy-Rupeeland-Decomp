.text
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load
.extern func_020b44e8
.extern GraphicsResourceSet_ApplyToMainBg
.extern GraphicsResourceSet_Destroy
.extern data_020f4e18

    .global func_ov044_0220c3e4
func_ov044_0220c3e4:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x10
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r3, .L_0220c438
    ldr r0, .L_0220c43c
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x5
    add r0, sp, #0x4
    sub r3, r3, #0x4
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    add r0, sp, #0x4
    mov r1, #0x2
    mov r2, #0x0
    bl GraphicsResourceSet_ApplyToMainBg
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r3, pc}
.L_0220c438: .word 0x8017
.L_0220c43c: .word data_020f4e18
.size func_ov044_0220c3e4, . - func_ov044_0220c3e4
