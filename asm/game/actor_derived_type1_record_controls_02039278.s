; Matching retail form; see src/game/actor_derived_type1_record_controls.c.
.text
.extern func_02038f98
.extern func_020390c8
.extern func_020551f0

    .global func_02039278
    .type func_02039278, @function
func_02039278: ; 0x02039278
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r2, [r5, #0x26c]
    mov r4, r1
    cmp r2, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020390c8
    ldr r1, [r4, #0x1f8]
    mov r0, r4
    str r1, [r5, #0x27c]
    str r4, [r5, #0x278]
    bl func_020551f0
    mov r0, r5
    bl func_02038f98
    ldmia sp!, {r3, r4, r5, pc}
    .size func_02039278, . - func_02039278
