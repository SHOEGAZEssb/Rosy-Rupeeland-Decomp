; Matching retail form; see src/game/main_bg1_follow_presentation.c.
.text
.extern Heap_Free
.extern FieldEffect_DestroyBase

    .global func_02028588
    .type func_02028588, @function
func_02028588: ; 0x02028588
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl FieldEffect_DestroyBase
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_02028588, . - func_02028588

