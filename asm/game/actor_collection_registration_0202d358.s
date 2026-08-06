; Matching retail form; see src/game/actor_collection_registration.c.
.text
.extern func_0202d1e4

    .global func_0202d358
    .type func_0202d358, @function
func_0202d358: ; 0x0202d358
    stmdb sp!, {r4, lr}
    mov r4, r1
    bl func_0202d1e4
    cmp r4, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
    ldmia sp!, {r4, pc}
    .size func_0202d358, . - func_0202d358
