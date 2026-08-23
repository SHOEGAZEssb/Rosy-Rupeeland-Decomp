; Matching retail form; see src/game/timed_actor_rectangle_presentation.c.
.text
.extern Heap_Free
.extern FieldEffect_DestroyBase

    .global func_02025190
    .type func_02025190, @function
func_02025190: ; 0x02025190
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl FieldEffect_DestroyBase
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_02025190, . - func_02025190
