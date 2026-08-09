.text
; Matching fallback for the portable implementation in src/overlays/ov080/overlay080_recovery.c.

.global func_ov080_02213954
func_ov080_02213954:
    ldr r0, [r0, #0xd0]
    and r0, r0, #0x80
    bx lr
.size func_ov080_02213954, . - func_ov080_02213954
