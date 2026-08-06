; Matching retail form; see src/game/presentation_base_teardown.c.
.text
.extern func_0201e28c
.global func_02022928
    .type func_02022928, @function
func_02022928:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0201e28c
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_02022928, .-func_02022928
