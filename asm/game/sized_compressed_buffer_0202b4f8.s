; Matching retail form; see src/game/sized_compressed_buffer.c.
.text
.extern func_02003e38

    .global func_0202b4f8
    .type func_0202b4f8, @function
func_0202b4f8: ; 0x0202b4f8
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_0202b510
    bl func_02003e38
.L_0202b510:
    mov r0, #0x0
    str r0, [r4, #0x0]
    str r0, [r4, #0x4]
    ldmia sp!, {r4, pc}
    .size func_0202b4f8, . - func_0202b4f8
