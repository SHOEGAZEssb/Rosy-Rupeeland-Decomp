    .text
    .extern func_ov046_0220c3bc
    .extern func_ov046_0220c410
    .extern func_02091a70
    .extern func_ov046_0220c46c
    .extern func_02028100
    .extern func_ov046_0220bffc
    .extern func_02091b98

    /* Exact fallback; see the documented portable reconstruction in
     * src/overlays/ov006/overlay006_geometry_interpolate.c. */
    .global func_ov006_021fb9b4
func_ov006_021fb9b4: ; 0x021fb9b4
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r5, r0
    ldr r6, [r5, #0x68]
    ldr r0, [r5, #0x90]
    mov r1, r6
    ldr r4, [r5, #0x64]
    bl func_ov046_0220c3bc
    mov r8, r0
    ldr r0, [r5, #0x90]
    mov r1, r6
    bl func_ov046_0220c410
    mov r7, r0
    ldr r0, [r5, #0x90]
    mov r1, r4
    bl func_ov046_0220c3bc
    mov r6, r0
    ldr r0, [r5, #0x90]
    mov r1, r4
    bl func_ov046_0220c410
    mov r1, r6
    mov r6, r0
    ldr r2, [r5, #0x7c]
    ldr r3, [r5, #0x80]
    mov r0, r8
    bl func_02091a70
    mov r1, r6
    mov r6, r0
    ldr r2, [r5, #0x7c]
    ldr r3, [r5, #0x80]
    mov r0, r7
    bl func_02091a70
    mov r2, r0
    ldr r0, [r5, #0x90]
    mov r1, r6
    bl func_ov046_0220c46c
    ldr r0, [r5, #0x7c]
    ldr r1, [r5, #0x80]
    add r0, r0, r0, lsr #0x1f
    cmp r1, r0, asr #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, [r5, #0x94]
    mov r1, r4
    bl func_02028100
    mov r2, #0x0
    ldr r0, [r5, #0x90]
    mov r1, r4
    mov r3, r2
    bl func_ov046_0220bffc
    add r0, r5, #0x98
    mov r1, #0x78
    bl func_02091b98
    mov r0, #0x1
    str r0, [r5, #0xb4]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}

    .size func_ov006_021fb9b4, .-func_ov006_021fb9b4
