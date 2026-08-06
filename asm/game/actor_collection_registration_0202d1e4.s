; Matching retail form; see src/game/actor_collection_registration.c.
.text
.extern func_0202d2f4
.extern func_0202ec74
.extern func_0202d324

    .global func_0202d1e4
    .type func_0202d1e4, @function
func_0202d1e4: ; 0x0202d1e4
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r1
    ldrb r1, [r6, #0x4d]
    mov r7, r0
    mvn r4, #0x0
    cmp r1, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    addne r0, r7, #0x2000
    movne r4, #0x0
    strne r4, [r0, #0xe7c]
    bne .L_0202d270
    cmp r1, #0x7
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0202d248
    add r0, r7, #0x2000
    ldr r1, [r0, #0xe80]
    cmp r6, r1
    moveq r1, #0x0
    streq r1, [r0, #0xe80]
    moveq r4, #0x1
    beq .L_0202d270
.L_0202d248:
    add r0, r7, #0x2000
    ldr r1, [r0, #0xe74]
    mov r2, #0x0
    b .L_0202d268
.L_0202d258:
    ldr r0, [r7, r2, lsl #0x2]
    cmp r0, r6
    moveq r4, r2
    add r2, r2, #0x1
.L_0202d268:
    cmp r2, r1
    blt .L_0202d258
.L_0202d270:
    mvn r0, #0x0
    cmp r4, r0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    add r0, r7, r4, lsl #0x2
    mov r5, #0x0
    str r5, [r0, #0xc00]
    ldr r0, [r7, #0xe1c]
    add r8, r7, #0x234
    sub r0, r0, #0x1
    str r0, [r7, #0xe1c]
.L_0202d298:
    ldr r0, [r7, r5, lsl #0x2]
    cmp r0, #0x0
    beq .L_0202d2cc
    mov r1, r4
    mov r2, r5
    add r0, r8, #0xc00
    bl func_0202d2f4
    cmp r0, #0x0
    beq .L_0202d2cc
    ldr r1, [r7, r5, lsl #0x2]
    mov r0, r7
    mov r2, r6
    bl func_0202ec74
.L_0202d2cc:
    mov r1, r4
    mov r2, r5
    add r0, r8, #0xc00
    bl func_0202d324
    add r5, r5, #0x1
    cmp r5, #0x80
    blt .L_0202d298
    mov r0, #0x0
    str r0, [r7, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
    .size func_0202d1e4, . - func_0202d1e4
