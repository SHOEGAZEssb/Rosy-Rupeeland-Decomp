.text

/* Exact fallback for func_ov041_02202aa4; see the documented portable C in
 * src/overlays/ov041/overlay041_effect_record_helpers.c. */
.extern func_020befec

    .global func_ov041_02202aa4
func_ov041_02202aa4: ; 0x02202aa4
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x934]
    mov r1, #0x50
    bl func_020befec
    cmp r1, #0x28
    rsbge r1, r1, #0x50
    sub r1, r1, #0x14
    mov r0, #0xa
    mul r0, r1, r0
    ldr r1, [r4, #0x934]
    add r1, r1, #0x1
    str r1, [r4, #0x934]
    ldmia sp!, {r4, pc}
    .size func_ov041_02202aa4, . - func_ov041_02202aa4

