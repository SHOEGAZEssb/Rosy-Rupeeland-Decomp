    .text
/* Exact fallback; see overlay040_scene_construct.c for portable C. */
    .extern GraphicsResourceSet_Destroy
    .extern GraphicsResourceSet_Init
    .extern GraphicsResourceSet_Load
    .extern GX_SetBankForBG
    .extern GX_SetGraphicsMode
    .extern __construct_array
    .extern data_020f4e18
    .extern data_021052fc
    .extern data_ov040_022042a8
    .extern VecFx32Object_Init
    .extern VecFx32Object_InitComponents
    .extern VecFx32Object_Destroy
    .extern VecFx32Object_Assign
    .extern func_0207043c
    .extern GraphicsBgResourceData_GetDecoded
    .extern func_02070888
    .extern func_020708c4
    .extern GraphicsBgMapResource_UploadToMainBg
    .extern GraphicsBgMapResource_AddPaletteBankOffset
    .extern GraphicsResourceSet_ReleaseHandles
    .extern func_0209a208
    .extern func_020ae284
    .extern func_020ae90c
    .extern func_020ae9a4
    .extern func_020af478
    .extern func_020b1784
    .extern func_020b1924
    .extern func_020b2058
    .extern func_020b44e8
    .extern func_ov040_021fce00
    .extern func_ov040_021fce40
    .extern func_ov040_021fce74
    .extern func_ov040_021fd724
    .extern func_ov040_021fd740
    .extern func_ov040_021fd8ac
    .extern func_ov040_021fe1b0
    .extern func_ov040_02202ea4
    .global func_ov040_021fcebc
