.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_secondary_object_helpers.c. */
.extern func_020befec

    .global func_ov041_022009e8
func_ov041_022009e8: ; 0x022009e8
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, [r0, #0x48]
    ldr r4, [r0, #0x15c]
    ldr r5, [r1, #0x174]
    mov r0, #0x60
    mul r0, r5, r0
    mov r1, #0x3
    mov r6, r4, asr #0xc
    bl func_020befec
    cmp r0, r4, asr #0xc
    movgt r0, #0x0
    ldmgtia sp!, {r4, r5, r6, pc}
    mov r0, #0xc0
    mul r0, r5, r0
    mov r1, #0x3
    bl func_020befec
    cmp r6, r0
    movlt r0, #0x1
    movge r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
    .size func_ov041_022009e8, . - func_ov041_022009e8

