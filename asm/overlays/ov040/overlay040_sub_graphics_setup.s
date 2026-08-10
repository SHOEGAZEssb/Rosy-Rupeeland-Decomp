    .text
/* Exact fallback; see overlay040_state_setup.c for portable C. */
    .extern GraphicsResourceSet_Destroy
    .extern GraphicsResourceSet_Init
    .extern GraphicsResourceSet_Load
    .extern GX_SetBankForSubBG
    .extern GXS_SetGraphicsMode
    .extern data_020f4dc8
    .extern data_020f4e18
    .extern DisplayBrightness_StartTransition
    .extern DisplayBrightnessPair_GetScreen
    .extern func_0207043c
    .extern func_02070874
    .extern func_02070888
    .extern func_02070eac
    .extern func_02072000
    .extern GraphicsSpriteState_SetAnimationIndex
    .extern GraphicsSpriteRenderer_GetObjectPaletteAddress
    .extern func_0209a208
    .extern func_020aea7c
    .extern func_020afd28
    .extern func_020b198c
    .extern func_020b1ff0
    .extern func_020b44e8
    .extern func_ov040_0220255c
    .extern gDebugFont

.global func_ov040_02202640
func_ov040_02202640: ; 0x02202640
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x24
    mov r5, r0
    mov r0, #0x0
    mov r4, r1
    bl GXS_SetGraphicsMode
    ldr r2, .L_022029e4
    mov r0, #0x4
    ldr r1, [r2, #0x0]
    bic r1, r1, #0x1f00
    orr r1, r1, #0x1100
    str r1, [r2, #0x0]
    bl GX_SetBankForSubBG
    mov r0, #0x80
    bl func_020aea7c
    mov r0, #0x1
    str r0, [sp, #0x0]
    mov r0, #0x0
    mov r1, r0
    mov r2, #0x1c
    mov r3, r0
    bl func_ov040_0220255c
    ldr r3, .L_022029e8
    mov r1, #0x0
    ldrh r2, [r3, #0x0]
    add r0, sp, #0x18
    bic r2, r2, #0x3
    orr r2, r2, #0x3
    strh r2, [r3, #0x0]
    str r1, [r3, #0x8]
    bl GraphicsResourceSet_Init
    ldr r3, .L_022029ec
    ldr r1, .L_022029f0
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, sp, #0x18
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r0, [sp, #0x18]
    ldr r6, [r0, #0x24]
    bl func_0207043c
    mov r2, r0
    mov r0, r6
    mov r1, #0x0
    bl func_020b198c
    bl func_020b44e8
    ldr r7, [sp, #0x1c]
    mov r0, r7
    bl func_02070874
    mov r6, r0
    mov r0, r7
    bl func_02070888
    mov r2, r0
    mov r0, r6
    mov r1, #0x0
    bl func_020b1ff0
    bl func_020b44e8
    mov r1, #0x0
    ldr r0, [sp, #0x20]
    mov r2, r1
    bl func_02070eac
    bl func_020b44e8
    add r0, sp, #0x18
    bl func_02072000
    mov r2, #0x0
    mov r0, #0x1000
    str r0, [sp, #0x8]
    str r2, [sp, #0xc]
    str r2, [sp, #0x10]
    str r0, [sp, #0x14]
    str r2, [sp, #0x0]
    ldr r0, .L_022029f4
    add r1, sp, #0x8
    mov r3, r2
    str r2, [sp, #0x4]
    bl func_020afd28
    mov r2, #0x0
    str r2, [sp, #0x0]
    ldr r0, .L_022029f8
    add r1, sp, #0x8
    mov r3, r2
    str r2, [sp, #0x4]
    bl func_020afd28
    ldr r0, .L_022029fc
    mov r1, #0x1
    bl DisplayBrightnessPair_GetScreen
    mvn r1, #0xf
    mov r2, #0x0
    mov r3, #0xa
    bl DisplayBrightness_StartTransition
    ldr r1, .L_02202a00
    str r4, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, r5
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a208
    str r0, [r5, #0x58]
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, r5
    ldr ip, [r0, #0x0]
    ldr r1, [r5, #0x58]
    ldr ip, [ip, #0x0]
    mov r2, #0xdc000
    mov r3, #0x5f000
    blx ip
    ldr r1, .L_02202a00
    str r4, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, r5
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a208
    str r0, [r5, #0x5c]
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r0, #0x3
    str r0, [sp, #0x4]
    mov r0, r5
    ldr ip, [r0, #0x0]
    ldr r1, [r5, #0x5c]
    ldr ip, [ip, #0x0]
    mov r2, #0x1c000
    mov r3, #0x5f000
    blx ip
    ldr r1, .L_02202a00
    str r4, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, r5
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a208
    str r0, [r5, #0x60]
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, r5
    ldr ip, [r0, #0x0]
    ldr r1, [r5, #0x60]
    ldr ip, [ip, #0x0]
    mov r2, #0x80000
    mov r3, #0xab000
    blx ip
    ldr r0, [r5, #0x60]
    mov r1, #0x6
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, .L_02202a04
    str r4, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, r5
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a208
    str r0, [r5, #0x64]
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, r5
    ldr r1, [r5, #0x64]
    mov r2, #0x80000
    mov r3, #0xf000
    ldr ip, [r0, #0x0]
    ldr ip, [ip, #0x0]
    blx ip
    str r4, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, r5
    ldr r1, .L_02202a04
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a208
    str r0, [r5, #0x68]
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r0, #0x5
    str r0, [sp, #0x4]
    mov r0, r5
    ldr r1, [r5, #0x68]
    mov r2, #0x80000
    mov r3, #0x70000
    ldr ip, [r0, #0x0]
    ldr ip, [ip, #0x0]
    blx ip
    str r4, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, r5
    ldr r1, .L_02202a04
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a208
    str r0, [r5, #0x6c]
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r0, #0x6
    str r0, [sp, #0x4]
    mov r0, r5
    ldr r1, [r5, #0x6c]
    mov r2, #0x80000
    mov r3, #0x60000
    ldr r4, [r0, #0x0]
    ldr r4, [r4, #0x0]
    blx r4
    ldr r0, .L_02202a08
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_GetObjectPaletteAddress
    ldr r2, .L_02202a0c
    mov r1, #0xa0
    strh r2, [r0, #0x8]
    sub r0, r2, #0x400
    str r0, [r5, #0x70]
    str r0, [r5, #0x74]
    str r0, [r5, #0x78]
    str r0, [r5, #0x7c]
    str r0, [r5, #0x84]
    str r1, [r5, #0x80]
    mov r1, #0x0
    add r0, sp, #0x18
    str r1, [r5, #0x50]
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_022029e4: .word 0x4001000
.L_022029e8: .word 0x4001008
.L_022029ec: .word 0x9066
.L_022029f0: .word data_020f4e18
.L_022029f4: .word 0x4001020
.L_022029f8: .word 0x4001030
.L_022029fc: .word data_020f4dc8
.L_02202a00: .word 0x13c3
.L_02202a04: .word 0x13c6
.L_02202a08: .word gDebugFont
.L_02202a0c: .word 0x3ff
    .size func_ov040_02202640, . - func_ov040_02202640
