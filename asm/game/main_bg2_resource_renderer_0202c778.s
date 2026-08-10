; Matching retail form; see src/game/main_bg2_resource_renderer.c.
.text
.extern DualLayerTileRendererBase_Destroy
.extern Heap_Free

    .global MainBg0ResourceRenderer_DestroyAndFree
    .type MainBg0ResourceRenderer_DestroyAndFree, @function
MainBg0ResourceRenderer_DestroyAndFree: ; 0x0202c778
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DualLayerTileRendererBase_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size MainBg0ResourceRenderer_DestroyAndFree, . - MainBg0ResourceRenderer_DestroyAndFree
