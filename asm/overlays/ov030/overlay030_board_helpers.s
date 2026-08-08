.text

/* Exact fallback; see src/overlays/ov030/overlay030_board_interaction.c for documented portable C. */



    .global func_ov030_021fd680
func_ov030_021fd680:
    ldr r1, [r0, #0x0]
    cmp r1, #0x0
    ldreq r1, [r0, #0x4]
    streq r1, [r0, #0x0]
    bx lr
.size func_ov030_021fd680, .-func_ov030_021fd680
    .global func_ov030_021fd694
func_ov030_021fd694:
    cmp r1, r0
    ldrne r2, [r1, #0x4]
    strne r2, [r0, #0x4]
    ldrne r1, [r1, #0x8]
    strne r1, [r0, #0x8]
    bx lr
.size func_ov030_021fd694, .-func_ov030_021fd694
    .global func_ov030_021fd6ac
func_ov030_021fd6ac:
    stmdb sp!, {r4, lr}
    cmp r1, #0x0
    blt L_021fd6c0
    cmp r1, #0x100
    blt L_021fd6c8
L_021fd6c0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fd6c8:
    cmp r2, #0x0
    blt L_021fd6d8
    cmp r2, #0xc0
    blt L_021fd6e0
L_021fd6d8:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fd6e0:
    and r4, r2, #0x38
    and lr, r1, #0x3f
    mov ip, r2, asr #0x6
    mov r3, r1, asr #0x6
    mov r1, r1, lsl #0x1d
    add r4, r4, lr, asr #0x3
    add r3, r3, ip, lsl #0x2
    ldr ip, [r0, #0x1cc]
    add r0, r4, r3, lsl #0x6
    and r2, r2, #0x7
    add r0, ip, r0, lsl #0x5
    ldr r2, [r0, r2, lsl #0x2]
    mov r0, r1, lsr #0x1b
    mov r0, r2, lsr r0
    and r0, r0, #0xf
    ldmia sp!, {r4, pc}
.size func_ov030_021fd6ac, .-func_ov030_021fd6ac
