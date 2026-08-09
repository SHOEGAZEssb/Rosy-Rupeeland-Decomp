.text
; Matching fallback for the portable implementation in src/overlays/ov056/overlay056_recovery.c.

.global func_ov056_0220f2c8
func_ov056_0220f2c8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r0, r2, asr #0x2
    add r4, r2, r0, lsr #0x1d
    mov ip, r2, lsr #0x1f
    rsb r0, ip, r2, lsl #0x1d
    mov lr, r3, asr #0x2
    add r0, ip, r0, ror #0x1d
    mov r5, r3, lsr #0x1f
    add r2, r3, lr, lsr #0x1d
    rsb r3, r5, r3, lsl #0x1d
    add r3, r5, r3, ror #0x1d
    mov r4, r4, asr #0x3
    mov r5, r2, asr #0x3
    mov r2, r4, lsl #0x5
    add r4, r2, r5, lsl #0x8
    add r2, r0, r0, lsr #0x1f
    mov r3, r3, lsl #0x2
    add r2, r3, r2, asr #0x1
    add r1, r1, r4
    tst r0, #0x1
    ldrb r0, [r2, r1]
    andne r0, r0, #0xf0
    movne r0, r0, lsl #0xc
    movne r0, r0, lsr #0x10
    andeq r0, r0, #0xf
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov056_0220f2c8, . - func_ov056_0220f2c8
