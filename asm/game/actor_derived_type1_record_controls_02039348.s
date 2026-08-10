; Matching retail form; see src/game/actor_derived_type1_record_controls.c.
.text
.extern Actor_ApplyMotionImpulse
.extern func_020390c8

    .global func_02039348
    .type func_02039348, @function
func_02039348: ; 0x02039348
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_020390c8
    mov r0, r5
    mov r1, r4
    mov r2, #0x1
    bl Actor_ApplyMotionImpulse
    ldmia sp!, {r3, r4, r5, pc}
    .size func_02039348, . - func_02039348
