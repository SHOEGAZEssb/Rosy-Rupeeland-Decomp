.text
.global func_02005548
.type func_02005548, @function
func_02005548:
    stmdb sp!, {r3}
    sub sp, sp, #4
    add r3, sp, #0
    mov r1, #0x43
    mov r2, #0x4e
    mov r0, #0x4c
    strb r2, [r3, #0]
    strb r1, [r3, #1]
    strb r1, [r3, #2]
    strb r0, [r3, #3]
    ldr r0, [sp, #0]
    add sp, sp, #4
    ldmia sp!, {r3}
    bx lr
    .size func_02005548, .-func_02005548
