; Matching retail form; see src/game/actor_collection_activation.c.
.text
.extern func_0202d1e4

    .global func_0202d3cc
    .type func_0202d3cc, @function
func_0202d3cc: ; 0x0202d3cc
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r5, r0
    add r0, r5, #0x2000
    ldr r0, [r0, #0xe80]
    cmp r0, #0x0
    beq .L_0202d424
    ldr r0, [r0, #0x268]
    tst r0, #0x10
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_0202d424
    ldr r4, [r5, #0x4]
    mov r0, r5
    mov r1, r4
    bl func_0202d1e4
    cmp r4, #0x0
    beq .L_0202d424
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0202d424:
    mov r4, #0x2
    add r6, r5, #0x2000
    mov r7, #0x0
    mov r8, #0x1
    b .L_0202d484
.L_0202d438:
    ldr r9, [r5, r4, lsl #0x2]
    cmp r9, #0x0
    beq .L_0202d480
    ldr r0, [r9, #0xd0]
    tst r0, #0x100000
    movne r0, r8
    moveq r0, r7
    cmp r0, #0x0
    bne .L_0202d480
    mov r0, r5
    mov r1, r9
    bl func_0202d1e4
    cmp r9, #0x0
    beq .L_0202d480
    mov r0, r9
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0202d480:
    add r4, r4, #0x1
.L_0202d484:
    ldr r0, [r6, #0xe74]
    cmp r4, r0
    blt .L_0202d438
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    .size func_0202d3cc, . - func_0202d3cc
