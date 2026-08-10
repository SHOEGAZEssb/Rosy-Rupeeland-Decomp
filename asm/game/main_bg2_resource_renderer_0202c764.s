; Matching retail form; see src/game/main_bg2_resource_renderer.c.
.text
.extern DualLayerTileRendererBase_Destroy

    .global MainBg0ResourceRenderer_DestroyComplete
    .type MainBg0ResourceRenderer_DestroyComplete, @function
MainBg0ResourceRenderer_DestroyComplete: ; 0x0202c764
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRendererBase_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size MainBg0ResourceRenderer_DestroyComplete, . - MainBg0ResourceRenderer_DestroyComplete
