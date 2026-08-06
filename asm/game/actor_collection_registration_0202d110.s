; Matching retail form; see src/game/actor_collection_registration.c.
.text

    .global func_0202d110
    .type func_0202d110, @function
func_0202d110: ; 0x0202d110
    stmdb sp!, {r3, lr}
    ldrb r2, [r1, #0x4d]
    cmp r2, #0x1
    moveq r3, #0x1
    movne r3, #0x0
    cmp r3, #0x0
    beq .L_0202d144
    mov r2, #0x0
    strb r2, [r1, #0x48]
    str r1, [r0, #0x0]
    add r0, r0, #0x2000
    str r1, [r0, #0xe7c]
    ldmia sp!, {r3, pc}
.L_0202d144:
    cmp r2, #0x7
    moveq r2, #0x1
    movne r2, #0x0
    cmp r2, #0x0
    beq .L_0202d180
    ldrsh r2, [r1, #0xe4]
    cmp r2, #0x1
    addeq r2, r0, #0x2000
    ldreq r3, [r2, #0xe80]
    cmpeq r3, #0x0
    moveq r3, #0x1
    streqb r3, [r1, #0x48]
    streq r1, [r0, #0x4]
    streq r1, [r2, #0xe80]
    ldmeqia sp!, {r3, pc}
.L_0202d180:
    mvn r3, #0x0
    mov ip, #0x0
    mov lr, #0x2
    b .L_0202d1b0
.L_0202d190:
    ldr r2, [r0, lr, lsl #0x2]
    cmp r2, r1
    ldmeqia sp!, {r3, pc}
    cmp ip, #0x0
    cmpeq r2, #0x0
    moveq r3, lr
    addeq ip, r0, lr, lsl #0x2
    add lr, lr, #0x1
.L_0202d1b0:
    cmp lr, #0x80
    blt .L_0202d190
    ldr r2, [r0, #0xe1c]
    add r2, r2, #0x1
    str r2, [r0, #0xe1c]
    str r1, [ip, #0x0]
    strb r3, [r1, #0x48]
    add r0, r0, #0x2000
    ldr r2, [r0, #0xe74]
    add r1, r3, #0x1
    cmp r2, r1
    strlt r1, [r0, #0xe74]
    ldmia sp!, {r3, pc}
    .size func_0202d110, . - func_0202d110
