    .text
/* Exact fallback; see src/overlays/ov021/overlay021_graphics_setup.c. */
    .extern GraphicsResourceSet_Destroy
    .extern GraphicsResourceSet_Init
    .extern GraphicsResourceSet_Load
    .extern data_020f4e18
    .extern func_02072048
    .extern func_02092638
    .extern func_020afd0c
    .extern func_020b44e8
    .extern func_ov021_021fe268
    .extern func_ov021_021ff644

.global Overlay021_RefreshSelectionBackground
Overlay021_RefreshSelectionBackground:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r1, #0x3
    mov r4, r0
    mov r2, r1
    mov r3, r1
    mov r0, #0x0
    bl func_02092638
    mov r0, #0x0
    mov ip, #0x1
    mov r1, r0
    mov r3, r0
    mov r2, #0x1c
    str ip, [sp, #0x0]
    bl func_ov021_021fe268
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r3, L_021fe514
    ldr r1, L_021fe518
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
    mov r0, #0x20
    str r0, [r4, #0x3fc]
    mov r0, #0x12
    str r0, [r4, #0x48]
    mov r0, #0xc
    str r0, [sp, #0x0]
    ldr r0, L_021fe51c
    mov r1, #0x0
    mov r2, #0x2
    mov r3, #0x4
    bl func_020afd0c
    mov r0, r4
    bl func_ov021_021ff644
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
L_021fe514: .word 0x800a
L_021fe518: .word data_020f4e18
L_021fe51c: .word 0x4000050
    .size Overlay021_RefreshSelectionBackground, . - Overlay021_RefreshSelectionBackground

