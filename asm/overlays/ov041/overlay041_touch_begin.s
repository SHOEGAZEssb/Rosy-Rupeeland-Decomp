.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_touch_helpers.c. */
.extern func_ov041_021fec04

    .global func_ov041_021febd4
func_ov041_021febd4: ; 0x021febd4
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x1b8
    bl func_ov041_021fec04
    ldr r0, [r4, #0x1c4]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r4, #0x1c8]
    mov r0, #0x1
    str r0, [r4, #0x1c4]
    ldmia sp!, {r4, pc}
    .size func_ov041_021febd4, . - func_ov041_021febd4

