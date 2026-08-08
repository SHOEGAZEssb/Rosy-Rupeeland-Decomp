.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_touch_helpers.c. */
    .global func_ov041_021fecbc
func_ov041_021fecbc: ; 0x021fecbc
    ldr r1, [r0, #0x1dc]
    cmp r1, #0x3e8
    subgt r1, r1, #0x190
    strgt r1, [r0, #0x1dc]
    bgt .L_021fece4
    cmp r1, #0x64
    subgt r1, r1, #0x64
    strgt r1, [r0, #0x1dc]
    suble r1, r1, #0x32
    strle r1, [r0, #0x1dc]
.L_021fece4:
    ldr r1, [r0, #0x1dc]
    cmp r1, #0x0
    movlt r1, #0x0
    strlt r1, [r0, #0x1dc]
    mov r1, #0x1
    str r1, [r0, #0x1e0]
    bx lr
    .size func_ov041_021fecbc, . - func_ov041_021fecbc

