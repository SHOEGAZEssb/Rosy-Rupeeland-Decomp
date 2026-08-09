.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.

.global func_ov094_02217bc8
func_ov094_02217bc8:
    ldr r1, [r0, #0x80]
    ldr r0, [r0, #0x7c]
    cmp r1, r0
    movge r0, #0x1
    movlt r0, #0x0
    bx lr
.size func_ov094_02217bc8, . - func_ov094_02217bc8
