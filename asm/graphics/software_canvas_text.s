.text
.global func_02006078
.type func_02006078, @function
.extern data_021052f4
.extern func_020b3598
.extern OS_Halt
.extern func_02005fec

/* Matching implementation; see the documented portable C equivalent. */
func_02006078:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x104
    ldr r3, cursor_data
    mov r4, r0
    str r1, [r3, #4]
    str r2, [r3]
    add r5, sp, #0x12c
    bic r2, r5, #3
    ldr r1, [sp, #0x12c]
    add r0, sp, #0
    add r2, r2, #4
    bl func_020b3598
    mov r7, r0
    cmp r7, #0x100
    blt length_ok
    bl OS_Halt
length_ok:
    add r6, sp, #0
    mov r8, #0
    strb r8, [r6, r7]
    ldr r5, cursor_data
    b test
draw:
    ldrsb r1, [r6, r8]
    mov r0, r4
    bl func_02005fec
    ldr r0, [r5, #4]
    add r8, r8, #1
    add r0, r0, #8
    str r0, [r5, #4]
test:
    cmp r8, r7
    blt draw
    add sp, sp, #0x104
    ldmia sp!, {r3, r4, r5, r6, r7, r8, lr}
    add sp, sp, #0x10
    bx lr
cursor_data:
    .word data_021052f4
    .size func_02006078, .-func_02006078
