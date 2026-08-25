    .text

/* Exact fallback; see src/overlays/ov016/overlay016_mode_graphics.c. */
    .extern GraphicsResourceSet_Destroy
    .extern GraphicsResourceSet_Init
    .extern GraphicsResourceSet_Load
    .extern data_020f4e18
    .extern GraphicsBgMapResource_AddPaletteBankOffset
    .extern GraphicsResourceSet_ApplyToMainBg
    .extern TitleDisplay_ResetMainBgScroll
    .extern TitleDisplay_SetMainBgPriorities
    .extern func_020afd0c
    .extern func_020b44e8
    .extern func_ov016_021fd1e0
    .extern Overlay016_ConfigureMainBg3
.global Overlay016_SetupAlternateModeGraphics
Overlay016_SetupAlternateModeGraphics:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    mov r0, #0x0
    mov ip, #0x1c
    mov r1, r0
    mov r2, #0x1e
    mov r3, #0x4
    str ip, [r4, #0x48]
    bl Overlay016_ConfigureMainBg3
    bl TitleDisplay_ResetMainBgScroll
    mov r0, #0x0
    ldr r2, L_021ff274
    mov r3, #0x380000
    str r3, [r2, #0x0]
    mov r1, r0
    mov r2, #0x3
    mov r3, #0x2
    bl TitleDisplay_SetMainBgPriorities
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r3, L_021ff278
    ldr r1, L_021ff27c
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    add r0, sp, #0x4
    mov r1, #0x2
    mov r2, #0x0
    bl GraphicsResourceSet_ApplyToMainBg
    ldr r3, L_021ff280
    ldr r1, L_021ff27c
    str r3, [sp, #0x0]
    sub r2, r3, #0xb
    ldr r1, [r1, #0x0]
    add r0, sp, #0x4
    sub r3, r3, #0xa
    bl GraphicsResourceSet_Load
    ldr r0, [sp, #0xc]
    mov r1, #0x8
    bl GraphicsBgMapResource_AddPaletteBankOffset
    bl func_020b44e8
    add r0, sp, #0x4
    mov r1, #0x3
    mov r2, #0x100
    bl GraphicsResourceSet_ApplyToMainBg
    mov r2, #0xc
    ldr r0, L_021ff284
    str r2, [sp, #0x0]
    mov r1, #0x0
    mov r3, #0x4
    bl func_020afd0c
    ldr r0, [r4, #0x444]
    bl func_ov016_021fd1e0
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
L_021ff274: .word 0x4000018
L_021ff278: .word 0x800a
L_021ff27c: .word data_020f4e18
L_021ff280: .word 0x801d
L_021ff284: .word 0x4000050
    .size Overlay016_SetupAlternateModeGraphics, . - Overlay016_SetupAlternateModeGraphics

