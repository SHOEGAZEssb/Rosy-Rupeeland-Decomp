; Matching retail form; see src/game/timed_actor_rectangle_presentation.c.
.text
.extern FieldEffect_DestroyBase

    .global func_0202517c
    .type func_0202517c, @function
func_0202517c: ; 0x0202517c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl FieldEffect_DestroyBase
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0202517c, . - func_0202517c
