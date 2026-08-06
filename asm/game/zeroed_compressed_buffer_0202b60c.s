; Matching retail form; see src/game/zeroed_compressed_buffer.c.
.text
.extern func_0202b620

    .global func_0202b60c
    .type func_0202b60c, @function
func_0202b60c: ; 0x0202b60c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0202b620
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0202b60c, . - func_0202b60c
