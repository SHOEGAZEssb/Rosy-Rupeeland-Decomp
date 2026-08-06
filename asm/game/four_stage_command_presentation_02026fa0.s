; Matching retail form; see src/game/four_stage_command_presentation.c.
.text
.extern Heap_Free
.extern func_0201e28c

    .global func_02026fa0
    .type func_02026fa0, @function
func_02026fa0: ; 0x02026fa0
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0201e28c
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_02026fa0, . - func_02026fa0
