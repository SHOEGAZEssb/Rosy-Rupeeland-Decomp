; Matching retail form; see src/game/presentation_base_teardown.c.
.text
.extern Heap_Free
.extern FieldEffect_DestroyBase
.global DisplayFadePresentation_DestroyAndFree
    .type DisplayFadePresentation_DestroyAndFree, @function
DisplayFadePresentation_DestroyAndFree:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl FieldEffect_DestroyBase
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size DisplayFadePresentation_DestroyAndFree, .-DisplayFadePresentation_DestroyAndFree
