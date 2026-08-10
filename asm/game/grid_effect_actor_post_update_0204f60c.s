; Matching retail form; see src/game/grid_effect_actor_post_update.c.
.extern Actor_SetInteractionFlag2000
.extern Type7Actor_ProcessGlobalInteractionTrigger
.text
    .global func_0204f60c
func_0204f60c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl Type7Actor_ProcessGlobalInteractionTrigger
    mov r0, r5
    mov r1, r4
    bl Actor_SetInteractionFlag2000
    ldmia sp!, {r3, r4, r5, pc}
.size func_0204f60c, . - func_0204f60c

