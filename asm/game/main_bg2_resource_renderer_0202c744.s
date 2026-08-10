; Matching retail form; see src/game/main_bg2_resource_renderer.c.
.text
.extern DualLayerTileRendererBase_InitBase
.extern gMainBg0ResourceRendererVtable

    .global MainBg0ResourceRenderer_Init
    .type MainBg0ResourceRenderer_Init, @function
MainBg0ResourceRenderer_Init: ; 0x0202c744
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRendererBase_InitBase
    ldr r1, .L_0202c760
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_0202c760: .word gMainBg0ResourceRendererVtable
    .size MainBg0ResourceRenderer_Init, . - MainBg0ResourceRenderer_Init
