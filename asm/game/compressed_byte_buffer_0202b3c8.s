; Matching retail form; see src/game/compressed_byte_buffer.c.
.text
.extern func_02003e38

    .global func_0202b3c8
    .type func_0202b3c8, @function
func_0202b3c8: ; 0x0202b3c8
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_0202b3e0
    bl func_02003e38
.L_0202b3e0:
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0202b3c8, . - func_0202b3c8
