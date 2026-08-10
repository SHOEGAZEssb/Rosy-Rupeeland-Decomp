; Matching retail form; see src/game/main_dual_layer_resource_renderer_alt.c.
.text
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load
.extern func_020b44e8
.extern func_02070638
.extern func_02070e0c
.extern func_02070874
.extern PaletteBuffer_Write
.extern GraphicsResourceSet_ReleaseHandles
.extern GraphicsResourceSet_Destroy
.extern data_020f4e18
.extern gMainBgPaletteBuffer

    .global MainDualLayerResourceRendererAlt_LoadBgResources
    .type MainDualLayerResourceRendererAlt_LoadBgResources, @function
MainDualLayerResourceRendererAlt_LoadBgResources: ; 0x0202c388
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r4, .L_0202c4d8
    mov lr, #0x4000000
    ldrh r1, [r4, #0x0]
    ldr r0, .L_0202c4dc
    ldr r2, .L_0202c4e0
    and r1, r1, #0x43
    orr r1, r1, #0x8
    orr r1, r1, #0x1800
    strh r1, [r4, #0x0]
    ldrh r3, [r4, #0x0]
    add r1, r0, #0x8800
    ldr r0, .L_0202c4e4
    bic r3, r3, #0x3
    orr r3, r3, #0x3
    strh r3, [r4, #0x0]
    ldr ip, [lr, #0x0]
    ldr r3, [lr, #0x0]
    and ip, ip, #0x1f00
    mov r4, ip, lsr #0x8
    bic ip, r3, #0x1f00
    orr r3, r4, #0x1
    orr r3, ip, r3, lsl #0x8
    str r3, [lr, #0x0]
    str r1, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, sp, #0x4
    add r3, r2, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    mov r1, #0x0
    ldr r0, [sp, #0x4]
    mov r2, r1
    bl func_02070638
    mov r1, #0x0
    ldr r0, [sp, #0xc]
    mov r2, r1
    bl func_02070e0c
    ldr r0, [sp, #0x8]
    bl func_02070874
    add r1, r0, #0x180
    ldr r0, .L_0202c4e8
    mov r2, #0x180
    mov r3, #0x80
    bl PaletteBuffer_Write
    add r0, sp, #0x4
    bl GraphicsResourceSet_ReleaseHandles
    ldr r1, .L_0202c4ec
    mov r2, #0x4000000
    ldrh r0, [r1, #0x0]
    and r0, r0, #0x43
    orr r0, r0, #0x1a00
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x0]
    bic r0, r0, #0x3
    strh r0, [r1, #0x0]
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x2
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    ldr r1, .L_0202c4f0
    ldr r0, .L_0202c4e4
    str r1, [sp, #0x0]
    mov r2, #0xa000
    ldr r1, [r0, #0x0]
    add r0, sp, #0x4
    add r3, r2, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r0, [sp, #0xc]
    mov r1, #0x1
    mov r2, #0x0
    bl func_02070e0c
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_0202c4d8: .word 0x4000008
.L_0202c4dc: .word 0x1808
.L_0202c4e0: .word 0xa006
.L_0202c4e4: .word data_020f4e18
.L_0202c4e8: .word gMainBgPaletteBuffer
.L_0202c4ec: .word 0x400000a
.L_0202c4f0: .word 0xa002
    .size MainDualLayerResourceRendererAlt_LoadBgResources, . - MainDualLayerResourceRendererAlt_LoadBgResources
