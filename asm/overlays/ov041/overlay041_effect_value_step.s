.text

/* Exact fallback for func_ov041_02201784; see the documented portable C in
 * src/overlays/ov041/overlay041_effect_value_step.c. */
    .global func_ov041_02201784
func_ov041_02201784: ; 0x02201784
    ldr r3, [r0, #0x928]
    cmp r3, #0x0
    ble .L_022017b4
    ldr r1, [r0, #0x624]
    add r1, r1, r3
    str r1, [r0, #0x624]
    cmp r1, #0x1000
    movgt r1, #0x1000
    strgt r1, [r0, #0x624]
    movgt r1, #0x0
    strgt r1, [r0, #0x928]
    bx lr
.L_022017b4:
    ldr r2, [r0, #0x624]
    ldr r1, .L_022017f4
    add r2, r2, r3
    str r2, [r0, #0x624]
    cmp r2, r1
    ldrlt r1, [r0, #0x928]
    sublt r1, r1, #0x1
    strlt r1, [r0, #0x928]
    ldr r1, [r0, #0x624]
    cmp r1, #0x0
    movlt r1, #0x0
    strlt r1, [r0, #0x624]
    strlt r1, [r0, #0x928]
    movlt r1, #0x6
    strlt r1, [r0, #0x938]
    bx lr
.L_022017f4: .word 0xfeb
    .size func_ov041_02201784, . - func_ov041_02201784

