    .text
    .extern GraphicsResourceSet_Apply
    .extern GraphicsResourceSet_Destroy
    .extern GraphicsResourceSet_Init
    .extern GraphicsResourceSet_Load
    .extern data_020f4e14
    .extern data_020f4e18
    .extern func_020706c4
    .extern func_02070bc4
    .extern GraphicsBgMapResource_UploadToSubBg
    .extern GraphicsBgMapResource_AddPaletteBankOffset
    .extern func_02072048
    .extern GraphicsSpriteRenderer_ClearTextBuffer
    .extern func_020925a4
    .extern func_020925dc
    .extern func_020925f8
    .extern func_02092618
    .extern func_02092638
    .extern func_02092688
    .extern func_020b44e8
    .extern gDebugFont

/* Exact fallback; see src/overlays/ov015/overlay015_graphics_setup.c. */
    .global func_ov015_021fd41c

func_ov015_021fd41c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x28
    ldr r1, L_021fd660
    mov r4, r0
    ldr r0, [r1, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, [r4, #0xec]
    cmp r0, #0x0
    bne L_021fd44c
    ldr r0, L_021fd664
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
L_021fd44c:
    ldr r3, L_021fd668
    mov r1, #0x14
    ldrh r2, [r3, #0x0]
    mov r0, #0x0
    bic r2, r2, #0x8000
    strh r2, [r3, #0x0]
    str r1, [r4, #0x48]
    bl func_020925a4
    ldr r1, L_021fd66c
    ldrh r0, [r1, #0x0]
    and r0, r0, #0x43
    orr r0, r0, #0x3a00
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x2]
    and r0, r0, #0x43
    orr r0, r0, #0x1c00
    strh r0, [r1, #0x2]
    bl func_020925f8
    ldr r0, L_021fd670
    mov r1, #0x200000
    str r1, [r0, #0x0]
    mov r0, #0x0
    mov r1, #0x1
    mov r2, #0x2
    mov r3, #0x3
    bl func_02092638
    ldr r0, [r4, #0xec]
    cmp r0, #0x0
    bne L_021fd520
    mov r1, #0x19
    mov r0, #0x0
    str r1, [r4, #0x4c]
    bl func_020925dc
    ldr r1, L_021fd674
    ldrh r0, [r1, #0x0]
    and r0, r0, #0x43
    orr r0, r0, #0x3800
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x2]
    and r0, r0, #0x43
    orr r0, r0, #0x3a00
    strh r0, [r1, #0x2]
    ldrh r0, [r1, #0x6]
    and r0, r0, #0x43
    orr r0, r0, #0xe10
    orr r0, r0, #0x1000
    strh r0, [r1, #0x6]
    bl func_02092618
    mov r0, #0x0
    mov r1, #0x1
    mov r2, #0x2
    mov r3, #0x3
    bl func_02092688
L_021fd520:
    add r0, sp, #0x1c
    bl GraphicsResourceSet_Init
    add r0, sp, #0x10
    bl GraphicsResourceSet_Init
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r3, L_021fd678
    ldr r1, L_021fd67c
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, sp, #0x1c
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    ldr r0, [sp, #0x24]
    mov r1, #0x8
    bl GraphicsBgMapResource_AddPaletteBankOffset
    bl func_020b44e8
    ldr r0, [r4, #0xec]
    cmp r0, #0x0
    bne L_021fd584
    add r0, sp, #0x1c
    mov r1, #0x3
    mov r2, #0x100
    bl GraphicsResourceSet_Apply
L_021fd584:
    ldr r3, L_021fd680
    ldr r0, L_021fd67c
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x1c
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    ldr r3, L_021fd684
    ldr r0, L_021fd67c
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x6
    add r0, sp, #0x10
    sub r3, r3, #0x5
    bl GraphicsResourceSet_Load
    ldr r3, L_021fd688
    ldr r0, L_021fd67c
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x5
    add r0, sp, #0x4
    sub r3, r3, #0x4
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    add r0, sp, #0x1c
    mov r1, #0x2
    mov r2, #0x0
    bl func_02072048
    ldr r0, [r4, #0xec]
    cmp r0, #0x0
    bne L_021fd640
    mov r1, #0x0
    ldr r0, [sp, #0x1c]
    mov r2, r1
    bl func_020706c4
    ldr r0, [sp, #0x20]
    mov r1, #0x0
    bl func_02070bc4
    mov r1, #0x0
    ldr r0, [sp, #0x18]
    mov r2, r1
    bl GraphicsBgMapResource_UploadToSubBg
    ldr r0, [sp, #0xc]
    mov r1, #0x1
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToSubBg
L_021fd640:
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add r0, sp, #0x10
    bl GraphicsResourceSet_Destroy
    add r0, sp, #0x1c
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x28
    ldmia sp!, {r4, pc}
L_021fd660: .word data_020f4e14
L_021fd664: .word gDebugFont
L_021fd668: .word 0x4000304
L_021fd66c: .word 0x400000a
L_021fd670: .word 0x4000018
L_021fd674: .word 0x4001008
L_021fd678: .word 0xb005
L_021fd67c: .word data_020f4e18
L_021fd680: .word 0x800a
L_021fd684: .word 0x800e
L_021fd688: .word 0x800d

    .size func_ov015_021fd41c, . - func_ov015_021fd41c
