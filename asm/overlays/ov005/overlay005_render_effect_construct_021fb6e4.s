    .text
    .extern Presentation_Init
    .extern func_02071ea4
    .extern func_02091b6c
    .extern genrand_int32
    .extern func_02071ee0
    .extern data_ov005_021fcaf0
    .extern data_020f4e18

    /* Exact fallback; see the documented portable reconstruction in
     * src/overlays/ov005/overlay005_render_effect_construct.c. */
    .global func_ov005_021fb6e4
func_ov005_021fb6e4: ; 0x021fb6e4
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl Presentation_Init
    ldr r1, L_021fb750
    add r0, r5, #0x9c
    str r1, [r5, #0x0]
    bl func_02071ea4
    mov r1, #0x0
    add r0, r5, #0xb0
    str r1, [r5, #0xac]
    bl func_02091b6c
    bl genrand_int32
    str r0, [r5, #0xac]
    ldr r3, L_021fb754
    add r0, r5, #0x9c
    str r3, [sp, #0x0]
    ldr r1, L_021fb758
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl func_02071ee0
    str r4, [r5, #0xa8]
    mov r0, #0x1
    str r0, [r5, #0x88]
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_021fb750: .word data_ov005_021fcaf0
L_021fb754: .word 0x4005
L_021fb758: .word data_020f4e18
    .size func_ov005_021fb6e4, .-func_ov005_021fb6e4
