    .text

/* Exact fallback; see src/overlays/ov016/overlay016_mode_graphics.c. */
    .extern GraphicsResourceSet_Destroy
    .extern GraphicsResourceSet_Init
    .extern GraphicsResourceSet_Load
    .extern data_020f4e18
    .extern GraphicsBgMapResource_AddPaletteBankOffset
    .extern func_02072048
    .extern TitleDisplay_ResetMainBgScroll
    .extern TitleDisplay_SetMainBgPriorities
    .extern func_020b44e8
    .extern func_ov016_021fd188
    .extern func_ov016_021ff04c
    .extern Overlay016_ConfigureMainBg3
.global func_ov016_021ff094
func_ov016_021ff094:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    mov r0, #0x0
    bl func_ov016_021ff04c
    mov r0, #0x0
    mov ip, #0x1c
    mov r1, r0
    mov r2, #0x1e
    mov r3, #0x4
    str ip, [r4, #0x48]
    bl Overlay016_ConfigureMainBg3
    bl TitleDisplay_ResetMainBgScroll
    mov r0, #0x0
    mov r1, r0
    mov r2, #0x2
    mov r3, #0x3
    bl TitleDisplay_SetMainBgPriorities
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r3, L_021ff170
    ldr r1, L_021ff174
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    ldr r0, [sp, #0xc]
    mov r1, #0x8
    bl GraphicsBgMapResource_AddPaletteBankOffset
    bl func_020b44e8
    add r0, sp, #0x4
    mov r1, #0x3
    mov r2, #0x100
    bl func_02072048
    ldr r3, L_021ff178
    ldr r1, L_021ff174
    str r3, [sp, #0x0]
    sub r2, r3, #0x5
    ldr r1, [r1, #0x0]
    add r0, sp, #0x4
    sub r3, r3, #0x4
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    add r0, sp, #0x4
    mov r1, #0x2
    mov r2, #0x0
    bl func_02072048
    ldr r0, [r4, #0x444]
    bl func_ov016_021fd188
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
L_021ff170: .word 0x8006
L_021ff174: .word data_020f4e18
L_021ff178: .word 0x8017

    .size func_ov016_021ff094, . - func_ov016_021ff094
