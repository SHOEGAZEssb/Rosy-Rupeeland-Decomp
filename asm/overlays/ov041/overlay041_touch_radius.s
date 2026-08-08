.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_touch_helpers.c. */
.extern func_020adc40

    .global func_ov041_021fec1c
func_ov041_021fec1c: ; 0x021fec1c
    stmdb sp!, {r4, lr}
    ldr ip, [r0, #0x1c4]
    mov r4, r3
    cmp ip, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r3, [r0, #0x1c0]
    ldr r0, [r0, #0x1bc]
    sub ip, r3, r2
    sub r1, r0, r1
    smull r0, r2, r1, r1
    adds r3, r0, #0x800
    smull r1, r0, ip, ip
    adc r2, r2, #0x0
    adds r1, r1, #0x800
    mov r3, r3, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    bl func_020adc40
    cmp r0, r4
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r4, pc}
    .size func_ov041_021fec1c, . - func_ov041_021fec1c