func_ov040_021fcebc: ; 0x021fcebc
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x24
    mov r10, r0
    mov r4, r1
    mov r9, r2
    bl func_ov040_021fce00
    ldr r1, .L_021fd6e4
    add r0, r10, #0x4c
    str r1, [r10, #0x0]
    bl VecFx32Object_Init
    add r0, r10, #0x5c
    bl VecFx32Object_Init
    add r0, r10, #0x74
    bl VecFx32Object_Init
    ldr r1, .L_021fd6e8
    add r0, r10, #0x84
    str r1, [sp, #0x0]
    mov r1, #0x1e
    mov r2, #0x10
    ldr r3, .L_021fd6ec
    bl __construct_array
    ldr r1, .L_021fd6e8
    add r0, r10, #0x660
    str r1, [sp, #0x0]
    mov r1, #0x1e
    mov r2, #0x10
    ldr r3, .L_021fd6ec
    bl __construct_array
    ldr r1, .L_021fd6f0
    add r0, r10, #0x64
    str r1, [sp, #0x0]
    add r0, r0, #0x800
    mov r1, #0x4
    mov r2, #0xc
    ldr r3, .L_021fd6f4
    bl __construct_array
    ldr r1, .L_021fd6f0
    add r0, r10, #0x94
    str r1, [sp, #0x0]
    add r0, r0, #0x800
    mov r1, #0x4
    mov r2, #0xc
    ldr r3, .L_021fd6f4
    bl __construct_array
    ldr r1, .L_021fd6e8
    add r0, r10, #0xc4
    str r1, [sp, #0x0]
    add r0, r0, #0x800
    mov r1, #0x1e
    mov r2, #0x10
    ldr r3, .L_021fd6ec
    bl __construct_array
    add r0, r10, #0x2c8
    add r0, r0, #0x800
    bl func_ov040_021fd724
    add r0, r10, #0x314
    add r0, r0, #0x800
    bl func_ov040_021fd724
    ldr r1, .L_021fd6e8
    add r0, r10, #0x354
    str r1, [sp, #0x0]
    add r0, r0, #0x800
    mov r1, #0x2
    mov r2, #0x10
    ldr r3, .L_021fd6ec
    bl __construct_array
    add r0, r10, #0x3d8
    add r0, r0, #0x800
    bl func_ov040_02202ea4
    add r0, r10, #0x37c
    add r0, r0, #0x1800
    bl GraphicsResourceSet_Init
    str r4, [r10, #0x48]
    str r4, [r10, #0xbd8]
    bl func_020ae9a4
    bl func_020ae90c
    mov r0, #0x1
    mov r2, r0
    mov r1, #0x0
    bl GX_SetGraphicsMode
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    mov r0, #0x10
    bic r1, r1, #0x1f00
    orr r1, r1, #0x1b00
    str r1, [r2, #0x0]
    bl GX_SetBankForBG
    mov r0, #0x0
    mov r1, r0
    mov r2, #0x1e
    mov r3, #0x2
    str r0, [sp, #0x0]
    bl func_ov040_021fce40
    ldr r4, .L_021fd6f8
    mov r1, #0x0
    ldrh r3, [r4, #0x0]
    mov r0, #0x1
    mov r2, #0x1c
    bic r3, r3, #0x3
    orr r3, r3, #0x2
    strh r3, [r4, #0x0]
    mov r3, r1
    str r1, [r4, #0xa]
    bl func_ov040_021fce74
    add r3, r4, #0x4
    ldrh r2, [r3, #0x0]
    mov r1, #0x0
    add r0, sp, #0x18
    bic r2, r2, #0x3
    strh r2, [r3, #0x0]
    str r1, [r3, #0xe]
    bl GraphicsResourceSet_Init
    ldr r3, .L_021fd6fc
    ldr r1, .L_021fd700
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, sp, #0x18
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r0, [sp, #0x18]
    ldr r4, [r0, #0x24]
    bl func_0207043c
    mov r2, r0
    mov r0, r4
    mov r1, #0x0
    bl func_020b1924
    bl func_020b44e8
    ldr r5, [sp, #0x1c]
    mov r0, r5
    bl GraphicsBgResourceData_GetDecoded
    mov r4, r0
    mov r0, r5
    bl func_02070888
    mov r2, r0
    mov r0, r4
    mov r1, #0x80
    bl func_020b2058
    bl func_020b44e8
    ldr r0, [sp, #0x20]
    mov r1, #0x4
    bl GraphicsBgMapResource_AddPaletteBankOffset
    bl func_020b44e8
    ldr r0, [sp, #0x20]
    mov r1, #0x1
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToMainBg
    bl func_020b44e8
    add r0, sp, #0x18
    bl GraphicsResourceSet_ReleaseHandles
    ldr r3, .L_021fd704
    add r0, r10, #0x37c
    ldr r1, .L_021fd700
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, r0, #0x1800
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    add r0, r10, #0x1000
    ldr r0, [r0, #0xb7c]
    ldr r4, [r0, #0x24]
    bl func_0207043c
    mov r2, r0
    mov r0, r4
    mov r1, #0x0
    bl func_020b1784
    bl func_020b44e8
    add r0, r10, #0x1000
    ldr r5, [r0, #0xb80]
    mov r0, r5
    bl GraphicsBgResourceData_GetDecoded
    mov r4, r0
    mov r0, r5
    bl func_02070888
    mov r2, r0
    mov r0, r4
    mov r1, #0x0
    bl func_020b2058
    bl func_020b44e8
    add r0, r10, #0x1000
    ldr r0, [r0, #0xb84]
    mov r1, #0x3
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToMainBg
    bl func_020b44e8
    mov r1, #0x0
    str r1, [r10, #0x30]
    mov r0, #0x6e
    str r0, [r10, #0x34]
    str r1, [r10, #0x38]
    mov r0, #0x100
    strh r0, [r10, #0x3c]
    strh r0, [r10, #0x3e]
    strh r1, [r10, #0x40]
    ldr r1, .L_021fd708
    str r9, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, r10
    sub r2, r1, #0xe
    add r3, r1, #0x1
    bl func_0209a208
    str r0, [r10, #0xb44]
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r0, #0x1d
    str r0, [sp, #0x4]
    mov r0, r10
    ldr r4, [r0, #0x0]
    ldr r1, [r10, #0xb44]
    ldr r4, [r4, #0x0]
    mov r2, #0x80000
    mov r3, #0xc0000
    blx r4
    ldr r3, [r10, #0xb44]
    mov r0, #0x4
    ldrh r2, [r3, #0x42]
    sub r8, r0, #0x1
    ldr r11, .L_021fd70c
    bic r0, r2, #0x4
    strh r0, [r3, #0x42]
    ldr r0, [r10, #0xb44]
    mvn r1, #0x31
    str r1, [r0, #0x44]
    mov r7, #0x2
    sub r6, r11, #0x12
    mov r5, #0x0
    mov r4, #0x10
.L_021fd258:
    str r9, [sp, #0x0]
    mov r0, r10
    mov r1, r11
    mov r2, r6
    add r3, r11, #0x1
    str r7, [sp, #0x4]
    bl func_0209a208
    add r1, r10, r8, lsl #0x2
    str r0, [r1, #0xb44]
    str r5, [sp, #0x0]
    str r4, [sp, #0x4]
    mov r0, r10
    ldr ip, [r0, #0x0]
    ldr r1, [r1, #0xb44]
    ldr ip, [ip, #0x0]
    mov r2, #0x80000
    mov r3, #0xc0000
    blx ip
    add r0, r10, r8, lsl #0x2
    ldr r1, [r0, #0xb44]
    sub r8, r8, #0x1
    ldrh r0, [r1, #0x42]
    cmp r8, #0x1
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    bge .L_021fd258
    mov r0, #0x0
    str r0, [r10, #0xb7c]
    str r0, [r10, #0xb80]
    str r0, [r10, #0xb84]
    str r0, [r10, #0xb9c]
    str r0, [r10, #0xb94]
    str r0, [r10, #0xb90]
    str r0, [r10, #0xb8c]
    str r0, [r10, #0xb88]
    str r0, [r10, #0xb78]
    str r0, [r10, #0xb74]
    str r0, [r10, #0xb98]
    str r0, [r10, #0xb38]
    str r0, [r10, #0xaa8]
    str r0, [r10, #0xaac]
    str r0, [r10, #0xab0]
    str r0, [r10, #0xab8]
    str r0, [r10, #0xabc]
    mov r1, #0x13c0
    str r9, [sp, #0x0]
    mov r2, #0x2
    str r2, [sp, #0x4]
    mov r0, r10
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a208
    str r0, [r10, #0xba0]
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, r10
    ldr r4, [r0, #0x0]
    ldr r1, [r10, #0xba0]
    ldr r4, [r4, #0x0]
    mov r2, #0x40000
    mov r3, #0x5c000
    blx r4
    ldr r3, [r10, #0xba0]
    mov r2, #0x3e8
    ldrh r0, [r3, #0x42]
    rsb r2, r2, #0x0
    mov r1, #0x0
    orr r0, r0, #0x4
    strh r0, [r3, #0x42]
    ldr r0, [r10, #0xba0]
    ldr r5, .L_021fd710
    str r2, [r0, #0x44]
    str r1, [r10, #0xbac]
    str r1, [r10, #0xba4]
    str r1, [r10, #0xb20]
    str r1, [r10, #0xb24]
    mov r0, #0x70
    str r0, [r10, #0xb28]
    str r0, [r10, #0xb2c]
    str r1, [r10, #0xb30]
    str r1, [r10, #0xb34]
    str r1, [r10, #0xb3c]
    str r1, [r10, #0xb40]
    str r1, [r10, #0xbb8]
    str r1, [r10, #0xbbc]
    str r1, [r10, #0xbb4]
    mov r0, #0x3
    ldr r11, .L_021fd714
    str r1, [r10, #0xbc0]
    sub r8, r0, #0x1
    rsb r6, r2, #0xf90
    mov r7, #0x2
    mov r4, r1
.L_021fd3d0:
    str r9, [sp, #0x0]
    mov r0, r10
    mov r1, r6
    mov r2, r5
    add r3, r5, #0x1
    str r7, [sp, #0x4]
    bl func_0209a208
    add r1, r10, r8, lsl #0x2
    str r0, [r1, #0xbc4]
    str r4, [sp, #0x0]
    str r4, [sp, #0x4]
    mov r0, r10
    ldr ip, [r0, #0x0]
    ldr r1, [r1, #0xbc4]
    ldr ip, [ip, #0x0]
    mov r2, r11
    mov r3, #0x60000
    blx ip
    add r1, r10, r8, lsl #0x2
    ldr r0, [r1, #0xbc4]
    str r8, [r0, #0x44]
    ldr r1, [r1, #0xbc4]
    subs r8, r8, #0x1
    ldrh r0, [r1, #0x42]
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    bpl .L_021fd3d0
    mov r1, #0x0
    add r0, sp, #0x8
    mov r3, r1
    mov r2, #0x6e000
    str r1, [r10, #0xbd0]
    bl VecFx32Object_InitComponents
    add r1, sp, #0x8
    add r0, r10, #0x74
    bl VecFx32Object_Assign
    add r0, sp, #0x8
    bl VecFx32Object_Destroy
    ldr r1, .L_021fd718
    mov r0, #0x0
    str r0, [r10, #0xadc]
    str r0, [r10, #0xae0]
    str r0, [r10, #0xae4]
    str r0, [r10, #0x860]
    str r9, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, r10
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a208
    str r0, [r10, #0xac0]
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, r10
    ldr r4, [r0, #0x0]
    ldr r1, [r10, #0xac0]
    ldr r4, [r4, #0x0]
    mov r2, #0x80000
    mov r3, #0xc0000
    blx r4
    ldr r4, [r10, #0xac0]
    ldr r1, .L_021fd718
    ldrh r3, [r4, #0x42]
    mov r2, #0x2
    mov r0, r10
    orr r3, r3, #0x4
    strh r3, [r4, #0x42]
    str r9, [sp, #0x0]
    str r2, [sp, #0x4]
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a208
    str r0, [r10, #0xac4]
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r0, #0x1
    str r0, [sp, #0x4]
    mov r0, r10
    ldr r4, [r0, #0x0]
    ldr r1, [r10, #0xac4]
    ldr r4, [r4, #0x0]
    mov r2, #0x80000
    mov r3, #0xc0000
    blx r4
    ldr r0, [r10, #0xac4]
    mov r4, #0x96
    ldr r1, [r0, #0xc]
    mov r2, #0x100
    ldrh r0, [r1, #0x24]
    ldr r6, .L_021fd71c
    mov r7, #0x2
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r3, [r10, #0xac4]
    mov r0, #0x4
    ldrh r1, [r3, #0x42]
    sub r8, r0, #0x1
    mov r11, #0x80000
    orr r1, r1, #0x4
    strh r1, [r3, #0x42]
    ldr r3, [r10, #0xac4]
    mov r1, #0x0
    str r4, [r3, #0x44]
    ldr r3, [r10, #0xac4]
    mov r5, r1
    strh r2, [r3, #0x3c]
    strh r2, [r3, #0x3e]
    str r1, [r10, #0xad4]
    str r1, [r10, #0xad8]
    mov r4, r1
.L_021fd590:
    str r9, [sp, #0x0]
    mov r0, r10
    mov r1, r6
    add r2, r6, #0x1
    add r3, r6, #0x2
    str r7, [sp, #0x4]
    bl func_0209a208
    add r1, r10, r8, lsl #0x2
    str r0, [r1, #0xae8]
    str r5, [sp, #0x0]
    str r5, [sp, #0x4]
    mov r0, r10
    ldr ip, [r0, #0x0]
    ldr r1, [r1, #0xae8]
    ldr ip, [ip, #0x0]
    mov r2, r11
    mov r3, #0xc0000
    blx ip
    add r2, r10, r8, lsl #0x2
    ldr r1, [r2, #0xae8]
    subs r8, r8, #0x1
    ldrh r0, [r1, #0x42]
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    str r4, [r2, #0xaf8]
    bpl .L_021fd590
    str r4, [r10, #0xb08]
    str r4, [r10, #0x70]
    mov r0, r10
    str r4, [r10, #0xaa4]
    bl func_ov040_021fd8ac
    mov r1, #0x1000
    ldr r0, .L_021fd720
    str r1, [r10, #0x848]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r10, #0xb10]
    beq .L_021fd6c8
    ldr r3, [r0, #0x29c]
    mov r0, #0x2
    str r9, [sp, #0x0]
    str r0, [sp, #0x4]
    ldrh r1, [r3, #0x2]
    ldrh r2, [r3, #0x4]
    ldrh r3, [r3, #0x6]
    mov r0, r10
    bl func_0209a208
    str r0, [r10, #0xb10]
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r0, #0x13
    str r0, [sp, #0x4]
    mov r0, r10
    ldr r4, [r0, #0x0]
    ldr r1, [r10, #0xb10]
    ldr r4, [r4, #0x0]
    mov r2, #0x80000
    mov r3, #0x61000
    blx r4
    ldr r0, [r10, #0xb10]
    mov r1, #0x2
    ldr r2, [r0, #0xc]
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x2
    strh r0, [r2, #0x24]
    ldr r2, [r10, #0xb10]
    ldrh r0, [r2, #0x42]
    bic r0, r0, #0x4
    strh r0, [r2, #0x42]
    ldr r0, [r10, #0xb10]
    ldr r0, [r0, #0xc]
    strb r1, [r0, #0x3a]
    ldr r0, [r10, #0xb10]
    ldr r0, [r0, #0x14]
    bl func_020708c4
.L_021fd6c8:
    mov r0, r10
    bl func_ov040_021fe1b0
    add r0, sp, #0x18
    bl GraphicsResourceSet_Destroy
    mov r0, r10
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021fd6e4: .word data_ov040_022042a8
.L_021fd6e8: .word VecFx32Object_Destroy
.L_021fd6ec: .word VecFx32Object_Init
.L_021fd6f0: .word func_ov040_021fd740
.L_021fd6f4: .word func_ov040_021fd724
.L_021fd6f8: .word 0x400000a
.L_021fd6fc: .word 0xa080
.L_021fd700: .word data_020f4e18
.L_021fd704: .word 0xa083
.L_021fd708: .word 0x100f
.L_021fd70c: .word 0x1013
.L_021fd710: .word 0x1379
.L_021fd714: .word 0x186000
.L_021fd718: .word 0x1655
.L_021fd71c: .word 0x1652
.L_021fd720: .word data_021052fc
    .size func_ov040_021fcebc, . - func_ov040_021fcebc

