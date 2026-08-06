; Matching retail form; see src/game/main_bg1_follow_presentation.c.
.text
.extern func_02028684

    .global func_02028764
    .type func_02028764, @function
func_02028764: ; 0x02028764
    stmdb sp!, {r3, lr}
    cmp r1, #0x1
    ldmeqia sp!, {r3, pc}
    bl func_02028684
    ldmia sp!, {r3, pc}
    .size func_02028764, . - func_02028764

