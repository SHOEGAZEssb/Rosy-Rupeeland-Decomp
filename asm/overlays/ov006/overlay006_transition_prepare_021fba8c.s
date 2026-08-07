    .text
    .extern func_ov006_021fb9b4
    .extern func_02028100
    .extern func_ov006_021fb6e0
    .extern data_ov006_021fbc48

    /* Exact fallback; see the documented portable reconstruction in
     * src/overlays/ov006/overlay006_transition_prepare.c. */
    .global func_ov006_021fba8c
func_ov006_021fba8c: ; 0x021fba8c
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    beq L_021fbaac
    cmp r1, #0x1
    beq L_021fbad0
    b L_021fbaf0
L_021fbaac:
    bl func_ov006_021fb9b4
    ldr r0, [r4, #0x94]
    ldr r1, [r4, #0x64]
    bl func_02028100
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021fbad0:
    ldr r0, [r4, #0x20]
    ldr r1, L_021fbaf8
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x20]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov006_021fb6e0
L_021fbaf0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fbaf8: .word data_ov006_021fbc48

    .size func_ov006_021fba8c, .-func_ov006_021fba8c
