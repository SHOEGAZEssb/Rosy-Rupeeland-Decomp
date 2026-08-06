; Matching retail form; see src/game/actor_collection_pair_callbacks.c.
.text
.extern func_0202d2f4
.extern func_0202d324
.extern func_0202ec74

    .global func_0202eba4
    .type func_0202eba4, @function
func_0202eba4: ; 0x0202eba4
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    mov r4, r2
    mov r6, r0
    add r0, r6, #0x234
    ldrsb r1, [r5, #0x48]
    ldrsb r2, [r4, #0x48]
    add r0, r0, #0xc00
    bl func_0202d2f4
    cmp r0, #0x0
    beq .L_0202ebf0
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_0202ec74
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_0202ec74
.L_0202ebf0:
    ldrsb r1, [r5, #0x48]
    add r0, r6, #0x234
    ldrsb r2, [r4, #0x48]
    add r0, r0, #0xc00
    bl func_0202d324
    ldmia sp!, {r4, r5, r6, pc}
    .size func_0202eba4, . - func_0202eba4
