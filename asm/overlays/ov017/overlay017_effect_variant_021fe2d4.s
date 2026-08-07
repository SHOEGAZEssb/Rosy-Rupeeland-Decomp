    .text

/* Exact fallback; see src/overlays/ov017/overlay017_effect_variant.c. */
    .extern data_ov017_022016e0
    .extern func_020948d4
    .extern func_02094c48
.global func_ov017_021fe2d4
func_ov017_021fe2d4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x40]
    add r0, r4, #0x3c
    add r1, r1, #0x800
    bl func_020948d4
    mov r0, r4
    bl func_02094c48
    cmp r0, #0x0
    beq L_021fe330
    ldr r0, [r4, #0x9c]
    cmp r0, #0x0
    cmpne r0, #0x1
    beq L_021fe328
    cmp r0, #0x2
    bne L_021fe328
    ldr r0, L_021fe338
    ldr r1, [r0, #0x18]
    cmp r1, #0x0
    ldreq r1, [r0, #0x1c]
    streq r1, [r0, #0x18]
L_021fe328:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_021fe330:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fe338: .word data_ov017_022016e0
    .size func_ov017_021fe2d4, . - func_ov017_021fe2d4
