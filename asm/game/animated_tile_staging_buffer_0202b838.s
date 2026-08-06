; Matching retail form; see src/game/animated_tile_staging_buffer.c.
.text
.extern func_0202b854

    .global func_0202b838
    .type func_0202b838, @function
func_0202b838: ; 0x0202b838
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r4, r1
    ldmeqia sp!, {r4, pc}
    bl func_0202b854
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0202b838, . - func_0202b838
