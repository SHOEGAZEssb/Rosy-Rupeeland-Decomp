; Matching retail form; see src/game/actor_collection_pair_callbacks.c.
.text
.extern func_0203baa0

    .global func_0202ec74
    .type func_0202ec74, @function
func_0202ec74: ; 0x0202ec74
    stmdb sp!, {r3, lr}
    ldr r0, [r1, #0x10]
    tst r0, #0x1000000
    beq .L_0202ecb8
    ldrb r0, [r1, #0x4d]
    cmp r0, #0x2
    cmpne r0, #0x1
    mov r0, r1
    bne .L_0202eca4
    mov r1, r2
    bl func_0203baa0
    ldmia sp!, {r3, pc}
.L_0202eca4:
    ldr r3, [r0, #0x0]
    mov r1, r2
    ldr r3, [r3, #0x2c]
    blx r3
    ldmia sp!, {r3, pc}
.L_0202ecb8:
    mov r0, r1
    ldr r3, [r0, #0x0]
    mov r1, r2
    ldr r3, [r3, #0x2c]
    blx r3
    ldmia sp!, {r3, pc}
    .size func_0202ec74, . - func_0202ec74
