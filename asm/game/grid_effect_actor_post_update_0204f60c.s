; Matching retail form; see src/game/grid_effect_actor_post_update.c.
.extern Actor_SetInteractionFlag2000
.extern func_0204a4f0
.text
    .global func_0204f60c
func_0204f60c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_0204a4f0
    mov r0, r5
    mov r1, r4
    bl Actor_SetInteractionFlag2000
    ldmia sp!, {r3, r4, r5, pc}
.size func_0204f60c, . - func_0204f60c

