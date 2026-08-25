    .text
/* Exact fallback; see src/overlays/ov021/overlay021_graphics_setup.c. */
    .extern GraphicsResourceSet_Destroy
    .extern GraphicsResourceSet_Init
    .extern GraphicsResourceSet_Load
    .extern data_020f4e18
    .extern GraphicsResourceSet_ApplyToMainBg
    .extern TitleDisplay_SetMainBgPriorities
    .extern func_020afd0c
    .extern func_020b44e8
    .extern Overlay021_ConfigureMainBg1
    .extern func_ov021_021ff5b8

.global Overlay021_SetupPrimarySelectionBackground
Overlay021_SetupPrimarySelectionBackground:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r1, #0x3
    mov r4, r0
    mov r2, r1
    mov r3, r1
    mov r0, #0x0
    bl TitleDisplay_SetMainBgPriorities
    mov r0, #0x0
    mov ip, #0x1
    mov r1, r0
    mov r3, r0
    mov r2, #0x1c
    str ip, [sp, #0x0]
    bl Overlay021_ConfigureMainBg1
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r3, L_021fe44c
    ldr r1, L_021fe450
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
    bl GraphicsResourceSet_ApplyToMainBg
    mov r0, #0x20
    str r0, [r4, #0x3fc]
    mov r0, #0x12
    str r0, [r4, #0x48]
    mov r0, #0xc
    str r0, [sp, #0x0]
    ldr r0, L_021fe454
    mov r1, #0x0
    mov r2, #0x2
    mov r3, #0x4
    bl func_020afd0c
    mov r0, r4
    bl func_ov021_021ff5b8
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
L_021fe44c: .word 0x800a
L_021fe450: .word data_020f4e18
L_021fe454: .word 0x4000050
    .size Overlay021_SetupPrimarySelectionBackground, . - Overlay021_SetupPrimarySelectionBackground

