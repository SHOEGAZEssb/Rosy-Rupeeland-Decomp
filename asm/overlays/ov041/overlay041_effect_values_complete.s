.text

/* Exact fallback for func_ov041_022029cc; see the documented portable C in
 * src/overlays/ov041/overlay041_effect_record_helpers.c. */
    .global func_ov041_022029cc
func_ov041_022029cc: ; 0x022029cc
    mov r1, #0x5b
    sub r3, r1, #0x1
    mov r2, #0x0
.L_022029d8:
    add r1, r0, r3, lsl #0x2
    ldr r1, [r1, #0x624]
    cmp r1, #0x1000
    addlt r2, r2, #0x1
    subs r3, r3, #0x1
    bpl .L_022029d8
    cmp r2, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
    .size func_ov041_022029cc, . - func_ov041_022029cc

