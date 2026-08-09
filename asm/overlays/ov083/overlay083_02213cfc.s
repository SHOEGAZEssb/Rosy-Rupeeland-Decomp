.text
; Matching fallback for the portable implementation in src/overlays/ov083/overlay083_recovery.c.

.global func_ov083_02213cfc
func_ov083_02213cfc:
    ldr r1, [r0, #0x260]
    orr r1, r1, #0x10
    str r1, [r0, #0x260]
    bx lr
.size func_ov083_02213cfc, . - func_ov083_02213cfc
