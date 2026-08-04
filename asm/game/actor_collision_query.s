; Matching retail form; see src/game/actor_collision_query.c for
; the documented portable implementation and recovered behavior.
.text
.extern func_0202baec
.global func_0200a63c
func_0200a63c: ; 0x0200a63c
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    mov r8, r0
    mov r7, r1
    mov r6, r2
    mov r5, r3
    bl func_0202baec
    mov r4, r0
    mov r0, r8
    ldr r3, [r0, #0x0]
    mov r1, r7
    ldr r3, [r3, #0x2c]
    mov r2, r6
    blx r3
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    cmp r4, r5
    movgt r0, #0x1
    bgt L_0200a6a4
    mov r0, r0, lsl #0x16
    mov r0, r0, lsr #0x1b
    cmp r0, #0x7
    ldreq r0, [sp, #0x20]
    cmpeq r4, r0
    moveq r0, #0x1
    movne r0, #0x0
L_0200a6a4:
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
    .size func_0200a63c, .-func_0200a63c

