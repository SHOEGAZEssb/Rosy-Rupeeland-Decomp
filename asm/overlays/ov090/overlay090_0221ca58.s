.text
; Matching fallback for the portable implementation in src/overlays/ov090/overlay090_recovery.c.

.global func_ov090_0221ca58
func_ov090_0221ca58:
    strh r1, [r0, #0xc]
    strh r2, [r0, #0xe]
    bx lr
.size func_ov090_0221ca58, . - func_ov090_0221ca58
