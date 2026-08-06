; Matching retail form; see src/game/actor_collection_category_build.c.
.text

    .global func_0202dd80
    .type func_0202dd80, @function
func_0202dd80: ; 0x0202dd80
    stmdb sp!, {r3, lr}
    add ip, r0, #0xe20
    add lr, r0, r1, lsl #0x2
    ldr r3, [ip, r1, lsl #0x2]
    ldr lr, [lr, #0xe20]
    add r3, r3, #0x1
    add r0, r0, r1, lsl #0x9
    str r3, [ip, r1, lsl #0x2]
    add r0, r0, lr, lsl #0x2
    str r2, [r0, #0x200]
    ldmia sp!, {r3, pc}
    .size func_0202dd80, . - func_0202dd80
