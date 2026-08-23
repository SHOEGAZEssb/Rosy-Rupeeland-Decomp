.text

/* Exact fallback; see src/overlays/ov032/overlay032_background_loaders.c for documented portable C. */
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load
.extern data_020c7bac
.extern data_020c7bb0
.extern data_020c7bb4
.extern data_020f4e18
.extern GraphicsResource_GetFormat
.extern func_02070638
.extern func_02070b50
.extern GraphicsBgMapResource_UploadToMainBg
.extern GraphicsResourceSet_ReleaseHandles
.extern func_020b44e8

    .global func_ov032_021fe55c
func_ov032_021fe55c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    mov r4, r0
    bic r0, r1, #0x1f00
    orr r1, r0, #0x1f00
    add r0, sp, #0x4
    str r1, [r2, #0x0]
    bl GraphicsResourceSet_Init
    ldr r3, L_021fe698
    ldr r0, L_021fe69c
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x8
    add r0, sp, #0x4
    sub r3, r3, #0x7
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
    bl GraphicsBgMapResource_UploadToMainBg
    add r0, sp, #0x4
    bl GraphicsResourceSet_ReleaseHandles
    add r0, r4, #0x344
    add r0, r0, #0x800
    bl GraphicsResourceSet_ReleaseHandles
    ldr r1, [r4, #0xc24]
    mov r0, #0x208
    mul ip, r1, r0
    ldr r1, L_021fe6a0
    ldr r2, L_021fe6a4
    ldr r1, [r1, ip]
    ldr r3, L_021fe6a8
    str r1, [sp, #0x0]
    ldr r1, L_021fe69c
    add r0, r4, #0x344
    ldr r1, [r1, #0x0]
    ldr r2, [r2, ip]
    ldr r3, [r3, ip]
    add r0, r0, #0x800
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r0, [r4, #0xb44]
    mov r1, #0x3
    mov r2, #0x0
    bl func_02070638
    ldr r0, [r4, #0xb44]
    bl GraphicsResource_GetFormat
    cmp r0, #0x0
    movne r1, #0x6000
    ldr r0, [r4, #0xb48]
    moveq r1, #0x0
    bl func_02070b50
    ldr r0, [r4, #0xb4c]
    mov r1, #0x3
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToMainBg
    mov r1, #0x0
    str r1, [r4, #0xc34]
    ldr r2, L_021fe6ac
    mov r1, #0x5000000
    add r0, sp, #0x4
    strh r2, [r1, #0x0]
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
L_021fe698: .word 0xa06c
L_021fe69c: .word data_020f4e18
L_021fe6a0: .word data_020c7bb4
L_021fe6a4: .word data_020c7bac
L_021fe6a8: .word data_020c7bb0
L_021fe6ac: .word 0x24a3
.size func_ov032_021fe55c, .-func_ov032_021fe55c

