; Matching retail form; see src/game/actor_collection_update_dispatch.c.
.text

    .global func_0202e104
    .type func_0202e104, @function
func_0202e104: ; 0x0202e104
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    mov r4, #0x0
    add r6, r5, #0x2000
    b .L_0202e14c
.L_0202e118:
    ldr r0, [r5, r4, lsl #0x2]
    cmp r0, #0x0
    beq .L_0202e148
    ldr r1, [r0, #0x10]
    bic r1, r1, #0x80
    str r1, [r0, #0x10]
    ldr r1, [r0, #0x14]
    tst r1, #0x800
    beq .L_0202e148
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1c]
    blx r1
.L_0202e148:
    add r4, r4, #0x1
.L_0202e14c:
    ldr r0, [r6, #0xe74]
    cmp r4, r0
    blt .L_0202e118
    ldmia sp!, {r4, r5, r6, pc}
    .size func_0202e104, . - func_0202e104
