    .text
/* Exact fallback; see src/overlays/ov020/overlay020_scene_runtime_helpers.c. */
    .extern GraphicsResourceSet_Apply
    .extern GraphicsResourceSet_Destroy
    .extern GraphicsResourceSet_Init
    .extern GraphicsResourceSet_Load
    .extern data_020f4e18
    .extern GraphicsBgMapResource_AddPaletteBankOffset
    .extern GraphicsResourceSet_ApplyToMainBg
    .extern func_020b44e8

.global Overlay020_LoadGraphicsResources
Overlay020_LoadGraphicsResources:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x10
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r3, L_021fde5c
    ldr r0, L_021fde60
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    ldr r0, [sp, #0xc]
    mov r1, #0x8
    bl GraphicsBgMapResource_AddPaletteBankOffset
    bl func_020b44e8
    add r0, sp, #0x4
    mov r1, #0x1
    mov r2, #0x100
    bl GraphicsResourceSet_Apply
    ldr r3, L_021fde64
    ldr r1, L_021fde60
    str r3, [sp, #0x0]
    sub r2, r3, #0x1
    ldr r1, [r1, #0x0]
    add r0, sp, #0x4
    sub r3, r3, #0x3
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    add r0, sp, #0x4
    mov r1, #0x3
    mov r2, #0x0
    bl GraphicsResourceSet_ApplyToMainBg
    add r0, sp, #0x4
    mov r1, #0x3
    mov r2, #0x0
    bl GraphicsResourceSet_Apply
    ldr r3, L_021fde68
    ldr r1, L_021fde60
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    add r0, sp, #0x4
    mov r1, #0x2
    mov r2, #0x0
    bl GraphicsResourceSet_ApplyToMainBg
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r3, pc}
L_021fde5c: .word 0x803f
L_021fde60: .word data_020f4e18
L_021fde64: .word 0x802f
L_021fde68: .word 0x802d
    .size Overlay020_LoadGraphicsResources, . - Overlay020_LoadGraphicsResources

