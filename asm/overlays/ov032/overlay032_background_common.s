.text

/* Exact fallback; see src/overlays/ov032/overlay032_background_loaders.c for documented portable C. */
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load
.extern data_020f4e18
.extern GraphicsResource_GetFormat
.extern func_02070638
.extern func_02070b50
.extern func_02070e0c
.extern GraphicsResourceSet_ReleaseHandles
.extern func_020b44e8

    .global func_ov032_021fe4a8
func_ov032_021fe4a8:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x10
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    add r0, sp, #0x4
    bic r1, r1, #0x1f00
    orr r1, r1, #0x1700
    str r1, [r2, #0x0]
    bl GraphicsResourceSet_Init
    ldr r3, L_021fe550
    ldr r0, L_021fe554
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x7
    add r0, sp, #0x4
    sub r3, r3, #0x6
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r0, [sp, #0x4]
    mov r1, #0x2
    mov r2, #0x0
    bl func_02070638
    ldr r0, [sp, #0x4]
    bl GraphicsResource_GetFormat
    cmp r0, #0x0
    movne r1, #0x6000
    ldr r0, [sp, #0x8]
    moveq r1, #0x0
    bl func_02070b50
    ldr r0, [sp, #0xc]
    mov r1, #0x2
    mov r2, #0x0
    bl func_02070e0c
    add r0, sp, #0x4
    bl GraphicsResourceSet_ReleaseHandles
    ldr r2, L_021fe558
    mov r1, #0x5000000
    add r0, sp, #0x4
    strh r2, [r1, #0x0]
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r3, pc}
L_021fe550: .word 0xa06b
L_021fe554: .word data_020f4e18
L_021fe558: .word 0x24a3
.size func_ov032_021fe4a8, .-func_ov032_021fe4a8

