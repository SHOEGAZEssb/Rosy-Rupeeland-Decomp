; Matching retail form; see src/game/interaction_waypoint_cursor.c.
.text
.extern func_020453e8
.global func_02045288
.type func_02045288, @function
func_02045288: ; 0x02045288
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    str r6, [r7, #0x0]
    bl func_020453e8
    mov r1, #0x0
    mov r3, r1
    sub r2, r1, #0x80000001
    mov ip, #0xc
    b .L_020452e8
.L_020452b8:
    mul r8, r3, ip
    add r9, r6, r8
    ldr lr, [r9, #0x4]
    ldr r9, [r6, r8]
    sub r8, r4, lr
    mul lr, r8, r8
    sub r8, r5, r9
    mla lr, r8, r8, lr
    cmp r2, lr
    movgt r1, r3
    movgt r2, lr
    add r3, r3, #0x1
.L_020452e8:
    cmp r3, r0
    blt .L_020452b8
    str r1, [r7, #0x4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.size func_02045288, . - func_02045288
