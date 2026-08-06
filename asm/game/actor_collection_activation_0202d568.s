; Matching retail form; see src/game/actor_collection_activation.c.
.text

    .global func_0202d568
    .type func_0202d568, @function
func_0202d568: ; 0x0202d568
    stmdb sp!, {r4, lr}
    mov lr, #0x0
    mov r4, lr
    add r2, r0, #0x2000
    b .L_0202d5a0
.L_0202d57c:
    ldr ip, [r0, r4, lsl #0x2]
    cmp ip, #0x0
    beq .L_0202d59c
    ldrsh r3, [ip, #0x50]
    cmp r1, r3
    addeq r3, r0, r4, lsl #0x2
    streq ip, [r3, #0xc00]
    addeq lr, lr, #0x1
.L_0202d59c:
    add r4, r4, #0x1
.L_0202d5a0:
    ldr r3, [r2, #0xe74]
    cmp r4, r3
    blt .L_0202d57c
    cmp lr, #0x0
    addne r0, r0, #0x2000
    ldrne r1, [r0, #0xe78]
    bicne r1, r1, #0x1
    orrne r1, r1, #0x1
    strne r1, [r0, #0xe78]
    ldmia sp!, {r4, pc}
    .size func_0202d568, . - func_0202d568
