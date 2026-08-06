; Matching retail form; see src/game/actor_collection_descriptor_helpers.c.
.text
.extern func_02033f18

    .global func_02030b18
    .type func_02030b18, @function
func_02030b18: ; 0x02030b18
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    add r4, r6, #0x2000
    str r1, [r4, #0xe88]
    mov r5, #0x0
    b .L_02030b48
.L_02030b30:
    ldr r0, [r6, r5, lsl #0x2]
    cmp r0, #0x0
    beq .L_02030b44
    ldr r1, [r4, #0xe88]
    bl func_02033f18
.L_02030b44:
    add r5, r5, #0x1
.L_02030b48:
    ldr r0, [r4, #0xe74]
    cmp r5, r0
    blt .L_02030b30
    ldmia sp!, {r4, r5, r6, pc}
    .size func_02030b18, . - func_02030b18

