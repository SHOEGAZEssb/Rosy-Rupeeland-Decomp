; Matching retail form; see src/game/trigger_presentation_actor_post_update.c.
.extern func_0203392c
.extern func_02034044
.text
    .global func_0204ebf4
func_0204ebf4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0203392c
    mov r0, r4
    bl func_02034044
    ldmia sp!, {r4, pc}
.size func_0204ebf4, . - func_0204ebf4

