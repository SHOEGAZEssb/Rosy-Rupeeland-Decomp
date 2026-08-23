; Matching retail form; see src/game/presentation_base_teardown.c.
.text
.extern Heap_Free
.extern FieldEffect_DestroyBase
.global func_0202290c
    .type func_0202290c, @function
func_0202290c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl FieldEffect_DestroyBase
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0202290c, .-func_0202290c
