    .text
    .extern func_02072b68

/* Exact fallback; see documented portable reconstruction in
 * src/overlays/ov007/overlay007_indexed_mode_start.c. */
    .global func_ov007_021fc19c
func_ov007_021fc19c:
    mov r3, r1, lsr #0x1f
    rsb r2, r3, r1, lsl #0x1e
    add r2, r3, r2, ror #0x1e
    add r0, r0, r1, lsl #0x2
    mov r1, #0x1
    str r1, [r0, #0xa4]
    mov r2, r2, lsl #0x1
    ldr r0, [r0, #0x50]
    add r1, r2, #0x1
    ldr ip, L_021fc1d0
    ldr r0, [r0, #0xc]
    and r1, r1, #0xff
    bx ip
L_021fc1d0: .word func_02072b68
    .size func_ov007_021fc19c, . - func_ov007_021fc19c
