    .text
/* Exact fallback; see src/overlays/ov022/overlay022_graphics_setup.c. */
    .extern data_020f4e18
    .extern data_021f5ee8
    .extern func_02070638
    .extern GraphicsBgMapResource_UploadToMainBg
    .extern GraphicsBgMapResource_SetPaletteBank
    .extern func_02072048
    .extern func_020925f8
    .extern func_02092638
    .extern func_020afd0c
    .extern func_020b2058
    .extern func_020b44e8
    .extern GraphicsResourceSet_Destroy
    .extern GraphicsResourceSet_Init
    .extern GraphicsResourceSet_Load

.global func_ov022_021fe544
func_ov022_021fe544:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    mov r0, #0x0
    mov r1, #0x1
    mov r2, #0x2
    mov r3, #0x3
    bl func_02092638
    ldr r1, L_021fe670
    ldrh r0, [r1, #0x0]
    and r0, r0, #0x43
    orr r0, r0, #0x3c00
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x2]
    and r0, r0, #0x43
    orr r0, r0, #0xe10
    orr r0, r0, #0x1000
    strh r0, [r1, #0x2]
    ldrh r0, [r1, #0x4]
    and r0, r0, #0x43
    orr r0, r0, #0xe10
    orr r0, r0, #0x1000
    strh r0, [r1, #0x4]
    bl func_020925f8
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r3, L_021fe674
    ldr r1, L_021fe678
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    add r0, sp, #0x4
    mov r1, #0x1
    mov r2, #0x0
    bl func_02072048
    mov r0, #0x1c
    str r0, [r4, #0x48]
    mov r2, #0x8
    ldr r0, L_021fe67c
    mov r1, #0x4
    mov r3, r2
    str r2, [sp, #0x0]
    bl func_020afd0c
    ldr r3, L_021fe680
    ldr r1, L_021fe678
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    ldr r0, [sp, #0xc]
    mov r1, #0x8
    bl GraphicsBgMapResource_SetPaletteBank
    bl func_020b44e8
    ldr r0, [sp, #0x4]
    mov r1, #0x2
    mov r2, #0x0
    bl func_02070638
    ldr r0, [sp, #0xc]
    mov r1, #0x2
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToMainBg
    ldr r0, L_021fe684
    mov r1, #0x100
    mov r2, #0x20
    bl func_020b2058
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
L_021fe670: .word 0x400000a
L_021fe674: .word 0x803a
L_021fe678: .word data_020f4e18
L_021fe67c: .word 0x4000050
L_021fe680: .word 0xc008
L_021fe684: .word data_021f5ee8
.size func_ov022_021fe544, . - func_ov022_021fe544
