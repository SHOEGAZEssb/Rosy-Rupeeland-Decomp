.text
; Matching fallback for the portable implementation in src/overlays/ov074/overlay074_recovery.c.

.global func_ov074_02211b28
func_ov074_02211b28:
    cmp r0, r1
    ldrne r2, [r1, #0x0]
    strne r2, [r0, #0x0]
    ldrne r1, [r1, #0x4]
    strne r1, [r0, #0x4]
    bx lr
.size func_ov074_02211b28, . - func_ov074_02211b28
