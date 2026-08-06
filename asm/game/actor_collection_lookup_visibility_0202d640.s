; Matching retail form; see src/game/actor_collection_lookup_visibility.c.
.text

    .global func_0202d640
    .type func_0202d640, @function
func_0202d640: ; 0x0202d640
    stmdb sp!, {r4, lr}
    add r3, r0, #0x2000
    ldr lr, [r3, #0xe74]
    mov r4, #0x0
    b .L_0202d67c
.L_0202d654:
    ldr ip, [r0, r4, lsl #0x2]
    cmp ip, #0x0
    beq .L_0202d678
    ldrb r3, [ip, #0x4d]
    cmp r1, r3
    ldreqh r3, [ip, #0x4e]
    cmpeq r2, r3
    moveq r0, ip
    ldmeqia sp!, {r4, pc}
.L_0202d678:
    add r4, r4, #0x1
.L_0202d67c:
    cmp r4, lr
    blt .L_0202d654
    mov r0, #0x0
    ldmia sp!, {r4, pc}
    .size func_0202d640, . - func_0202d640
