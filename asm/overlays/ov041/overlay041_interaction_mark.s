.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_touch_helpers.c. */
    .global func_ov041_021fecb0
func_ov041_021fecb0: ; 0x021fecb0
    mov r1, #0x1
    str r1, [r0, #0x1e0]
    bx lr
    .size func_ov041_021fecb0, . - func_ov041_021fecb0

