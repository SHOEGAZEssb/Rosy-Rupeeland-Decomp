    .text

/* Exact fallback; see src/overlays/ov017/overlay017_geometry_engine.c. */
.global func_ov017_021fd64c
func_ov017_021fd64c:
    ldr r3, L_021fd678
    mov r1, r1, asr #0x3
    mov ip, r2, asr #0x3
    and r2, r3, r0, asr #0x3
    mov r0, r1, lsl #0x16
    mov r3, ip, lsl #0x16
    orr r1, r2, r0, lsr #0xc
    ldr r0, L_021fd67c
    orr r1, r1, r3, lsr #0x2
    str r1, [r0, #0x0]
    bx lr
L_021fd678: .word 0x3ff
L_021fd67c: .word 0x4000484
    .size func_ov017_021fd64c, . - func_ov017_021fd64c

