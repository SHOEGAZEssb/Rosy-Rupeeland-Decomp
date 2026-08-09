.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.

.global func_ov077_022142b4
func_ov077_022142b4:
    ldr r2, [r0, #0x4]
    strb r1, [r2, #0x3a]
    ldr r0, [r0, #0x8]
    strb r1, [r0, #0x3a]
    bx lr
.size func_ov077_022142b4, . - func_ov077_022142b4
