; Matching retail form; see src/game/actor_bounds_center_helpers.c.
.text
.extern func_0200ab30

    .global func_02033798
    .type func_02033798, @function
func_02033798: ; 0x02033798
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrsb ip, [r4, #0x2]
    ldrsb r3, [r4, #0x0]
    mov r5, r2
    sub r2, ip, r3
    mov r2, r2, lsl #0x18
    strb r1, [r4, #0x0]
    add r1, r1, r2, asr #0x18
    strb r1, [r4, #0x2]
    bl func_0200ab30
    strb r5, [r4, #0x1]
    add r0, r5, r0
    strb r0, [r4, #0x3]
    ldmia sp!, {r3, r4, r5, pc}
    .size func_02033798, . - func_02033798

    .global func_020337d4

