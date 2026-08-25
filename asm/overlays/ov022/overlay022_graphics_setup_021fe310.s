    .text
/* Exact fallback; see src/overlays/ov022/overlay022_graphics_setup.c. */
    .extern TitleScrollValue_Advance
    .extern func_ov046_0220c1d8

.global func_ov022_021fe310
func_ov022_021fe310:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x15
    movs r0, r0, asr #0x1f
    beq L_021fe374
    ldr r0, [r4, #0x35c]
    cmp r0, #0x0
    beq L_021fe33c
    bl func_ov046_0220c1d8
    b L_021fe354
L_021fe33c:
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    ldr r0, [r4, #0x48]
    bic r1, r1, #0x1f00
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
L_021fe354:
    ldr r3, L_021fe37c
    ldr r1, [r4, #0x4c]
    ldr r2, [r3, #0x0]
    add r0, r4, #0x378
    bic r2, r2, #0x1f00
    orr r1, r2, r1, lsl #0x8
    str r1, [r3, #0x0]
    bl TitleScrollValue_Advance
L_021fe374:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fe37c: .word 0x4001000
.size func_ov022_021fe310, . - func_ov022_021fe310
