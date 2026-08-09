.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.

.global func_ov092_02218394
func_ov092_02218394:
    cmp r1, #0x0
    mov r1, r3, lsl #0x10
    moveq r1, r1, asr #0x10
    addeq r0, r0, r2, lsl #0x2
    streq r1, [r0, #0x3cc]
    movne r1, r1, asr #0x10
    addne r0, r0, r2, lsl #0x2
    strne r1, [r0, #0x5cc]
    bx lr
.size func_ov092_02218394, . - func_ov092_02218394
