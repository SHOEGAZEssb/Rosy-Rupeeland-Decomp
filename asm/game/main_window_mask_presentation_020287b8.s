; Matching retail form; see src/game/main_window_mask_presentation.c.
.text
.extern Heap_Free
.extern FieldEffect_DestroyBase

    .global MainWindowMaskPresentation_DestroyAndFree
    .type MainWindowMaskPresentation_DestroyAndFree, @function
MainWindowMaskPresentation_DestroyAndFree: ; 0x020287b8
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl FieldEffect_DestroyBase
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size MainWindowMaskPresentation_DestroyAndFree, . - MainWindowMaskPresentation_DestroyAndFree

