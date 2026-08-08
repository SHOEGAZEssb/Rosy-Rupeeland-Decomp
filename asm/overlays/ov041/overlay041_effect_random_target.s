.text

/* Exact fallback for func_ov041_02202a00; see the documented portable C in
 * src/overlays/ov041/overlay041_effect_record_helpers.c. */
.extern func_020bf1f8
.extern genrand_int32

    .global func_ov041_02202a00
func_ov041_02202a00: ; 0x02202a00
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl genrand_int32
    mov r1, #0x64
    bl func_020bf1f8
    add r0, r1, #0x4e
    mov r0, r0, lsl #0xc
    str r0, [r4, #0x4b0]
    bl genrand_int32
    mov r1, #0x50
    bl func_020bf1f8
    sub r0, r1, #0x64
    mov r0, r0, lsl #0xc
    str r0, [r4, #0x4b4]
    ldmia sp!, {r4, pc}
    .size func_ov041_02202a00, . - func_ov041_02202a00

