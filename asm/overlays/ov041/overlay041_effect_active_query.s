.text

/* Exact fallback for func_ov041_0220159c; see the documented portable C in
 * src/overlays/ov041/overlay041_effect_trigger.c. */
    .global func_ov041_0220159c
func_ov041_0220159c: ; 0x0220159c
    ldr r0, [r0, #0x920]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
    .size func_ov041_0220159c, . - func_ov041_0220159c

