    .text
    .extern func_ov046_0220c1a4
    .extern func_02091c7c
    .extern func_02091b98
    .extern func_02028100
    .extern func_0202836c

    /* Exact fallback; see the documented portable reconstruction in
     * src/overlays/ov006/overlay006_auxiliary_toggle_update.c. */
    .global func_ov006_021fb950
func_ov006_021fb950: ; 0x021fb950
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x90]
    bl func_ov046_0220c1a4
    add r0, r4, #0x98
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    add r0, r4, #0x98
    mov r1, #0x3c
    bl func_02091b98
    ldr r0, [r4, #0xb4]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r4, #0xb4]
    cmp r0, #0x0
    ldr r0, [r4, #0x94]
    beq L_021fb9ac
    ldr r1, [r4, #0x64]
    bl func_02028100
    ldmia sp!, {r4, pc}
L_021fb9ac:
    bl func_0202836c
    ldmia sp!, {r4, pc}

    .size func_ov006_021fb950, .-func_ov006_021fb950
