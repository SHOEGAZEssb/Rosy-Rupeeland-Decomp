; Matching retail form; see src/game/sub_dual_layer_resource_renderer.c.
.text
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load
.extern func_020b44e8
.extern GraphicsBgMapResource_UploadToSubBg
.extern GraphicsResourceSet_ReleaseHandles
.extern GraphicsBgCharacterResource_UploadToSubBg
.extern GraphicsBgResourceData_GetDecoded
.extern MIi_CpuCopy16
.extern DualLayerTileRenderer_UploadPalette
.extern GraphicsResourceSet_Destroy
.extern data_020f4e18

    .global SubDualLayerResourceRenderer_LoadBgResources
    .type SubDualLayerResourceRenderer_LoadBgResources, @function
SubDualLayerResourceRenderer_LoadBgResources: ; 0x0202bc98
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r4, r0
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r5, .L_0202be54
    ldr r3, .L_0202be58
    ldrh r2, [r5, #0x0]
    ldr r1, .L_0202be5c
    add r0, sp, #0x4
    and r2, r2, #0x43
    orr r2, r2, #0x5800
    strh r2, [r5, #0x0]
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    mov r1, #0x0
    ldr r0, [sp, #0xc]
    mov r2, r1
    bl GraphicsBgMapResource_UploadToSubBg
    mov r2, r5
    ldrh r1, [r2, #0x0]
    sub r3, r2, #0x8
    add r0, sp, #0x4
    bic r1, r1, #0x3
    orr r1, r1, #0x3
    strh r1, [r2, #0x0]
    ldr r2, [r3, #0x0]
    ldr r1, [r3, #0x0]
    and r2, r2, #0x1f00
    mov r5, r2, lsr #0x8
    bic r2, r1, #0x1f00
    orr r1, r5, #0x1
    orr r1, r2, r1, lsl #0x8
    str r1, [r3, #0x0]
    bl GraphicsResourceSet_ReleaseHandles
    ldr r5, .L_0202be60
    ldr r3, .L_0202be64
    ldrh r2, [r5, #0x0]
    ldr r1, .L_0202be5c
    add r0, sp, #0x4
    and r2, r2, #0x43
    orr r2, r2, #0xa10
    orr r2, r2, #0x5000
    strh r2, [r5, #0x0]
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    ldr r0, [sp, #0xc]
    mov r1, #0x0
    ldr r0, [r0, #0x24]
    b .L_0202bda8
.L_0202bd7c:
    ldrh r3, [r0, #0x0]
    add r1, r1, #0x1
    mov r2, r3, lsl #0x10
    mov r2, r2, lsr #0x1c
    add r2, r2, #0x6
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bic r3, r3, #0xf000
    mov r2, r2, lsl #0x1c
    orr r2, r3, r2, lsr #0x10
    strh r2, [r0], #0x2
.L_0202bda8:
    ldr r2, [sp, #0xc]
    ldr r2, [r2, #0x20]
    ldr r3, [r2, #0xc]
    ldr r2, [r2, #0x10]
    mul r2, r3, r2
    cmp r1, r2
    blt .L_0202bd7c
    bl func_020b44e8
    ldr r0, [sp, #0x4]
    mov r1, #0x1
    mov r2, #0x0
    bl GraphicsBgCharacterResource_UploadToSubBg
    ldr r0, [sp, #0xc]
    mov r1, #0x1
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToSubBg
    ldr r5, [r4, #0x14]
    ldr r0, [sp, #0x8]
    bl GraphicsBgResourceData_GetDecoded
    add r1, r5, #0x140
    add r0, r0, #0x80
    mov r2, #0xc0
    bl MIi_CpuCopy16
    mov r0, r4
    bl DualLayerTileRenderer_UploadPalette
    ldr r2, .L_0202be60
    add r0, sp, #0x4
    ldrh r1, [r2, #0x0]
    sub r3, r2, #0xa
    bic r1, r1, #0x3
    orr r1, r1, #0x3
    strh r1, [r2, #0x0]
    ldr r2, [r3, #0x0]
    ldr r1, [r3, #0x0]
    and r2, r2, #0x1f00
    mov r4, r2, lsr #0x8
    bic r2, r1, #0x1f00
    orr r1, r4, #0x2
    orr r1, r2, r1, lsl #0x8
    str r1, [r3, #0x0]
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_0202be54: .word 0x4001008
.L_0202be58: .word 0xa011
.L_0202be5c: .word data_020f4e18
.L_0202be60: .word 0x400100a
.L_0202be64: .word 0xa014
    .size SubDualLayerResourceRenderer_LoadBgResources, . - SubDualLayerResourceRenderer_LoadBgResources
