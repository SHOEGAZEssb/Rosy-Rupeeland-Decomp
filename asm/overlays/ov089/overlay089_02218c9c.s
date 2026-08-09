.text
; Matching fallback for the portable implementation in src/overlays/ov089/overlay089_recovery.c.

.global func_ov089_02218c9c
func_ov089_02218c9c:
    cmp r1, r0
    ldrne r2, [r1, #0x4]
    strne r2, [r0, #0x4]
    ldrne r1, [r1, #0x8]
    strne r1, [r0, #0x8]
    bx lr
.size func_ov089_02218c9c, . - func_ov089_02218c9c
