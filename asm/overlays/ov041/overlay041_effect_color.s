.text

/* Exact fallback for func_ov041_0220333c; see the documented portable C in
 * src/overlays/ov041/overlay041_effect_color.c. */
    .global func_ov041_0220333c
func_ov041_0220333c: ; 0x0220333c
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, [r0, #0x920]
    mov r3, #0x0
    cmp r0, #0xe
    beq .L_02203398
    mov r0, #0xe000
    umull ip, r6, r1, r0
    mov r2, #0x12000
    umull r5, r4, r1, r2
    mla r6, r1, r3, r6
    mov lr, r1, asr #0x1f
    mla r4, r1, r3, r4
    adds ip, ip, #0x800
    mla r6, lr, r0, r6
    adc r0, r6, #0x0
    mov r3, ip, lsr #0xc
    orr r3, r3, r0, lsl #0x14
    mla r4, lr, r2, r4
    mov r0, r3, asr #0xc
    adds r1, r5, #0x800
    rsb r2, r0, #0x1f
    adc r0, r4, #0x0
    b .L_022033dc
.L_02203398:
    mov r0, #0x28000
    umull r5, r4, r1, r0
    mov r2, #0x1f000
    umull lr, ip, r1, r2
    mla r4, r1, r3, r4
    mov r6, r1, asr #0x1f
    mla ip, r1, r3, ip
    adds r5, r5, #0x800
    mla r4, r6, r0, r4
    adc r0, r4, #0x0
    mov r3, r5, lsr #0xc
    orr r3, r3, r0, lsl #0x14
    mla ip, r6, r2, ip
    mov r0, r3, asr #0xc
    adds r1, lr, #0x800
    rsb r2, r0, #0x1f
    adc r0, ip, #0x0
.L_022033dc:
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    mov r0, r1, asr #0xc
    mov r1, r2
    cmp r2, #0x1f
    movgt r2, #0x0
    cmp r1, #0x1f
    rsb r3, r0, #0x1f
    movgt r1, #0x0
    cmp r3, #0x1f
    movgt r3, #0x0
    cmp r2, #0x0
    movlt r2, #0x0
    cmp r1, #0x0
    movlt r1, #0x0
    cmp r3, #0x0
    movlt r3, #0x0
    orr r0, r2, r1, lsl #0x5
    orr r0, r0, r3, lsl #0xa
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    ldmia sp!, {r4, r5, r6, pc}
    .size func_ov041_0220333c, . - func_ov041_0220333c

