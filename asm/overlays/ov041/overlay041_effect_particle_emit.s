.text

/* Exact fallback for func_ov041_02202adc; see the documented portable C in
 * src/overlays/ov041/overlay041_effect_particle_emit.c. */
.extern func_020bf1f8
.extern func_ov004_021fb868
.extern genrand_int32

    .global func_ov041_02202adc
func_ov041_02202adc: ; 0x02202adc
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x920]
    cmp r0, #0x4
    cmpne r0, #0x6
    cmpne r0, #0xe
    beq .L_02202b48
    ldr r0, [r4, #0x93c]
    tst r0, #0x1
    bne .L_02202b48
    bl genrand_int32
    mov r1, #0x5b
    bl func_020bf1f8
    add r0, r4, r1, lsl #0x2
    ldr r0, [r0, #0x624]
    cmp r0, #0x2bc
    bge .L_02202b48
    mov r0, #0xc
    mul r0, r1, r0
    add r0, r4, r0
    ldr r2, [r0, #0x6c]
    ldr r1, [r0, #0x70]
    ldr r0, [r4, #0x958]
    mov r2, r2, asr #0xc
    mov r3, r1, asr #0xc
    mov r1, #0x5
    bl func_ov004_021fb868 ; Overlay008_SpawnParticles
.L_02202b48:
    ldr r0, [r4, #0x920]
    cmp r0, #0x4
    cmpne r0, #0x6
    bne .L_02202ba0
    ldr r0, [r4, #0x93c]
    tst r0, #0x3
    bne .L_02202ba0
    bl genrand_int32
    mov r1, #0x5b
    bl func_020bf1f8
    mov r0, #0xc
    mla r1, r0, r1, r4
    ldr r0, [r4, #0x48]
    ldr r3, [r1, #0x6c]
    ldr r2, [r1, #0x70]
    ldr r1, [r0, #0x194]
    ldr r0, [r4, #0x958]
    add r1, r2, r1
    mov r2, r3, asr #0xc
    mov r3, r1, asr #0xc
    mov r1, #0x7
    bl func_ov004_021fb868 ; Overlay008_SpawnParticles
.L_02202ba0:
    ldr r0, [r4, #0x920]
    sub r0, r0, #0x8
    cmp r0, #0x1
    bhi .L_02202be8
    ldr r0, [r4, #0x93c]
    tst r0, #0xf
    bne .L_02202be8
    ldr r0, [r4, #0x48]
    ldr r3, [r4, #0x6c]
    ldr r2, [r4, #0x70]
    ldr r1, [r0, #0x194]
    ldr r0, [r4, #0x958]
    add r1, r2, r1
    sub r1, r1, #0x32000
    mov r2, r3, asr #0xc
    mov r3, r1, asr #0xc
    mov r1, #0x6
    bl func_ov004_021fb868 ; Overlay008_SpawnParticles
.L_02202be8:
    ldr r0, [r4, #0x94c]
    cmp r0, #0x0
    ldmleia sp!, {r4, pc}
    sub r0, r0, #0x1
    str r0, [r4, #0x94c]
    ldr r0, [r4, #0x93c]
    tst r0, #0xf
    ldmneia sp!, {r4, pc}
    ldr r0, [r4, #0x48]
    ldr r2, [r4, #0x948]
    ldr r1, [r0, #0x14]
    ldr r0, [r4, #0x958]
    ldr r1, [r1, #0x15c]
    mov r2, r2, asr #0xc
    sub r1, r1, #0x1e000
    mov r3, r1, asr #0xc
    mov r1, #0x6
    bl func_ov004_021fb868 ; Overlay008_SpawnParticles
    ldmia sp!, {r4, pc}
    .size func_ov041_02202adc, . - func_ov041_02202adc

