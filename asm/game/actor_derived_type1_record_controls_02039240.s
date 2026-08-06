; Matching retail form; see src/game/actor_derived_type1_record_controls.c.
.text
.extern func_02038ecc

    .global func_02039240
    .type func_02039240, @function
func_02039240: ; 0x02039240
    stmdb sp!, {r3, lr}
    ldr r2, [r0, #0x27c]
    cmp r2, #0x0
    beq .L_02039270
    ldrb r1, [r2, #0x8]
    cmp r1, #0x6d
    ldreqsh r1, [r2, #0x0]
    cmpeq r1, #0x66
    addeq r0, r0, #0x200
    moveq r1, #0x6
    streqh r1, [r0, #0x82]
    ldmia sp!, {r3, pc}
.L_02039270:
    bl func_02038ecc
    ldmia sp!, {r3, pc}
    .size func_02039240, . - func_02039240
