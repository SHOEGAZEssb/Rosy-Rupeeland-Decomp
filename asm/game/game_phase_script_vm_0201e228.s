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
.global func_0201e228
func_0201e228: ; 0x0201e228
    stmdb sp!, {r4, lr}
    ldr r1, L_0201e24c
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_0201dc58
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0201e24c: .word gRuntimePresentationListVTable


.size func_0201e228, . - func_0201e228
