.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.

.global func_ov076_02214034
func_ov076_02214034:
    ldrb r3, [r0, #0x2ce]
    cmp r3, #0x0
    addne r2, r1, r1, lsr #0x1f
    streqb r1, [r0, #0x2ce]
    addne r2, r3, r2, asr #0x1
    strneb r2, [r0, #0x2ce]
    ldrb r2, [r0, #0x2cf]
    cmp r2, #0x0
    addne r1, r1, r1, lsr #0x1f
    addne r1, r2, r1, asr #0x1
    strb r1, [r0, #0x2cf]
    bx lr
.size func_ov076_02214034, . - func_ov076_02214034
