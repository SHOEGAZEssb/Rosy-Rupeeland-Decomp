; Matching retail form; see src/game/four_stage_command_presentation.c.
.text
.extern func_0201e28c

    .global func_02026f8c
    .type func_02026f8c, @function
func_02026f8c: ; 0x02026f8c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0201e28c
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_02026f8c, . - func_02026f8c
