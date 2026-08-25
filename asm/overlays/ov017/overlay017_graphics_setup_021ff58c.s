    .text
/* Exact fallback; see src/overlays/ov017/overlay017_graphics_setup.c. */
    .extern G3X_Init
    .extern GX_SetBankForBG
    .extern GX_SetGraphicsMode
    .extern GraphicsResourceSet_Apply
    .extern GraphicsResourceSet_Destroy
    .extern GraphicsResourceSet_Init
    .extern GraphicsResourceSet_Load
    .extern data_020f4e18
    .extern GraphicsResourceSet_ApplyToMainBg
    .extern TitleDisplay_ConfigureSub2dEngine
    .extern TitleDisplay_ResetMainBgScroll
    .extern TitleDisplay_ResetSubBgScroll
    .extern TitleDisplay_SetMainBgPriorities
    .extern TitleDisplay_SetSubBgPriorities
    .extern TitlePalette_SetSubBackdrop
    .extern func_020af1f8
    .extern func_020b0300
    .extern func_020b44e8
.global Overlay017_SetupGraphics
Overlay017_SetupGraphics:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r4, r0
    bl G3X_Init
    ldr ip, L_021ff730
    ldr r0, L_021ff734
    ldrh r1, [ip, #0x0]
    ldr lr, L_021ff738
    mov r5, #0x2
    and r1, r1, r0
    strh r1, [ip, #0x0]
    ldrh r1, [ip, #0x0]
    mov r2, r0, lsr #0x11
    mov r0, #0x0
    bic r1, r1, #0x3000
    orr r1, r1, #0x10
    strh r1, [ip, #0x0]
    ldrh r6, [ip, #0x0]
    mov r1, #0x1f
    mov r3, #0x3f
    bic r6, r6, #0x3000
    orr r6, r6, #0x8
    strh r6, [ip, #0x0]
    ldrh r6, [ip, #0x0]
    and r6, r6, lr
    strh r6, [ip, #0x0]
    str r5, [ip, #0x4e0]
    str r0, [sp, #0x0]
    bl func_020b0300
    ldr r3, L_021ff73c
    mov r1, #0x0
    ldr r2, L_021ff740
    str r1, [r3, #0x0]
    mov r0, #0x1
    str r2, [r3, #0xbc]
    mov r2, r0
    bl GX_SetGraphicsMode
    mov r0, #0x19
    str r0, [r4, #0x48]
    mov r0, #0x10
    bl GX_SetBankForBG
    mov r0, #0x40
    bl func_020af1f8
    ldr r1, L_021ff744
    ldrh r0, [r1, #0x0]
    and r0, r0, #0x43
    orr r0, r0, #0x1c00
    strh r0, [r1, #0x0]
    bl TitleDisplay_ResetMainBgScroll
    mov r0, r5
    mov r1, #0x1
    mov r2, #0x0
    mov r3, #0x3
    bl TitleDisplay_SetMainBgPriorities
    ldr r2, L_021ff748
    mov r0, #0x0
    mov r1, #0x10
    strh r0, [r2, #0x0]
    str r1, [r4, #0x4c]
    bl TitleDisplay_ConfigureSub2dEngine
    ldr r1, L_021ff74c
    ldrh r0, [r1, #0x0]
    and r0, r0, #0x43
    orr r0, r0, #0x1e00
    strh r0, [r1, #0x0]
    bl TitleDisplay_ResetSubBgScroll
    mov r0, #0x0
    mov r1, #0x1
    mov r2, r5
    mov r3, #0x3
    bl TitleDisplay_SetSubBgPriorities
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r1, L_021ff750
    mov r2, #0x8000
    ldr r0, L_021ff754
    str r1, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, sp, #0x4
    add r3, r2, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    add r0, sp, #0x4
    mov r1, r5
    mov r2, #0x0
    bl GraphicsResourceSet_ApplyToMainBg
    ldr r3, L_021ff758
    ldr r1, L_021ff754
    str r3, [sp, #0x0]
    sub r2, r3, #0x7
    ldr r1, [r1, #0x0]
    add r0, sp, #0x4
    sub r3, r3, #0x6
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    add r0, sp, #0x4
    mov r1, #0x3
    mov r2, #0x0
    bl GraphicsResourceSet_Apply
    mov r0, #0x0
    bl TitlePalette_SetSubBackdrop
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
L_021ff730: .word 0x4000060
L_021ff734: .word 0xffffcffd
L_021ff738: .word 0xcfdf
L_021ff73c: .word 0x40004c4
L_021ff740: .word 0xbfff0000
L_021ff744: .word 0x400000c
L_021ff748: .word 0x4000050
L_021ff74c: .word 0x400100e
L_021ff750: .word 0x8002
L_021ff754: .word data_020f4e18
L_021ff758: .word 0x8019
    .size Overlay017_SetupGraphics, . - Overlay017_SetupGraphics
