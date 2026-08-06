; Matching retail form; see src/game/actor_derived_type1_gamework_flags.c.
.text
.extern gGameWork

    .global func_02038e50
    .type func_02038e50, @function
func_02038e50: ; 0x02038e50
    cmp r1, #0x0
    beq .L_02038eb8
    ldr r2, [r0, #0x230]
    ldr r1, .L_02038ec8
    orr r2, r2, #0x40000000
    str r2, [r0, #0x230]
    ldr r1, [r1, #0x0]
    add r1, r1, #0x200
    ldrsh r2, [r1, #0x48]
    ldrsh r1, [r1, #0x46]
    cmp r2, #0x2
    beq .L_02038e90
    cmp r2, #0x3
    beq .L_02038ea4
    cmp r2, #0x4
    bx lr
.L_02038e90:
    cmp r1, #0x3
    ldreq r1, [r0, #0x230]
    orreq r1, r1, #0x80000000
    streq r1, [r0, #0x230]
    bx lr
.L_02038ea4:
    cmp r1, #0x4
    ldreq r1, [r0, #0x230]
    orreq r1, r1, #0x80000000
    streq r1, [r0, #0x230]
    bx lr
.L_02038eb8:
    ldr r1, [r0, #0x230]
    bic r1, r1, #0x40000000
    str r1, [r0, #0x230]
    bx lr
.L_02038ec8: .word gGameWork
    .size func_02038e50, . - func_02038e50
