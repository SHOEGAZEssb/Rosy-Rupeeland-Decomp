; Matching retail form; see src/game/runtime_presentation_dispatch.c.
.text
.extern Heap_Free
.extern func_0201dc58
.extern func_0201dde4
.extern func_020a2324
.extern func_020a2348
.extern func_020a23a8
.extern GX_SetGraphicsMode
.extern gRuntimePresentationListVTable
.extern data_021052fc
.global RuntimePresentationManager_GetGraphics3dPresentation
RuntimePresentationManager_GetGraphics3dPresentation: ; 0x0201e0ec
    ldr r0, [r0, #0x20]
    bx lr


.size RuntimePresentationManager_GetGraphics3dPresentation, . - RuntimePresentationManager_GetGraphics3dPresentation
