; Matching retail form; see src/game/sized_compressed_buffer.c.
.text
.extern func_0202b4f8

    .global func_0202b4e4
    .type func_0202b4e4, @function
func_0202b4e4: ; 0x0202b4e4
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0202b4f8
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0202b4e4, . - func_0202b4e4
