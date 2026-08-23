; Matching retail form; see src/game/main_bg1_follow_presentation.c.
.text
.extern FieldEffect_DestroyBase

    .global func_02028574
    .type func_02028574, @function
func_02028574: ; 0x02028574
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl FieldEffect_DestroyBase
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_02028574, . - func_02028574

